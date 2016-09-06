From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 01/10] ARM: dts: berlin2q: Remove skeleton.dtsi inclusion
Date: Tue, 6 Sep 2016 16:40:04 +0800
Message-ID: <20160906084013.2887-2-jszhang@marvell.com>
References: <20160906084013.2887-1-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160906084013.2887-1-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As noted in [1], "there are a number of problems with skeleton.dtsi,
and it would be prefereable to remove it entirely." This patch is to
remove skeleton.dtsi inclusion from berlin2q.

[1] http://www.spinics.net/lists/arm-kernel/msg528080.html

Signed-off-by: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/berlin2q.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
index 2c34bfb..4554945 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -37,11 +37,11 @@
 #include <dt-bindings/clock/berlin2q.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-#include "skeleton.dtsi"
-
 / {
 	model = "Marvell Armada 1500 pro (BG2-Q) SoC";
 	compatible = "marvell,berlin2q", "marvell,berlin";
+	#address-cells = <1>;
+	#size-cells = <1>;
 
 	aliases {
 		serial0 = &uart0;
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
