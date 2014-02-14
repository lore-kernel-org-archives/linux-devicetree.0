From: Marek Belisko <marek@goldelico.com>
Subject: [PATCH 2/2] ARM: dts: twl4030: Add twl4030-madc node.
Date: Fri, 14 Feb 2014 14:17:41 +0100
Message-ID: <1392383861-14169-2-git-send-email-marek@goldelico.com>
References: <1392383861-14169-1-git-send-email-marek@goldelico.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1392383861-14169-1-git-send-email-marek@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, hns@goldelico.com, Marek Belisko <marek@goldelico.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Marek Belisko <marek@goldelico.com>
---
 arch/arm/boot/dts/twl4030.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/twl4030.dtsi b/arch/arm/boot/dts/twl4030.dtsi
index 4217096..e6dec53 100644
--- a/arch/arm/boot/dts/twl4030.dtsi
+++ b/arch/arm/boot/dts/twl4030.dtsi
@@ -145,4 +145,9 @@
 		compatible = "ti,twl4030-pwrbutton";
 		interrupts = <8>;
 	};
+
+	twl_madc: madc {
+		compatible = "ti,twl4030-madc";
+		interrupts = <1>;
+	};
 };
-- 
1.8.3.2
