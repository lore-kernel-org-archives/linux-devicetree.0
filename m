From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] ARM: zynq: Use earlycon instead of earlyprintk
Date: Mon, 15 Feb 2016 17:05:19 +0100
Message-ID: <8cd6d86437baf0a7a443f4d288a9c6a9df66ffc3.1455552315.git.michal.simek@xilinx.com>
References: <67c9013fc61f53515934b54847a05df8b8e1504a.1455552315.git.michal.simek@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <67c9013fc61f53515934b54847a05df8b8e1504a.1455552315.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
In-Reply-To: <67c9013fc61f53515934b54847a05df8b8e1504a.1455552315.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
References: <67c9013fc61f53515934b54847a05df8b8e1504a.1455552315.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Josh Cartwright <josh.cartwright-acOepvfBmUk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use early console instead of earlyprintk which is supposed to use for
very early debugging (DEBUG_LL).

Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---

 arch/arm/boot/dts/zynq-parallella.dts | 2 +-
 arch/arm/boot/dts/zynq-zc702.dts      | 2 +-
 arch/arm/boot/dts/zynq-zc706.dts      | 2 +-
 arch/arm/boot/dts/zynq-zed.dts        | 2 +-
 arch/arm/boot/dts/zynq-zybo.dts       | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dts/zynq-parallella.dts
index 9efd16cb2859..307ed201d658 100644
--- a/arch/arm/boot/dts/zynq-parallella.dts
+++ b/arch/arm/boot/dts/zynq-parallella.dts
@@ -34,7 +34,7 @@
 	};
 
 	chosen {
-		bootargs = "earlyprintk root=/dev/mmcblk0p2 rootfstype=ext4 rw rootwait";
+		bootargs = "earlycon root=/dev/mmcblk0p2 rootfstype=ext4 rw rootwait";
 		stdout-path = "serial0:115200n8";
 	};
 };
diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
index cb64209bca08..e96959b2e67a 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -30,7 +30,7 @@
 	};
 
 	chosen {
-		bootargs = "earlyprintk";
+		bootargs = "earlycon";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-zc706.dts
index abf5d238ae04..be6a986bbbd8 100644
--- a/arch/arm/boot/dts/zynq-zc706.dts
+++ b/arch/arm/boot/dts/zynq-zc706.dts
@@ -30,7 +30,7 @@
 	};
 
 	chosen {
-		bootargs = "earlyprintk";
+		bootargs = "earlycon";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/zynq-zed.dts b/arch/arm/boot/dts/zynq-zed.dts
index b9f2522012e8..7250c1eac7f9 100644
--- a/arch/arm/boot/dts/zynq-zed.dts
+++ b/arch/arm/boot/dts/zynq-zed.dts
@@ -29,7 +29,7 @@
 	};
 
 	chosen {
-		bootargs = "earlyprintk";
+		bootargs = "earlycon";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/zynq-zybo.dts b/arch/arm/boot/dts/zynq-zybo.dts
index 16c9cacd668d..bd992e036aa9 100644
--- a/arch/arm/boot/dts/zynq-zybo.dts
+++ b/arch/arm/boot/dts/zynq-zybo.dts
@@ -29,7 +29,7 @@
 	};
 
 	chosen {
-		bootargs = "earlyprintk";
+		bootargs = "earlycon";
 		stdout-path = "serial0:115200n8";
 	};
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
