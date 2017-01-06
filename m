From: Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 9/9] ARM: dts: keystone-k2g: Reserve MSM RAM for boot
 monitor
Date: Fri, 6 Jan 2017 15:57:33 -0600
Message-ID: <20170106215733.41637-10-s-anna@ti.com>
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

The Keystone 2 boot monitor uses 32 KB of the MSM RAM @ 0x0c0f7000
on 66AK2G SoCs, so add a reserved child node for the same.

This address is aligned to the values used within the latest boot
monitor firmware [1] as of commit cf8b431e8b3b ("soc: Move load
address to end of MSMC").

[1] git://git.ti.com/processor-firmware/ks2-boot-monitor.git

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/keystone-k2g.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index e63e57e03b7c..c36d168bc874 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -83,6 +83,10 @@
 			ranges = <0x0 0x0c000000 0x100000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			sram-bm@f7000 {
+				reg = <0x000f7000 0x8000>;
+			};
 		};
 
 		k2g_pinctrl: pinmux@02621000 {
-- 
2.10.2
