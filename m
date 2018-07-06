From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v2 0/9] Allwinner H6 USB support
Date: Fri,  6 Jul 2018 23:37:56 +0800
Message-ID: <20180706153805.25842-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBMM273MQKGQEPDUEHRA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset introduces support for the USB ports (both USB2 and USB3)
on the Allwinner H6 SoC.

This revision adds the USB2 support, and places it before the USB3
support. So only the USB3 part will have changelog in this revision.

The first 5 PATCHes are the USB2 part, and the latter 4 PATCHes are the
USB3 part.

PATCH 1, 2, 6, 7 should go through the PHY tree, and the remaining
patches should go through the armsoc tree via sunxi tree.

Icenowy Zheng (9):
  phy: sun4i-usb: add support for missing USB PHY index
  phy: sun4i-usb: add support for H6 USB2 PHY
  arm64: allwinner: dts: h6: add USB2-related device nodes
  arm64: allwinner: dts: h6: add USB Vbus regulator
  arm64: allwinner: dts: h6: enable USB2 on Pine H64
  dt-bindings: phy: add binding for Allwinner USB3 PHY
  phy: allwinner: add phy driver for USB3 PHY on Allwinner H6 SoC
  arm64: allwinner: dts: h6: add USB3 device nodes
  arm64: allwinner: dts: h6: enable USB3 port on Pine H64

 .../bindings/phy/sun50i-usb3-phy.txt          |  24 +++
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  46 +++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 114 ++++++++++
 drivers/phy/allwinner/Kconfig                 |  13 ++
 drivers/phy/allwinner/Makefile                |   1 +
 drivers/phy/allwinner/phy-sun4i-usb.c         |  26 ++-
 drivers/phy/allwinner/phy-sun50i-usb3.c       | 194 ++++++++++++++++++
 7 files changed, 416 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
 create mode 100644 drivers/phy/allwinner/phy-sun50i-usb3.c

-- 
2.17.1
