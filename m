From: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH v2 0/2] add thermal nodes for UniPhier SoCs
Date: Wed, 28 Jun 2017 19:18:27 +0900
Message-ID: <1498645109-25985-1-git-send-email-hayashi.kunihiko@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds thermal nodes for UniPhier PXs2 and LD20 SoCs.

Changes in v1:
- separate from driver's patchset[1]
- add cooling-maps nodes on the device tree
- fix an interrupt trigger to set 'level-triggered' according to
  hardware specification
- bring up threshold temperature for LD20 according to the spec sheet
- add cpuN labels for reference in cooling-device property on PXs2 dts

[1] https://lkml.org/lkml/2017/6/28/170

Kunihiko Hayashi (2):
  ARM: dts: uniphier: add nodes of thermal monitor and thermal zone for
    PXs2
  arm64: dts: uniphier: add nodes of thermal monitor and thermal zone
    for LD20

 arch/arm/boot/dts/uniphier-pxs2.dtsi             | 43 +++++++++++++++++++++---
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 40 ++++++++++++++++++++++
 2 files changed, 79 insertions(+), 4 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
