From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 01/18] dt-bindings: clock: qca,ath79-pll: fix copy-paste typos
Date: Thu, 17 Mar 2016 06:34:08 +0300
Message-ID: <1458185665-4521-2-git-send-email-antonynpavlov@gmail.com>
References: <1458185665-4521-1-git-send-email-antonynpavlov@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458185665-4521-1-git-send-email-antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

---
Changes since v1:
  * dt-bindings: clock: qca,ath79-pll: fix copy-paste

v1:
Acked-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Acked-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/qca,ath79-pll.txt | 6 +++---
 arch/mips/boot/dts/qca/ar9132.dtsi                        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt b/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
index e0fc2c1..241fb05 100644
--- a/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
+++ b/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
@@ -3,7 +3,7 @@ Binding for Qualcomm Atheros AR7xxx/AR9XXX PLL controller
 The PPL controller provides the 3 main clocks of the SoC: CPU, DDR and AHB.
 
 Required Properties:
-- compatible: has to be "qca,<soctype>-cpu-intc" and one of the following
+- compatible: has to be "qca,<soctype>-pll" and one of the following
   fallbacks:
   - "qca,ar7100-pll"
   - "qca,ar7240-pll"
@@ -21,8 +21,8 @@ Optional properties:
 
 Example:
 
-	memory-controller@18050000 {
-		compatible = "qca,ar9132-ppl", "qca,ar9130-pll";
+	pll-controller@18050000 {
+		compatible = "qca,ar9132-pll", "qca,ar9130-pll";
 		reg = <0x18050000 0x20>;
 
 		clock-names = "ref";
diff --git a/arch/mips/boot/dts/qca/ar9132.dtsi b/arch/mips/boot/dts/qca/ar9132.dtsi
index 3ad4ba9..3c2ed9e 100644
--- a/arch/mips/boot/dts/qca/ar9132.dtsi
+++ b/arch/mips/boot/dts/qca/ar9132.dtsi
@@ -83,7 +83,7 @@
 			};
 
 			pll: pll-controller@18050000 {
-				compatible = "qca,ar9132-ppl",
+				compatible = "qca,ar9132-pll",
 						"qca,ar9130-pll";
 				reg = <0x18050000 0x20>;
 
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
