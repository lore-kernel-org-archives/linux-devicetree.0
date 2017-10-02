From: =?UTF-8?q?Linus=20L=C3=BCssing?= <linus.luessing-djzkFPsfvsizQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] ARM: dts: meson8b: add reserved memory zone to fix silent freezes
Date: Mon,  2 Oct 2017 17:59:03 +0200
Message-ID: <20171002155903.19511-1-linus.luessing@c0d3.blue>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, =?UTF-8?q?Linus=20L=C3=BCssing?= <linus.luessing-djzkFPsfvsizQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

So far, the stress-ng tool for instance quickly resulted in a silent
freeze of the system with no prior notice on a serial console when
running its filesystem or memory stressor classes.

Even with a panic-on-OOM and reboot-on-panic (vm.panic_on_oom=1,
kernel.panic=10) configured, the system would neither reboot nor
would the OOM killer get any chance to otherwise do its job.

The Amlogic reference source code uses a 2MB PHYS_OFFSET. With these 2MB
reserved via DT, stress-ng was able to run on an Odroid C1+ just fine for
several hours, the OOM killer was able to kill processes again and if
configured would successfully trigger a reboot of the system.

Fixes: 4a69fcd3a108 ("ARM: meson: Add DTS for Odroid-C1 and Tronfy MXQ boards")
Signed-off-by: Linus Lüssing <linus.luessing-djzkFPsfvsizQB+pC5nmwQ@public.gmane.org>

---
The following stress-ng command worked fine now:
$ stress-ng -v --sequential 0 -t 120s --exclude sysfs,opcode --metrics
(5 hours runtime, tested on an Odroid C1+ with an 4.14-rc1 kernel + SMP
+ USB DTS patches)
---
 arch/arm/boot/dts/meson8b.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index bc278da..d75a5b5 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -83,6 +83,18 @@
 		};
 	};
 
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
+	};
+
 	scu@c4300000 {
 		compatible = "arm,cortex-a5-scu";
 		reg = <0xc4300000 0x100>;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
