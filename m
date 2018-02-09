From: Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 0/3] regulator da9062: add and make use of map_mode support
Date: Fri,  9 Feb 2018 11:05:18 +0100
Message-ID: <1518170721-28198-1-git-send-email-chf.fritz@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Christian Hemp <c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds of_map_mode support to regulator da9062, documents its
bindings and makes use of it in dts phycore-imx6.

Christoph Fritz (3):
  regulator: da9062: add of_map_mode support for bucks
  dt-bindings: regulator: describe da9062's regulator modes
  ARM: dts: phycore-imx6: set buck regulator modes explicitly

 Documentation/devicetree/bindings/mfd/da9062.txt  |  8 ++++++++
 arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi |  4 ++++
 drivers/regulator/da9062-regulator.c              | 20 ++++++++++++++++++++
 3 files changed, 32 insertions(+)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
