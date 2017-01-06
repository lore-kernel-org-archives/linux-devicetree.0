From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH 0/3] ARM: at91: fix cpuidle crash on SAMA5D4 Xplained board
Date: Fri, 6 Jan 2017 14:59:44 +0800
Message-ID: <20170106065947.30631-1-wenyou.yang@atmel.com>
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
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Russell King <linux@arm.linux.org.uk>, Nicolas Ferre <nicolas.ferre@atmel.com>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Wenyou Yang <wenyou.yang@microchip.com>, Wenyou Yang <wenyou.yang@atmel.com>
List-Id: devicetree@vger.kernel.org

Fix cpuidle crash on SAMA5D4 Xplained board when enable
CONFIG_ARM_AT91_CPUIDLE. Because some SoCs have the L2 cache,
we should flush the L2 cache before entering the cpu idle.


Wenyou Yang (3):
  ARM: at91: flush the L2 cache before entering cpu idle
  doc: binding: add new compatible for SDRAM/DDR Controller
  ARM: dts: at91: use "atmel,sama5d4-ddramc" for ramc

 Documentation/devicetree/bindings/arm/atmel-at91.txt |  1 +
 arch/arm/boot/dts/sama5d2.dtsi                       |  2 +-
 arch/arm/boot/dts/sama5d4.dtsi                       |  2 +-
 arch/arm/mach-at91/pm.c                              | 19 +++++++++++++++++++
 drivers/memory/atmel-sdramc.c                        |  1 +
 5 files changed, 23 insertions(+), 2 deletions(-)

-- 
2.11.0
