From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v3 4/7] ARM: dts: r8a7793: Add L2 cache-controller node
Date: Mon, 15 Feb 2016 21:38:32 +0100
Message-ID: <1455568715-20880-5-git-send-email-geert+renesas@glider.be>
References: <1455568715-20880-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455568715-20880-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a device node for the L2 cache, and link the CPU node to it.

The L2 cache for the Cortex-A15 CPU cores is 1 MiB large (organized as
64 KiB x 16 ways).

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
v3:
  - Drop "arm,data-latency" and "arm,tag-latency" properties, as they
    may not be valid when using virtualization,
  - Change one-line summary prefix to match current arm-soc practices,

v2:
  - Drop (incorrect) optional cache-{size,sets,{block,line}-size}
    properties, as this information is auto-detected,
  - Integrate linking CPU to L2 cache into this patch,
  - Extracted from series "[PATCH/RFC 00/15] ARM: shmobile: R-Car: Add
    SYSC PM Domain DT Support".
---
 arch/arm/boot/dts/r8a7793.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 45dba1c79a43c287..9a30f650aa515b80 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -51,9 +51,16 @@
 					   < 937500 1000000>,
 					   < 750000 1000000>,
 					   < 375000 1000000>;
+			next-level-cache = <&L2_CA15>;
 		};
 	};
 
+	L2_CA15: cache-controller@0 {
+		compatible = "cache";
+		cache-unified;
+		cache-level = <2>;
+	};
+
 	gic: interrupt-controller@f1001000 {
 		compatible = "arm,gic-400";
 		#interrupt-cells = <3>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
