From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree fixes for 3.13
Date: Thu, 05 Dec 2013 22:24:46 -0600
Message-ID: <52A1518E.1080207@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull. Just some binding documentation updates and DT maintainers
updates. 

Rob

The following changes since commit 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:

  Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/dt-fixes-for-3.13

for you to fetch changes up to 2c0e641a963d073d60cb63c24614c642b6f64b21:

  dt: binding: reword PowerPC 8xxx GPIO documentation (2013-12-03 00:01:03 -0600)

----------------------------------------------------------------
- Various DT binding documentation updates.
- Add Kumar Gala and remove Stephen Warren as DT binding maintainers.

----------------------------------------------------------------
Chanwoo Choi (1):
      hwmon: ntc_thermistor: Fix typo (pullup-uV -> pullup-uv)

Fabio Estevam (1):
      Documentation: net: fsl-fec.txt: Add phy-supply entry

Gerhard Sittig (1):
      dt: binding: reword PowerPC 8xxx GPIO documentation

Kumar Gala (1):
      MAINTAINERS: Add Kumar to Device Tree Binding maintainers group

Laurent Pinchart (1):
      clk: exynos: Fix typos in DT bindings documentation

Rob Herring (1):
      dt-bindings: add ARMv8 PMU binding

Sricharan R (1):
      ARM: dts: doc: Document missing binding for omap5-mpu

Stephen Warren (2):
      MAINTAINERS: remove swarren from DT bindings
      ARM: tegra: delete nvidia,tegra20-spi.txt binding

Thierry Reding (1):
      of: Add vendor prefix for LG Corporation

Wei Ni (1):
      of: add vendor prefix for GMT

 Documentation/devicetree/bindings/arm/omap/mpu.txt |  8 +++
 Documentation/devicetree/bindings/arm/pmu.txt      |  1 +
 .../devicetree/bindings/arm/samsung/exynos-adc.txt |  2 +-
 .../devicetree/bindings/clock/exynos4-clock.txt    |  2 +-
 .../devicetree/bindings/clock/exynos5250-clock.txt |  2 +-
 .../devicetree/bindings/clock/exynos5420-clock.txt |  2 +-
 .../devicetree/bindings/clock/exynos5440-clock.txt |  2 +-
 .../devicetree/bindings/gpio/8xxx_gpio.txt         | 66 +++++++++++++---------
 Documentation/devicetree/bindings/net/fsl-fec.txt  |  2 +
 .../devicetree/bindings/spi/nvidia,tegra20-spi.txt |  5 --
 .../devicetree/bindings/vendor-prefixes.txt        |  2 +
 MAINTAINERS                                        |  2 +-
 12 files changed, 59 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/nvidia,tegra20-spi.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
