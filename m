From: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH v2 0/2] add ethernet nodes for UniPhier SoCs
Date: Wed, 14 Feb 2018 18:30:27 +0900
Message-ID: <1518600629-14317-1-git-send-email-hayashi.kunihiko@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds ethernet nodes for UniPhier Pro4, PXs2, LD6b, LD11, LD20 SoCs
and the boards.

Changes since v1:
- move common descriptions to .dtsi files
- rename labels of the ethernet nodes to "eth"

Kunihiko Hayashi (2):
  ARM: dts: uniphier: add AVE ethernet node
  arm64: dts: uniphier: add AVE ethernet node

 arch/arm/boot/dts/uniphier-ld6b-ref.dts                | 11 +++++++++++
 arch/arm/boot/dts/uniphier-pro4-ace.dts                | 11 +++++++++++
 arch/arm/boot/dts/uniphier-pro4-ref.dts                | 11 +++++++++++
 arch/arm/boot/dts/uniphier-pro4-sanji.dts              | 11 +++++++++++
 arch/arm/boot/dts/uniphier-pro4.dtsi                   | 18 ++++++++++++++++++
 arch/arm/boot/dts/uniphier-pxs2-gentil.dts             | 11 +++++++++++
 arch/arm/boot/dts/uniphier-pxs2-vodka.dts              | 11 +++++++++++
 arch/arm/boot/dts/uniphier-pxs2.dtsi                   | 18 ++++++++++++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts | 11 +++++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts    | 11 +++++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi       | 16 ++++++++++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts | 13 +++++++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts    | 11 +++++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi       | 18 ++++++++++++++++++
 14 files changed, 182 insertions(+)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
