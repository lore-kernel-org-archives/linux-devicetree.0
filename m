From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v3 1/7] ARM: dts: r8a73a4: Add L2 cache-controller nodes
Date: Mon, 15 Feb 2016 21:38:29 +0100
Message-ID: <1455568715-20880-2-git-send-email-geert+renesas@glider.be>
References: <1455568715-20880-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455568715-20880-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device nodes for the L2 caches, and link the CPU node to its L2
cache node.

The L2 cache for the Cortex-A15 CPU cores is 1 MiB large (organized as
64 KiB x 16 ways), and located in PM domain A3SM.

The L2 cache for the Cortex-A7 CPU cores is 512 KiB large (organized as
64 KiB x 8 ways), and located in PM domain A3KM.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
v3:
  - Drop "arm,data-latency" and "arm,tag-latency" properties, as they
    may not be valid when using virtualization,
  - Change one-line summary prefix to match current arm-soc practices,

v2:
  - New.
---
 arch/arm/boot/dts/r8a73a4.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/r8a73a4.dtsi b/arch/arm/boot/dts/r8a73a4.dtsi
index 138414a7d1703781..6583a1dfca1f64c6 100644
--- a/arch/arm/boot/dts/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/r8a73a4.dtsi
@@ -29,6 +29,7 @@
 			reg = <0>;
 			clock-frequency = <1500000000>;
 			power-domains = <&pd_a2sl>;
+			next-level-cache = <&L2_CA15>;
 		};
 	};
 
@@ -45,6 +46,22 @@
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	L2_CA15: cache-controller@0 {
+		compatible = "cache";
+		clocks = <&cpg_clocks R8A73A4_CLK_Z>;
+		power-domains = <&pd_a3sm>;
+		cache-unified;
+		cache-level = <2>;
+	};
+
+	L2_CA7: cache-controller@1 {
+		compatible = "cache";
+		clocks = <&cpg_clocks R8A73A4_CLK_Z2>;
+		power-domains = <&pd_a3km>;
+		cache-unified;
+		cache-level = <2>;
+	};
+
 	dbsc1: memory-controller@e6790000 {
 		compatible = "renesas,dbsc-r8a73a4";
 		reg = <0 0xe6790000 0 0x10000>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
