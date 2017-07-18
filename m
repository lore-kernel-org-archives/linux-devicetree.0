From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH v2 0/3] Fix SMC layout register for sama5d2
Date: Tue, 18 Jul 2017 15:22:17 +0200
Message-ID: <20170718132220.25018-1-ludovic.desroches@microchip.com>
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
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, linux-kernel@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, alexandre.belloni@free-electrons.com, romain.izard.pro@gmail.com, computersforpeace@gmail.com, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

Hi,

The offset of some registers of the SMC is different between sama5d3/sama5d4
and sama5d2. An helper function has been added to retrieve the correct layout
with the help of a new compatible string for sama5d2. The atmel-ebi device will
store the register layout to allow the nand controller to setup correctly the
data interface.

Changes:
- v2: rebase patches on top of v4.13-rc1 and collect acked-by

Ludovic Desroches (3):
  mfd: syscon: update Atmel SMC binding doc
  mfd: syscon: atmel-smc: add helper to retrieve register layout
  ARM: dts: at91: sama5d2: use sama5d2 compatible string for SMC

 .../devicetree/bindings/mfd/atmel-smc.txt          |  1 +
 arch/arm/boot/dts/sama5d2.dtsi                     |  2 +-
 drivers/memory/atmel-ebi.c                         | 13 +++--
 drivers/mfd/atmel-smc.c                            | 67 +++++++++++++++++-----
 drivers/mtd/nand/atmel/nand-controller.c           | 10 +++-
 include/linux/mfd/syscon/atmel-smc.h               | 32 ++++++++---
 6 files changed, 94 insertions(+), 31 deletions(-)

-- 
2.12.2
