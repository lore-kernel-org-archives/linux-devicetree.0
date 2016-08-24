From: Brendan Jackman <brendan.jackman-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC 6/6] arm64: dts: Add domain-idle-states for Juno r0 power domains
Date: Wed, 24 Aug 2016 14:48:22 +0100
Message-ID: <20160824134822.3591-7-brendan.jackman@arm.com>
References: <1470351902-43103-3-git-send-email-lina.iyer@linaro.org>
 <20160824134822.3591-1-brendan.jackman@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160824134822.3591-1-brendan.jackman-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org
Cc: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Axel Haslam <ahaslam+renesas-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Titinger <mtitinger+renesas-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Lina Iyer <lina.iyer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

---
 arch/arm64/boot/dts/arm/juno.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
index 4e086ec..d2bc4e3 100644
--- a/arch/arm64/boot/dts/arm/juno.dts
+++ b/arch/arm64/boot/dts/arm/juno.dts
@@ -160,40 +160,48 @@
 	power-domains {
 		CLUSTER_A57_PD: cluster-a57-pd {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&CLUSTER_SLEEP_0>;
 		};
 
 		A57_0_PD: a57-pd@0 {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&CPU_SLEEP_0>;
 			power-domains = <&CLUSTER_A57_PD>;
 		};
 
 		A57_1_PD: a57-pd@1 {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&CPU_SLEEP_0>;
 			power-domains = <&CLUSTER_A57_PD>;
 		};
 
 
 		CLUSTER_A53_PD: cluster-a53-pd {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&CLUSTER_SLEEP_0>;
 		};
 
 		A53_0_PD: a53-pd@0 {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&CPU_SLEEP_0>;
 			power-domains = <&CLUSTER_A53_PD>;
 		};
 
 		A53_1_PD: a53-pd@1 {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&CPU_SLEEP_0>;
 			power-domains = <&CLUSTER_A53_PD>;
 		};
 
 		A53_2_PD: a53-pd@2 {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&CPU_SLEEP_0>;
 			power-domains = <&CLUSTER_A53_PD>;
 		};
 
 		A53_3_PD: a53-pd@3 {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&CPU_SLEEP_0>;
 			power-domains = <&CLUSTER_A53_PD>;
 		};
 	};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
