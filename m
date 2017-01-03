From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH 0/4] Add support for the USB OTG function of Allwinner V3s
Date: Tue,  3 Jan 2017 23:25:30 +0800
Message-ID: <20170103152534.20118-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Kishon Vijay Abraham I <kishon@ti.com>, Bin Liu <b-liu@ti.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.xyz>
List-Id: devicetree@vger.kernel.org

Allwinner V3s SoC come with a USB OTG controller, which is a bind of a Mentor
Graphics MUSB Dual-role controller and a private USB PHY.

Both the MUSB and the USB PHY slightly changed. (The MUSB is similar to the
one in the popular SBC SoC H3).

Add support for them.

The device tree patches depends on my preivous patchset, but the phy and musb
patches are independent (the device tree patches depend on them).

The MUSB patch may be picked for use on H3.

The clock of the USB part seems to need some hack in the U-Boot, they are at
my WIP u-boot repo:
https://github.com/Icenowy/u-boot-1/tree/v3s .

Icenowy Zheng (4):
  phy: sun4i-usb: add support for V3s USB PHY
  musb: sunxi: add support for the variant in H3/V3s SoC
  ARM: dts: sunxi: add usb_otg and usbphy node for V3s SoC
  ARM: dts: sun8i: add OTG function to Lichee Pi Zero

 .../devicetree/bindings/phy/sun4i-usb-phy.txt      |  1 +
 .../bindings/usb/allwinner,sun4i-a10-musb.txt      |  4 +--
 arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts      | 10 +++++++
 arch/arm/boot/dts/sun8i-v3s.dtsi                   | 27 +++++++++++++++++
 drivers/phy/phy-sun4i-usb.c                        | 14 ++++++++-
 drivers/usb/musb/sunxi.c                           | 35 ++++++++++++++++++++--
 6 files changed, 86 insertions(+), 5 deletions(-)

-- 
2.11.0
