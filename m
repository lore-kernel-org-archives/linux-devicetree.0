From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/4] libfdt: Add support for device tree overlays
Date: Fri, 27 May 2016 10:28:44 +0200
Message-ID: <1464337729-7821-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

The device tree overlays are a great solution to the issue raised by
the bunch expandable boards we find everywhere these days, like the
Beaglebone, Raspberry Pi or CHIP.

Although for now Linux is the only available tool that can deal with
overlays, some other components like bootloaders or user-space tools
might need to apply these overlays on top of a base device tree.

To address these use cases, we introduce a new function to the libfdt,
fdt_overlay_apply, that does just that.

You can find a test program here: http://code.bulix.org/792zum-99476?raw

Let me know what you think!
Maxime

Maxime Ripard (3):
  libfdt: Add iterator over properties
  libfdt: Add max phandle retrieval function
  libfdt: Add overlay application function

Thierry Reding (1):
  libfdt: Add a subnodes iterator macro

 libfdt/Makefile.libfdt |   2 +-
 libfdt/fdt_overlay.c   | 414 +++++++++++++++++++++++++++++++++++++++++++++++++
 libfdt/fdt_ro.c        |  15 ++
 libfdt/libfdt.h        |  92 +++++++++++
 libfdt/libfdt_env.h    |   1 +
 5 files changed, 523 insertions(+), 1 deletion(-)
 create mode 100644 libfdt/fdt_overlay.c

-- 
2.8.2
