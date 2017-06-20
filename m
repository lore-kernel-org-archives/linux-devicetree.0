From: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v6 0/4] nvmem: upstream snvs_lpgpr driver
Date: Tue, 20 Jun 2017 06:40:55 +0200
Message-ID: <20170620044059.16113-1-o.rempel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guy Shapiro <guy.shapiro-2HKgp+mgmS5l57MIdRCFDg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

changes v6:
 - check if device is writable by reading GPR_SL and GPR_HL bits
 - use regmap_bulk_* functions instead of while() { regmap_read/write }
 - add patch for imx6ul

changes v5:
 - use dcfg->offset instead of priv->offset.

changes v4:
 - change dependencies in Kconfig
 - remove unused includes and order them alphabetically
 - set MODULE_LICENSE = GPL v2
 - remove unused int err variable

changes v3:
 - remove regmap and offset properties.

changes v2:
 - correct typos: Registe, parrent...

Oleksij Rempel (4):
  nvmem: dt: document SNVS LPGPR binding
  nvmem: add snvs_lpgpr driver
  ARM: dts: imx6qdl.dtsi: add "fsl,imx6q-snvs-lpgpr" node
  ARM: imx6ul: add "fsl,imx6ul-snvs-lpgpr" node

 .../devicetree/bindings/nvmem/snvs-lpgpr.txt       |  20 +++
 arch/arm/boot/dts/imx6qdl.dtsi                     |   4 +
 arch/arm/boot/dts/imx6ul.dtsi                      |   4 +
 drivers/nvmem/Kconfig                              |  10 ++
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/snvs_lpgpr.c                         | 156 +++++++++++++++++++++
 6 files changed, 196 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
 create mode 100644 drivers/nvmem/snvs_lpgpr.c

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
