From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 0/5] Allwinner H6 USB3 support
Date: Mon,  7 May 2018 23:18:12 +0800
Message-ID: <20180507151817.55663-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB5W4YHLQKGQEPGVIUZI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset contains USB3 support for Allwinner H6 SoC (DWC3 with a custom PHY).

The first patch adds the PHY driver, and the second/third patch adds
compatible to adapt DWC3 platform glue to Allwinner platform. The last
two patches are DT changes.

Icenowy Zheng (5):
  phy: allwinner: add phy driver for USB3 PHY on Allwinner H6 SoC
  dt-bindings: usb: add binding for the DWC3 controller on Allwinner SoC
  usb: dwc3: of-simple: Add compatible for Allwinner H6 platform
  arm64: allwinner: h6: add USB3 device nodes
  arm64: allwinner: h6: enable USB3 port on Pine H64

 .../bindings/phy/sun50i-usb3-phy.txt          |  24 +++
 .../bindings/usb/allwinner,dwc3.txt           |  39 ++++
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  23 +++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  38 ++++
 drivers/phy/allwinner/Kconfig                 |  13 ++
 drivers/phy/allwinner/Makefile                |   1 +
 drivers/phy/allwinner/phy-sun50i-usb3.c       | 195 ++++++++++++++++++
 drivers/usb/dwc3/dwc3-of-simple.c             |   1 +
 8 files changed, 334 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
 create mode 100644 Documentation/devicetree/bindings/usb/allwinner,dwc3.txt
 create mode 100644 drivers/phy/allwinner/phy-sun50i-usb3.c

-- 
2.17.0
