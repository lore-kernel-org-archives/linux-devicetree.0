From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v5 0/3] Add Combo PHY driver for HiSilicon STB SoCs
Date: Mon, 30 Oct 2017 23:15:54 +0800
Message-ID: <1509376557-7187-1-git-send-email-shawnguo@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

It adds device tree bindings and driver support for Combo PHY device
which can be found on HiSilicon STB SoCs.

Changes for v5:
 - Add bindings doc for Hi3798CV200 peripheral controller, and refer to
   the bindings of this parent node in combphy bindings doc.

Changes for v4:
 - Instead of relying on device id, add a new property
   hisilicon,fixed-mode for combphy device that doesn't support mode
   select but a fixed phy mode.
 - Move combphy mode select register bits definition to device tree, as
   it may vary from one device to another.

Changes for v3:
 - Make combphy device be child of peripheral controller and use 'reg'
   property for mapping combphy configuration registers.
 - Kill "hisilicon,peripheral-syscon" property, since parent node is
   just the syscon controller now.
 - Check combphy id to handle the quirk that combphy0 can not configure
   mode but always works in USB3 mode.
 - Unify phy .init and .exit hooks for different combphy instances and
   work modes, as the only quirk we need to handle is that combphy0 can
   only work in USB3 mode.
 - Better naming for clock and reset, 'ref' to 'ref_clk', 'por' to
   'por_rst'.

Changes for v2:
 - Move DT bindings into a separate patch.
 - Drop the spurious newline from drivers/phy/Makefile.
 - Use the phy type defines in dt-bindings/phy/phy.h.
 - Use PTR_ERR_OR_ZERO() for checking return from
   devm_of_phy_provider_register().
 - Add USB3 phy support.

Jianguo Sun (2):
  dt-bindings: add bindings doc for hi3798cv200 combphy
  phy: add combo phy driver for HiSilicon STB SoCs

Shawn Guo (1):
  dt-bindings: hisilicon: add doc for Hi3798CV200 peripheral controller

 .../bindings/arm/hisilicon/hisilicon.txt           |  23 ++
 .../bindings/phy/phy-hi3798cv200-combphy.txt       |  59 +++++
 drivers/phy/hisilicon/Kconfig                      |   9 +
 drivers/phy/hisilicon/Makefile                     |   1 +
 drivers/phy/hisilicon/phy-histb-combphy.c          | 289 +++++++++++++++++++++
 5 files changed, 381 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-hi3798cv200-combphy.txt
 create mode 100644 drivers/phy/hisilicon/phy-histb-combphy.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
