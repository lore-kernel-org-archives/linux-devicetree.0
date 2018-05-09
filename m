From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 1/3] arm64: dts: juno: Fix "debounce-interval" property
 misspelling
Date: Wed,  9 May 2018 17:44:49 +0100
Message-ID: <1525884291-18851-1-git-send-email-sudeep.holla@arm.com>
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
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

"debounce_interval" was never supported in the bindings. It should be
"debounce-interval". Moreover, latest DTC complains the following:

Warning (property_name_chars_strict): debounce_interval: Character '_' not recommended in property name

This patch fixes the above warning by using the correct property as
per the bindings.

Cc: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
index 69804c5f1197..4b38195a8bea 100644
--- a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
@@ -58,42 +58,42 @@
 				compatible = "gpio-keys";
 
 				power-button {
-					debounce_interval = <50>;
+					debounce-interval = <50>;
 					wakeup-source;
 					linux,code = <116>;
 					label = "POWER";
 					gpios = <&iofpga_gpio0 0 0x4>;
 				};
 				home-button {
-					debounce_interval = <50>;
+					debounce-interval = <50>;
 					wakeup-source;
 					linux,code = <102>;
 					label = "HOME";
 					gpios = <&iofpga_gpio0 1 0x4>;
 				};
 				rlock-button {
-					debounce_interval = <50>;
+					debounce-interval = <50>;
 					wakeup-source;
 					linux,code = <152>;
 					label = "RLOCK";
 					gpios = <&iofpga_gpio0 2 0x4>;
 				};
 				vol-up-button {
-					debounce_interval = <50>;
+					debounce-interval = <50>;
 					wakeup-source;
 					linux,code = <115>;
 					label = "VOL+";
 					gpios = <&iofpga_gpio0 3 0x4>;
 				};
 				vol-down-button {
-					debounce_interval = <50>;
+					debounce-interval = <50>;
 					wakeup-source;
 					linux,code = <114>;
 					label = "VOL-";
 					gpios = <&iofpga_gpio0 4 0x4>;
 				};
 				nmi-button {
-					debounce_interval = <50>;
+					debounce-interval = <50>;
 					wakeup-source;
 					linux,code = <99>;
 					label = "NMI";
-- 
2.7.4
