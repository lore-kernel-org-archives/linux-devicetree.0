From: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH 0/4] usb: dwc3: add UniPhier dwc3 glue layer support
Date: Tue, 23 Jan 2018 22:00:50 +0900
Message-ID: <1516712454-2915-1-git-send-email-hayashi.kunihiko@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series adds support for DWC3 glue layer implemented on
UniPhier SoCs. It supports PXs2 and LD20 SoCs.

In case of LD20, since some trimming values for PHY initialization
are included in nvmem, This series includes the way to access to
nvmem and bitmap definitions of nvmem in DT.

Thank you,
---

Kunihiko Hayashi (4):
  dt-bindings: dwc3: add binding documentation for UniPhier dwc3 glue
    driver
  usb: dwc3: add dwc3 glue layer for UniPhier SoCs
  ARM: dts: uniphier: add dwc3 usb node for PXs2
  arm64: dts: uniphier: add dwc3 usb node for LD20

 .../devicetree/bindings/usb/dwc3-uniphier.txt      |  58 +++
 arch/arm/boot/dts/uniphier-pxs2-gentil.dts         |   8 +
 arch/arm/boot/dts/uniphier-pxs2-vodka.dts          |   4 +
 arch/arm/boot/dts/uniphier-pxs2.dtsi               |  43 ++
 .../boot/dts/socionext/uniphier-ld20-global.dts    |   4 +
 .../arm64/boot/dts/socionext/uniphier-ld20-ref.dts |   4 +
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi   |  77 +++
 drivers/usb/dwc3/Kconfig                           |   9 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/dwc3-uniphier.c                   | 554 +++++++++++++++++++++
 10 files changed, 762 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/dwc3-uniphier.txt
 create mode 100644 drivers/usb/dwc3/dwc3-uniphier.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
