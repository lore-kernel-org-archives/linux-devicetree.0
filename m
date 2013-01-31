From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC v5 0/2] V4L device tree bindings and OF helpers
Date: Thu, 31 Jan 2013 18:18:56 +0100
Message-ID: <1359652738-1544-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: g.liakhovetski@gmx.de, linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, kyungmin.park@samsung.com, swarren@wwwdotorg.org, rob.herring@calxeda.com, thomas.abraham@linaro.org, t.figa@samsung.com, myungjoo.ham@samsung.com, sw0312.kim@samsung.com, prabhakar.lad@ti.com, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

This iteration mostly addresses comments from Laurent, regarding the
bindings documentation. It introduces a common 'ports' node grouping
all 'port' nodes, which could be used to resolve node addressing
conflict when a device has a bus with corresponding children nodes.

The changes in second patch are not significant, mostly rewrite
of v4l2_of_get_remote_parent() function.

Guennadi, I've added Samsung copyright notice in the parser code.
Please let me know if it is OK with you or not. If required I could
extract my changes into a separate patch.

I have also dropped the Reviewed-by/Acked-by tags, as the changes
this time were not trivial. If those still apply please reply and
I'll re-add them.

Guennadi Liakhovetski (2):
  [media] Add common video interfaces OF bindings documentation
  [media] Add a V4L2 OF parser

 .../devicetree/bindings/media/video-interfaces.txt |  216 +++++++++++++++++
 drivers/media/v4l2-core/Makefile                   |    3 +
 drivers/media/v4l2-core/v4l2-of.c                  |  251 ++++++++++++++++++++
 include/media/v4l2-of.h                            |   98 ++++++++
 4 files changed, 568 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/video-interfaces.txt
 create mode 100644 drivers/media/v4l2-core/v4l2-of.c
 create mode 100644 include/media/v4l2-of.h

--
1.7.9.5
