From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 0/4] drm/tinydrm: Add support for Pervasive Displays RePaper monochrome e-ink panels
Date: Fri,  2 Jun 2017 13:49:11 +0200
Message-ID: <1496404155-8344-1-git-send-email-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds support for the 1.44", 1.9", 2.0" and 2.7" Pervasive Diplays
monochrome e-ink panels. The code was taken from the userspace driver
available through repaper.org.

Monochrome
Since drm doesn't have support for monochrome, I have added a helper to
convert XRGB8888 to greyscale8. XRGB8888 is very common so that's why I
chose that format, but maybe some YUV format is better suited, I don't
know. There are some greyscale e-ink panels, so that's why I chose
greyscale instead of going directly to monochrome.

I have hacked together a python drm library to make it easy to use these
displays, mainly targeted at the maker community:
https://github.com/notro/pydrm

Noralf.

Noralf Trønnes (4):
  of: Add vendor prefix for Pervasive Displays
  dt-bindings: Add Pervasive Displays RePaper bindings
  drm/tinydrm: Add tinydrm_xrgb8888_to_gray8() helper
  drm/tinydrm: Add RePaper e-ink driver

 .../devicetree/bindings/display/repaper.txt        |   52 +
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 MAINTAINERS                                        |    6 +
 drivers/gpu/drm/tinydrm/Kconfig                    |   12 +
 drivers/gpu/drm/tinydrm/Makefile                   |    1 +
 drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c     |   74 +-
 drivers/gpu/drm/tinydrm/repaper.c                  | 1095 ++++++++++++++++++++
 include/drm/tinydrm/tinydrm-helpers.h              |    1 +
 8 files changed, 1240 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/repaper.txt
 create mode 100644 drivers/gpu/drm/tinydrm/repaper.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
