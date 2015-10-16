From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 4/4] arm64: dts: Add BRCM IPROC NAND DT node for NS2
Date: Fri, 16 Oct 2015 14:38:57 +0530
Message-ID: <1444986537-28387-5-git-send-email-anup.patel@broadcom.com>
References: <1444986537-28387-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444986537-28387-1-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pramod KUMAR <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Vikram Prakash <vikramp-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sandeep Tripathy <tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The NAND controller on NS2 SoC is compatible with existing
BRCM IPROC NAND driver so let's enable it in NS2 DT and
NS2 SVK DT.

Signed-off-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/broadcom/ns2-svk.dts | 12 ++++++++++++
 arch/arm64/boot/dts/broadcom/ns2.dtsi    | 14 ++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
index e5950d5..a754160 100644
--- a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
+++ b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
@@ -63,5 +63,17 @@
 		uart3: serial@66130000 {
 			status = "ok";
 		};
+
+		nand: nand@66460000 {
+			nandcs@0 {
+				compatible = "brcm,nandcs";
+				reg = <0>;
+				nand-ecc-mode = "hw";
+				nand-ecc-strength = <8>;
+				nand-ecc-step-size = <512>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+			};
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index f603277..9610822 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -212,5 +212,19 @@
 			compatible = "brcm,iproc-rng200";
 			reg = <0x66220000 0x28>;
 		};
+
+		nand: nand@66460000 {
+			compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1";
+			reg = <0x66460000 0x600>,
+			      <0x67015408 0x600>,
+			      <0x66460f00 0x20>;
+			reg-names = "nand", "iproc-idm", "iproc-ext";
+			interrupts = <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			brcm,nand-has-wp;
+		};
 	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
