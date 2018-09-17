From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC v4 0/2] vfio: platform: Add generic reset controller support
Date: Mon, 17 Sep 2018 18:39:53 +0200
Message-ID: <20180917163955.19023-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Eric Auger <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi all,

This patch series implements generic reset controller support for
vfio-platform, for devices that are connected to an SoC-internal reset
controller and can be reset in a generic way.  This avoids having to
write/change a vfio-specific reset driver for each and every device to be
passed-through to a guest.

It consists of two patches:
  - The first patch enhances the reset controller subsystem to add support
    for dedicated resets.
    This addresses the issue that even reset_control_get_exclusive() does
    not guarantee that we have an exclusive wire between the device and
    the reset controller.
  - The second patch enhances vfio-platform to add generic reset controller
    support.

Changes compared to v3:
  - Add Reviewed-by,
  - New patch "reset: Add support for dedicated reset controls",
  - Use new RFC reset_control_get_dedicated() instead of
    of_reset_control_get_exclusive(), to (a) make it more generic, and
    (b) make sure the reset returned is really a dedicated reset, and
    does not affect other devices,
  - Drop vfio-platform reset leak fix, which has been applied.

Changes compared to v2:
  - Add Reviewed-by,
  - Merge similar checks in vfio_platform_has_reset().

Changes compared to v1:
  - Add Reviewed-by,
  - Don't store error values in vdev->reset_control,
  - Use of_reset_control_get_exclusive() instead of
    __of_reset_control_get(),
  - Improve description.

This has been tested on R-Car H3/Salvator-XS:
  - SATA can be exported, as it has a dedicated reset,
  - PWM1 cannot, as its reset is shared with all other PWM modules:
    "VFIO: No reset function found for device e6e31000.pwm".

Thanks for your comments!

Geert Uytterhoeven (2):
  [RFC] reset: Add support for dedicated reset controls
  [RFC] vfio: platform: Add generic reset controller support

 drivers/reset/core.c                          | 76 ++++++++++++++++---
 drivers/vfio/platform/vfio_platform_common.c  | 20 ++++-
 drivers/vfio/platform/vfio_platform_private.h |  1 +
 include/linux/reset.h                         | 60 ++++++++++-----
 4 files changed, 126 insertions(+), 31 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
