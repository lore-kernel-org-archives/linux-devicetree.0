From: AnilKumar Ch <anilkumar@ti.com>
Subject: [PATCH RESEND v2 1/2] arm/dts: Add AM33XX basic pinctrl support
Date: Tue, 24 Jul 2012 21:15:18 +0530
Message-ID: <1343144719-26352-2-git-send-email-anilkumar@ti.com>
References: <1343144719-26352-1-git-send-email-anilkumar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1343144719-26352-1-git-send-email-anilkumar@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: tony@atomide.com, b-cousson@ti.com, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, AnilKumar Ch <anilkumar@ti.com>
List-Id: devicetree@vger.kernel.org

Adds basic pinctrl support for AM33XX family of devices. This patch
is based on the pinctrl-simple driver submitted by Tony Lindgren's
here: http://lwn.net/Articles/496075/

Signed-off-by: AnilKumar Ch <anilkumar@ti.com>
---
 arch/arm/boot/dts/am33xx.dtsi |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index 59509c4..9b974dc 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -40,6 +40,15 @@
 		};
 	};
 
+	am3358_pinmux: pinmux@44E10800 {
+		compatible = "pinctrl-single";
+		reg = <0x44E10800 0x0338>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-single,register-width = <32>;
+		pinctrl-single,function-mask = <0x7F>;
+	};
+
 	/*
 	 * XXX: Use a flat representation of the AM33XX interconnect.
 	 * The real AM33XX interconnect network is quite complex.Since
-- 
1.7.9.5

