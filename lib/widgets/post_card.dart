import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_ui/models/post_model.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  width: double.infinity,
                  post.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 16,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 8, top: 8, bottom: 8, right: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFF735F54).withOpacity(0.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(3, 3),
                      )
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        post.imageUrl,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              post.name,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                  color: Colors.blue, shape: BoxShape.circle),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 8,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          post.username,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF735F54).withOpacity(0.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: const Offset(3, 3),
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.more_vert, color: Colors.white),
              ),
            ),
            Positioned(
              bottom: 55,
              left: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "asset/fav1.svg",
                    height: 24,
                    color: Colors.white54,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    post.likeCount.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SvgPicture.asset(
                    height: 24,
                    "asset/comment.svg",
                    color: Colors.white54,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    post.likeCount.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SvgPicture.asset(
                    "asset/share.svg",
                    height: 26,
                    color: Colors.white54,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    post.likeCount.toString(),
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: post.description,
                      style: const TextStyle(
                        color: Colors.white38,
                      ),
                    ),
                    const TextSpan(
                      text: "\n",
                    ),
                    TextSpan(
                      text: post.tags,
                      style: const TextStyle(
                        color: Colors.white38,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
