From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH 0/3] rockchip dwc2: Turn off vbus on shutdown
Date: Wed,  5 Apr 2017 16:06:09 +0200
Message-ID: <20170405140613.4444-1-sjoerd.simons@collabora.co.uk>
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
To: John Youn <johnyoun@synopsys.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Li <ayaka@soulik.info>, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

A board I'm working on seems to get its usb->sata bridge in a rather
confused state during reboot, which unfortunately can't be recovered on
the next boot (only hard reset helps).

This seems to be avoidable by turning off vbus, which turns the internal
usb hub off on shutdown.

First patch add the ability to describe vbus regulators for the rockchip
usb phy, second one starts using that on the rock2 square board and
while the final one adds the actual workaround of turning off the phy on
shutdown.


Sjoerd Simons (3):
  phy: rockchip-usb: Add vbus regulator support.
  ARM: dts: rockchip: rock2: Setup usb vbus-supply
  usb: dwc2: Power off the phy on shutdown

 .../devicetree/bindings/phy/rockchip-usb-phy.txt      |  1 +
 arch/arm/boot/dts/rk3288-rock2-square.dts             |  8 ++++----
 drivers/phy/phy-rockchip-usb.c                        | 19 +++++++++++++++++++
 drivers/usb/dwc2/platform.c                           |  3 +++
 4 files changed, 27 insertions(+), 4 deletions(-)

-- 
2.11.0
