From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 5/8] arm64: dts: allwinner: a64: add SCPI DVFS nodes
Date: Fri, 30 Jun 2017 10:56:05 +0100
Message-ID: <20170630095608.24943-6-andre.przywara@arm.com>
References: <20170630095608.24943-1-andre.przywara@arm.com>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBI6C3DFAKGQEPSZ3E3Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170630095608.24943-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

One functionality provided by the SCPI handler is frequency scaling,
which allows to switch the one CPU cluster between several operating
points, each specifying a matching frequency and CPU voltage.
The actual table is specified in firmware and can be queried by Linux
using standardised SCPI calls.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index ef6f10e..58c3675 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -61,6 +61,7 @@
 			device_type = "cpu";
 			reg = <0>;
 			enable-method = "psci";
+			clocks = <&scpi_dvfs 0>;
 		};
 
 		cpu1: cpu@1 {
@@ -68,6 +69,7 @@
 			device_type = "cpu";
 			reg = <1>;
 			enable-method = "psci";
+			clocks = <&scpi_dvfs 0>;
 		};
 
 		cpu2: cpu@2 {
@@ -75,6 +77,7 @@
 			device_type = "cpu";
 			reg = <2>;
 			enable-method = "psci";
+			clocks = <&scpi_dvfs 0>;
 		};
 
 		cpu3: cpu@3 {
@@ -82,6 +85,7 @@
 			device_type = "cpu";
 			reg = <3>;
 			enable-method = "psci";
+			clocks = <&scpi_dvfs 0>;
 		};
 	};
 
@@ -148,6 +152,17 @@
 		compatible = "arm,scpi";
 		mboxes = <&mailbox 0>;
 		shmem = <&cpu_scp_mem>;
+
+		scpi-clocks {
+			compatible = "arm,scpi-clocks";
+
+			scpi_dvfs: scpi_dvfs_clocks {
+				compatible = "arm,scpi-dvfs-clocks";
+				#clock-cells = <1>;
+				clock-indices = <0>;
+				clock-output-names = "cpu_clk";
+			};
+		};
 	};
 
 	soc {
-- 
2.9.0
