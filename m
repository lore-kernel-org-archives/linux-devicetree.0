From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH 0/3] ARM: dts: vf610: USB/GPIO fixes
Date: Tue,  4 Nov 2014 14:07:07 +0100
Message-ID: <1415106430-6271-1-git-send-email-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

This patchset collects some vf610 device tree fixes. The first patch
was part of the "vf610: Add GPIO support" patchset. GPIO support is
merged by know, so I rebased that on top of your for-next branch.

The second patch is a USB fix I uncovered while testing the 3rd patch,
which adds regulators, mainly for proper USB VBUS support, as we have
them on our carrier boards.

Stefan Agner (3):
  ARM: dts: vf610: use new GPIO support
  ARM: dts: vf610: enable USB misc/phy nodes where necessary
  ARM: dts: vf-colibri: add USB regulators

 arch/arm/boot/dts/vf-colibri-eval-v3.dtsi | 45 ++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/vf-colibri.dtsi         | 37 +++++++++++++++++++++++++
 arch/arm/boot/dts/vf610-twr.dts           |  9 +++++++
 arch/arm/boot/dts/vfxxx.dtsi              |  1 +
 4 files changed, 91 insertions(+), 1 deletion(-)

-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
