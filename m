From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 00/13] ARM: lpc32xx: various minor fixes and clean-ups
Date: Tue, 29 Jan 2019 21:20:36 +0200
Message-ID: <20190129192049.11223-1-vz@mleia.com>
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
To: Sylvain Lemieux <slemieux.tyco@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The changeset consists of a number of minor clean-ups and fixes for
NXP LPC32xx SoC support, likely the most noticeable change is stripping
of platform data for PL180 SD/MMC controller and PL111 LCD controller,
originally both given configurations are Phytec phyCORE-LPC3250 board
specific, and now the right description is added to the correspondent
board dts file. The LCD controller is proven to work with PL111 DRM
driver, this justifies the correctness of switching the platform from
a legacy fbdev to the new DRM driver.

Fixed voltage regulator and DRM simple panel driver should be enabled
by default in NXP LPC32xx defconfig file to get better support of
Phytec phyCORE-LPC3250 board.

Vladimir Zapolskiy (13):
  ARM: defconfig: lpc32xx: enable fixed voltage regulator support
  ARM: defconfig: lpc32xx: enable DRM simple panel driver
  ARM: dts: lpc32xx: fix ARM PrimeCell LCD controller variant
  ARM: dts: lpc32xx: fix ARM PrimeCell LCD controller clocks property
  ARM: dts: lpc32xx: phy3250: fix SD card regulator voltage
  ARM: dts: lpc32xx: remove inclusion of deprecated skeleton.dtsi
  ARM: dts: lpc32xx: phy3250: remove regulators umbrella device node
  ARM: dts: lpc32xx: phy3250: setup LCD controller to panel interface
  ARM: dts: lpc32xx: phy3250: add unit address to memory device node
  ARM: dts: lpc32xx: ea3250: add unit address to memory device node
  ARM: dts: lpc32xx: ea3250: beautify gpio keys children nodes
  ARM: lpc32xx: remove platform data of ARM PL180 SD/MMC controller
  ARM: lpc32xx: remove platform data of ARM PL111 LCD controller

 arch/arm/boot/dts/lpc3250-ea3250.dts  | 20 +++---
 arch/arm/boot/dts/lpc3250-phy3250.dts | 87 ++++++++++++++++-----------
 arch/arm/boot/dts/lpc32xx.dtsi        | 12 ++--
 arch/arm/configs/lpc32xx_defconfig    |  3 +
 arch/arm/mach-lpc32xx/phy3250.c       | 84 --------------------------
 5 files changed, 75 insertions(+), 131 deletions(-)

-- 
2.20.1
