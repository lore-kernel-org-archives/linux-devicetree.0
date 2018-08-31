From: Patrick Venture <venture@google.com>
Subject: [PATCH v2 2/2] ARM: dts: aspeed: quanta-q71l: Add four PSUs
Date: Fri, 31 Aug 2018 13:58:55 -0700
Message-ID: <20180831205855.242061-1-venture@google.com>
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
To: venture@google.com, joel@jms.id.au, robh+dt@kernel.org, andrew@aj.id.au, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Enable the four PSUs via generic PMBUS.

Signed-off-by: Patrick Venture <venture@google.com>
---
Changes for v2:
 - Fixed the commit header typo s/q7l1/q71l/
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 586050e1c0e6..c655564e6c6d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -318,24 +318,44 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+
+			psu@59 {
+				compatible = "pmbus";
+				reg = <0x59>;
+			};
 		};
 
 		i2c_psu1: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+
+			psu@58 {
+				compatible = "pmbus";
+				reg = <0x58>;
+			};
 		};
 
 		i2c_psu3: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+
+			psu@58 {
+				compatible = "pmbus";
+				reg = <0x58>;
+			};
 		};
 
 		i2c_psu2: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
+
+			psu@59 {
+				compatible = "pmbus";
+				reg = <0x59>;
+			};
 		};
 	};
 
-- 
2.19.0.rc1.350.ge57e33dbd1-goog
