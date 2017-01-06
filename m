From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2] ARM64: dts: meson-gxbb-odroidc2: Disable SCPI DVFS
Date: Fri,  6 Jan 2017 09:04:32 +0100
Message-ID: <1483689872-30389-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The current hardware is not able to run with all cores enabled at a
cluster frequency superior at 1536MHz.
But the currently shipped u-boot for the platform still reports an OPP
table with possible DVFS frequency up to 2GHz, and will not change since
the off-tree linux tree supports limiting the OPPs with a kernel parameter.
A recent u-boot change reports the boot-time DVFS around 100MHz and
the default performance cpufreq governor sets the maximum frequency.
Previous version of u-boot reported to be already at the max OPP and
left the OPP as is.
Nevertheless, other governors like ondemand could setup the max frequency
and make the system crash.

This patch disables the DVFS clock and disables cpufreq.

Fixes: 70db166a2baa ("ARM64: dts: meson-gxbb: Add SCPI with cpufreq & sensors Nodes")
Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi         | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

Changes since v1 at [1] :
 - Disable scpi_clocks instead of scpi_dvfs_clock

[1] http://lkml.kernel.org/r/1483628549-29486-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 238fbea..5d28e1c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -137,6 +137,10 @@
 	};
 };
 
+&scpi_clocks {
+	status = "disabled";
+};
+
 &uart_AO {
 	status = "okay";
 	pinctrl-0 = <&uart_ao_a_pins>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 51edd5b5..77caedd8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -55,7 +55,7 @@
 		mboxes = <&mailbox 1 &mailbox 2>;
 		shmem = <&cpu_scp_lpri &cpu_scp_hpri>;
 
-		clocks {
+		scpi_clocks: clocks {
 			compatible = "arm,scpi-clocks";
 
 			scpi_dvfs: scpi_clocks@0 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
