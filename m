From: Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 0/7] add syscon driver based on regmap for general
 registers access
Date: Mon, 27 Aug 2012 15:24:38 +0800
Message-ID: <1346052285-4344-1-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series mainly adds an syscon driver which is used to access
general system controller registers like FSL IOMUXC GPR and ANATOP,
after that, we convert all the exist private access general registers code to use
standard API from regmap to access registers.
Finally we remove the old mfd anatop driver which is only for anatop register
access.

The patch series is based on linus's tree 3.6-rc3 since commit 9160338.

Dong Aisheng (7):
  mfd: add syscon driver based on regmap
  ARM: imx6q: add iomuxc gpr support into syscon
  ARM: imx6q: add anatop support into syscon
  regulator: anatop-regulator: convert to use syscon to access anatop
    register
  ARM: imx6q: convert to use syscon to access anatop registers
  ARM: dts: imx6q: add simple-bus compatible string for anatop
  mfd: anatop-mfd: remove anatop driver

 .../devicetree/bindings/mfd/imx-syscon.txt         |   11 +
 arch/arm/boot/dts/imx6q.dtsi                       |   15 +-
 arch/arm/mach-imx/Kconfig                          |    2 +-
 arch/arm/mach-imx/mach-imx6q.c                     |   43 ++--
 drivers/mfd/Kconfig                                |   13 +-
 drivers/mfd/Makefile                               |    2 +-
 drivers/mfd/anatop-mfd.c                           |  124 --------
 drivers/mfd/syscon.c                               |  169 +++++++++++
 drivers/regulator/Kconfig                          |    2 +-
 drivers/regulator/anatop-regulator.c               |   25 +-
 include/linux/fsl/imx6q-iomuxc-gpr.h               |  319 ++++++++++++++++++++
 include/linux/mfd/anatop.h                         |   40 ---
 include/linux/mfd/syscon.h                         |   22 ++
 13 files changed, 576 insertions(+), 211 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/imx-syscon.txt
 delete mode 100644 drivers/mfd/anatop-mfd.c
 create mode 100644 drivers/mfd/syscon.c
 create mode 100644 include/linux/fsl/imx6q-iomuxc-gpr.h
 delete mode 100644 include/linux/mfd/anatop.h
 create mode 100644 include/linux/mfd/syscon.h
