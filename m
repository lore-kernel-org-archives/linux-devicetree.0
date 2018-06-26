From: Nishanth Menon <nm@ti.com>
Subject: [PATCH V2 1/5] dt-bindings: arm: ti: Add bindings for AM654 SoC
Date: Tue, 26 Jun 2018 11:26:11 -0500
Message-ID: <20180626162615.19194-2-nm@ti.com>
References: <20180626162615.19194-1-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180626162615.19194-1-nm@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>, Sudeep Holla <sudeep.holla@arm.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Tero Kristo <t-kristo@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The AM654 SoC is a lead device of the K3 Multicore SoC architecture
platform, targeted for broad market and industrial control with aim to
meet the complex processing needs of modern embedded products.

Some highlights of this SoC are:
* Quad ARMv8 A53 cores split over two clusters
* GICv3 compliant GIC500
* Configurable L3 Cache and IO-coherent architecture
* Dual lock-step capable R5F uC for safety-critical applications
* High data throughput capable distributed DMA architecture under NAVSS
* Three Gigabit Industrial Communication Subsystems (ICSSG), each with dual
  PRUs and dual RTUs
* Hardware accelerator block containing AES/DES/SHA/MD5 called SA2UL
* Centralized System Controller for Security, Power, and Resource
  management.
* Dual ADCSS, eQEP/eCAP, eHRPWM, dual CAN-FD
* Flash subsystem with OSPI and Hyperbus interfaces
* Multimedia capability with CAL, DSS7-UL, SGX544, McASP
* Peripheral connectivity including USB3, PCIE, MMC/SD, GPMC, I2C, SPI,
  GPIO

See AM65x Technical Reference Manual (SPRUID7, April 2018)
for further details: http://www.ti.com/lit/pdf/spruid7

Reviewed-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V1:
 * Picked up Tony's reviewed-by
 
V1: https://patchwork.kernel.org/patch/10475327/
previous RFC: https://patchwork.kernel.org/patch/10447643/

 Documentation/devicetree/bindings/arm/ti/k3.txt | 23 +++++++++++++++++++++++
 MAINTAINERS                                     |  7 +++++++
 2 files changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/ti/k3.txt

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.txt b/Documentation/devicetree/bindings/arm/ti/k3.txt
new file mode 100644
index 000000000000..6a059cabb2da
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/ti/k3.txt
@@ -0,0 +1,23 @@
+Texas Instruments K3 Multicore SoC architecture device tree bindings
+--------------------------------------------------------------------
+
+Platforms based on Texas Instruments K3 Multicore SoC architecture
+shall follow the following scheme:
+
+SoCs
+----
+
+Each device tree root node must specify which exact SoC in K3 Multicore SoC
+architecture it uses, using one of the following compatible values:
+
+- AM654
+  compatible = "ti,am654";
+
+Boards
+------
+
+In addition, each device tree root node must specify which one or more
+of the following board-specific compatible values:
+
+- AM654 EVM
+  compatible = "ti,am654-evm", "ti,am654";
diff --git a/MAINTAINERS b/MAINTAINERS
index 9d5eeff51b5f..fbd93eee41ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2087,6 +2087,13 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	drivers/memory/*emif*
 
+ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE
+M:	Tero Kristo <t-kristo@ti.com>
+M:	Nishanth Menon <nm@ti.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Supported
+F:	Documentation/devicetree/bindings/arm/ti/k3.txt
+
 ARM/TEXAS INSTRUMENT KEYSTONE ARCHITECTURE
 M:	Santosh Shilimkar <ssantosh@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.15.1
