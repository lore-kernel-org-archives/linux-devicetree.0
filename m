From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 02/10] MIPS: dts: qca: ar9132: fix typo: "ppl" -> "pll"
Date: Sun, 14 Feb 2016 00:58:09 +0300
Message-ID: <1455400697-29898-3-git-send-email-antonynpavlov@gmail.com>
References: <1455400697-29898-1-git-send-email-antonynpavlov@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455400697-29898-1-git-send-email-antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Wills Wang <wills.wang-EMRzualFZlQ@public.gmane.org>, Daniel Schwierzeck <daniel.schwierzeck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 Documentation/devicetree/bindings/clock/qca,ath79-pll.txt | 2 +-
 arch/mips/boot/dts/qca/ar9132.dtsi                        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt b/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
index ae99f22..241fb05 100644
--- a/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
+++ b/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
@@ -22,7 +22,7 @@ Optional properties:
 Example:
 
 	pll-controller@18050000 {
-		compatible = "qca,ar9132-ppl", "qca,ar9130-pll";
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
