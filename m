From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/5] ARM: dts: keystone: Add PSC node
Date: Mon, 9 Jan 2017 13:43:55 -0600
Message-ID: <20170109194358.27271-3-s-anna@ti.com>
References: <20170109194358.27271-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170109194358.27271-1-s-anna@ti.com>
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
Cc: devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Andrew Davis <afd@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Power Sleep Controller (PSC) module is responsible
for the power and clock management for each of the peripherals
present on the SoC. Represent this as a syscon node so that
multiple users can leverage it for various functionalities.

Signed-off-by: Suman Anna <s-anna@ti.com>
[afd@ti.com: add simple-mfd compatible]
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
---
 arch/arm/boot/dts/keystone.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index 02708ba2d4f4..ec203d0a673d 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -83,6 +83,11 @@
 			reg = <0x02310000 0x200>;
 		};
 
+		psc: power-sleep-controller@02350000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0x02350000 0x1000>;
+		};
+
 		devctrl: device-state-control@02620000 {
 			compatible = "ti,keystone-devctrl", "syscon";
 			reg = <0x02620000 0x1000>;
-- 
2.10.2
