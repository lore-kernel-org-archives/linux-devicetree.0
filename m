From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCH 1/5] arm64: dts: renesas: r8a77970: add FCPVD node
Date: Wed, 31 Jan 2018 17:18:07 +0100
Message-ID: <20180131161811.12699-2-niklas.soderlund@ragnatech.se>
References: <20180131161811.12699-1-niklas.soderlund@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180131161811.12699-1-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: devicetree@vger.kernel.org

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

The FCPVD handles the interface between VSPD and memory.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 13c88414cb432b1a..05640d3f9f2421a7 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -612,6 +612,15 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+
+		fcpvd0: fcp@fea27000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfea27000 0 0x200>;
+			clocks = <&cpg CPG_MOD 603>;
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 603>;
+			iommus = <&ipmmu_vi0 8>;
+		};
 	};
 
 	timer {
-- 
2.16.1
