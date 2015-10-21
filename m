From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 19/19] ARM: dts: zynq: replace gpio-key,wakeup with wakeup-source property
Date: Wed, 21 Oct 2015 11:10:16 +0100
Message-ID: <1445422216-29375-20-git-send-email-sudeep.holla@arm.com>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445422216-29375-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Though the keyboard driver for GPIO buttons(gpio-keys) will continue to
check for/support the legacy "gpio-key,wakeup" boolean property to
enable gpio buttons as wakeup source, "wakeup-source" is the new
standard binding.

This patch replaces the legacy "gpio-key,wakeup" with the unified
"wakeup-source" property in order to avoid any futher copy-paste
duplication.

Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "S=C3=B6ren Brinkmann" <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/boot/dts/zynq-zc702.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-=
zc702.dts
index 5df8f81f4217..cb64209bca08 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -43,14 +43,14 @@
 			label =3D "sw14";
 			gpios =3D <&gpio0 12 0>;
 			linux,code =3D <108>; /* down */
-			gpio-key,wakeup;
+			wakeup-source;
 			autorepeat;
 		};
 		sw13 {
 			label =3D "sw13";
 			gpios =3D <&gpio0 14 0>;
 			linux,code =3D <103>; /* up */
-			gpio-key,wakeup;
+			wakeup-source;
 			autorepeat;
 		};
 	};
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
