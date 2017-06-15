From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v2 06/10] ARM: dts: meson8: add reserved memory zones
Date: Thu, 15 Jun 2017 23:33:48 +0200
Message-ID: <20170615213352.25134-7-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170615213352.25134-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170615213352.25134-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There seem to be two memory regions that need to be reserved, otherwise
the system just hangs when running:
$ stress --vm-bytes $(awk '/MemFree/{printf "%d\n", $2 * 0.9;}' < /proc/meminfo)k \
  --vm-keep -m 1

The first memory region is really crucial and without it the system
hangs. I could not find any references to this in Amlogic's GPL kernel
sources.
The second region is used by the "suspend firmware". The u-boot sources
(/arch/arm/cpu/aml_meson/m8/firmwareld.c) state that the suspend
firmware is located at "64M + 15M" which matches CONFIG_MESON_SUSPEND in
the Amlogic GPL kernel sources. The "suspend firmware" is responsible
for waking up the system from suspend state.

This also fixes reading the full SD card as without this the system
would simply hang (probably related to the first memory region, if some
buffer is allocated there).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm/boot/dts/meson8.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 6687b1b4c7c9..df79a34a3530 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -83,6 +83,33 @@
 			reg = <0x203>;
 		};
 	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		/* 2 MiB reserved for Hardware ROM Firmware? */
+		hwrom@0 {
+			reg = <0x0 0x200000>;
+			no-map;
+		};
+
+		/*
+		 * 1 MiB reserved for the "ARM Power Firmware": this is ARM
+		 * code which is responsible for system suspend. It loads a
+		 * piece of ARC code ("arc_power" in the vendor u-boot tree)
+		 * into SRAM, executes that and shuts down the (last) ARM core.
+		 * The arc_power firmware then checks various wakeup sources
+		 * (IR remote receiver, HDMI CEC, WIFI and Bluetooth wakeup or
+		 * simply the power key) and re-starts the ARM core once it
+		 * detects a wakeup request.
+		 */
+		power-firmware@4f00000 {
+			reg = <0x4f00000 0x100000>;
+			no-map;
+		};
+	};
 }; /* end of / */
 
 &aobus {
-- 
2.13.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
