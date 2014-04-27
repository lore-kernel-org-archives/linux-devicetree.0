From: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
Subject: [PATCH v2 5/6] ARM: tegra: paz00: add dt bindings for nvec
Date: Sun, 27 Apr 2014 05:14:29 +0400
Message-ID: <1398561270-25091-6-git-send-email-danindrey@mail.ru>
References: <[PATCH 0/3] ARM: tegra: add nvec keyboard support for paz00>
 <1398561270-25091-1-git-send-email-danindrey@mail.ru>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398561270-25091-1-git-send-email-danindrey-JGs/UdohzUI@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
Cc: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
CC: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
CC: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
CC: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
CC: ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org
---
 Changes for v2:
 	- Separated from enabling keyboard patch
	- Changed NVEC dt bindings 

 arch/arm/dts/tegra20-paz00.dts |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/dts/tegra20-paz00.dts b/arch/arm/dts/tegra20-paz00.dts
index 780203c..9906f3a 100644
--- a/arch/arm/dts/tegra20-paz00.dts
+++ b/arch/arm/dts/tegra20-paz00.dts
@@ -40,7 +40,13 @@
 	};
 
 	i2c@7000c500 {
-		status = "disabled";
+		status = "okay";
+		clock-frequency = <40000>;
+		slave-addr = <138>;
+		nvec {
+			compatible = "nvidia,tegra20-nvec";
+			request-gpios = <&gpio 170 0>; /* gpio PV2 */
+		};
 	};
 
 	i2c@7000d000 {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
