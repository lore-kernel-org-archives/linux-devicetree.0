From: Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/5] ARM: sunxi: Add support for USB OTG PHY
Date: Mon, 10 Nov 2014 19:55:05 +0100
Message-ID: <cover.1415645258.git.rbyshko@gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJMXIOHZIFBBG4UQSRQKGQEAUZERJI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

There is already support for two USB phys, which are used for
USB host controllers on Allwinner SoC aka sunxi.

This patch series add support for the USB OTG phy (aka phy0).

The code has been tested on Allwinner A20 aka sun7i (Cubietruck).

Best regards,
Roman Byshko

Changes since v1:
	* Improved comment about 45 Ohm resistor calibration
	* Added Signed-off-by to all patches

Roman Byshko (5):
  phy: sun4i: add support for USB phy0
  ARM: dtsi: sunxi: add common VBUS regulator
  ARM: sun7i: dtsi: add support for usbphy0
  ARM: dts: sun7i: Cubietruck: override regulator pin
  ARM: dts: sun7i: Cubietruck: add power supply regulator for USB OTG
    VBUS

 arch/arm/boot/dts/sun7i-a20-cubietruck.dts     | 14 ++++++++++++++
 arch/arm/boot/dts/sun7i-a20.dtsi               |  4 ++--
 arch/arm/boot/dts/sunxi-common-regulators.dtsi | 19 +++++++++++++++++++
 drivers/phy/phy-sun4i-usb.c                    |  9 ++++++---
 4 files changed, 41 insertions(+), 5 deletions(-)

-- 
2.1.2
