From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: [PATCH 0/4] Enable USB OTG on Allwinner H3 and two boards
Date: Tue, 17 Jan 2017 03:14:45 +0800
Message-ID: <20170116191449.50397-1-icenowy@aosc.xyz>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBWFX6TBQKGQEZ4RN7OY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset depends on the following patch (only the patch, as it adds the
MUSB controller used in H3, the patchset itself is for V3s):
http://lists.infradead.org/pipermail/linux-arm-kernel/2017-January/476387.html

This patchset enables USB OTG ports on Orange Pi Zero and One board, using the
SoC's MUSB controller.

The mode of PHY0 is currently set to MUSB mode, as supporting EHCI/OHCI will
cost more time and code; but MUSB can supply both host and peripheral mode.

OTG function is only enabled for these two boards, as they're the only H3/H2+
boards that I have.

I think other boards' owners can easily enable their boards' OTG function with
these patches.

Icenowy Zheng (4):
  phy: sun4i-usb: support PHY0 on H3 in MUSB mode
  ARM: dts: sun8i: add MUSB node to H3 SoC
  ARM: dts: sun8i: enable USB OTG for Orange Pi Zero board
  ARM: dts: sun8i: enable USB OTG on Orange Pi One board

 arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts |  6 ++++++
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts       | 12 +++++++++++
 arch/arm/boot/dts/sun8i-h3.dtsi                   | 13 ++++++++++++
 drivers/phy/phy-sun4i-usb.c                       | 25 ++++++++---------------
 4 files changed, 40 insertions(+), 16 deletions(-)

-- 
2.11.0
