From: Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 1/9] ARM: dts: keystone-k2hk: Add MSM RAM node
Date: Fri, 6 Jan 2017 15:57:25 -0600
Message-ID: <20170106215733.41637-2-s-anna@ti.com>
References: <20170106215733.41637-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170106215733.41637-1-s-anna@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Vitaly Andrianov <vitalya@ti.com>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>, Murali Karicheri <m-karicheri2@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the RAM managed by the Multicore Shared Memory Controller (MSMC)
as a mmio-sram node. The 66AK2H SoCs have 6 MB of such memory. Any
specific MSM memory range needed by a software module ought to be
reserved using an appropriate child node.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: No code changes, SoC name in commit message corrected to use 66AK2H

 arch/arm/boot/dts/keystone-k2hk.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2hk.dtsi b/arch/arm/boot/dts/keystone-k2hk.dtsi
index 8f67fa8df936..39e88d815235 100644
--- a/arch/arm/boot/dts/keystone-k2hk.dtsi
+++ b/arch/arm/boot/dts/keystone-k2hk.dtsi
@@ -46,6 +46,14 @@
 	soc {
 		/include/ "keystone-k2hk-clocks.dtsi"
 
+		msm_ram: msmram@0c000000 {
+			compatible = "mmio-sram";
+			reg = <0x0c000000 0x600000>;
+			ranges = <0x0 0x0c000000 0x600000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		dspgpio0: keystone_dsp_gpio@02620240 {
 			compatible = "ti,keystone-dsp-gpio";
 			gpio-controller;
-- 
2.10.2
