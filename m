From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH 1/4] Documentation: dt: iio: at91_adc: fix trigger node names
Date: Wed, 13 Jul 2016 01:07:27 +0200
Message-ID: <1468364850-32475-1-git-send-email-alexandre.belloni@free-electrons.com>
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
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The trigger doesn't need the reg property. When it is not defined, the node
name doesn't need a unit-address. Remove them from the example.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 Documentation/devicetree/bindings/iio/adc/at91_adc.txt | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/at91_adc.txt b/Documentation/devicetree/bindings/iio/adc/at91_adc.txt
index 0f813dec5e08..f65b04fb7962 100644
--- a/Documentation/devicetree/bindings/iio/adc/at91_adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/at91_adc.txt
@@ -59,28 +59,24 @@ adc0: adc@fffb0000 {
 	atmel,adc-res-names = "lowres", "highres";
 	atmel,adc-use-res = "lowres";
 
-	trigger@0 {
-		reg = <0>;
+	trigger0 {
 		trigger-name = "external-rising";
 		trigger-value = <0x1>;
 		trigger-external;
 	};
-	trigger@1 {
-		reg = <1>;
+	trigger1 {
 		trigger-name = "external-falling";
 		trigger-value = <0x2>;
 		trigger-external;
 	};
 
-	trigger@2 {
-		reg = <2>;
+	trigger2 {
 		trigger-name = "external-any";
 		trigger-value = <0x3>;
 		trigger-external;
 	};
 
-	trigger@3 {
-		reg = <3>;
+	trigger3 {
 		trigger-name = "continuous";
 		trigger-value = <0x6>;
 	};
-- 
2.8.1
