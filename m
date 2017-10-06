From: Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH v2 0/3] add UniPhier efuse support
Date: Fri,  6 Oct 2017 14:02:57 +0900
Message-ID: <1507266180-11840-1-git-send-email-hayashibara.keiji@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, owada.kiyoshi-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds support for eFuse implemented on UniPhier LD20 SoCs.
The eFuse device is under soc-glue and this register implements as read only.

patch V1
https://lkml.org/lkml/2017/8/31/880

Changes between V2 and V1
=========================
1. Fix sparse warnings
2. Changed to implement without regmap
3. Convert devm_kzalloc to stack
4. Divide efuse into two areas in devicetree
5. Remove .owner settings of struct nvmem_config
6. Remove enable of CONFIG_UNIPHIER_EFUSE in defconfig
7. Other minor fixes

Keiji Hayashibara (3):
  dt-bindings: nvmem: add description for UniPhier eFuse
  nvmem: uniphier: add UniPhier eFuse driver
  arm64: dts: uniphier: add efuse node for LD20

 .../devicetree/bindings/nvmem/uniphier-efuse.txt   | 49 +++++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi   | 18 ++++
 drivers/nvmem/Kconfig                              | 11 +++
 drivers/nvmem/Makefile                             |  2 +
 drivers/nvmem/uniphier-efuse.c                     | 97 ++++++++++++++++++++++
 5 files changed, 177 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/uniphier-efuse.txt
 create mode 100644 drivers/nvmem/uniphier-efuse.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
