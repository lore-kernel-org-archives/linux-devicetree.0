From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v2] ARM: dts: zynq: Fix stdout-path and bootargs
Date: Thu, 12 Feb 2015 10:43:16 +0100
Message-ID: <a9a55b576d88ef1f2ab6a1d1f6707d56104db32b.1423734193.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Russell King <linux@arm.linux.org.uk>, monstr@monstr.eu, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Josh Cartwright <josh.cartwright@ni.com>
List-Id: devicetree@vger.kernel.org

parallella - Remove linux,stdout-path.
Use stdout-path to identify kernel console

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

Changes in v2:
- Remove linux,stdout-path reported by Mark Rutland
- Use stdout-path new console description with setting
- Change patch subject from "ARM: dts: zynq: Add linux,stdout-path and
  stdout-path"
- Do not add 1/2 patch which added aliases node to zybo and parallella

 arch/arm/boot/dts/zynq-parallella.dts | 4 ++--
 arch/arm/boot/dts/zynq-zc702.dts      | 3 ++-
 arch/arm/boot/dts/zynq-zc706.dts      | 3 ++-
 arch/arm/boot/dts/zynq-zed.dts        | 3 ++-
 arch/arm/boot/dts/zynq-zybo.dts       | 3 ++-
 5 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dts/zynq-parallella.dts
index 6a5f51daa708..e1e5b2423d26 100644
--- a/arch/arm/boot/dts/zynq-parallella.dts
+++ b/arch/arm/boot/dts/zynq-parallella.dts
@@ -34,8 +34,8 @@
 	};
 
 	chosen {
-		bootargs = "console=ttyPS0,115200 earlyprintk root=/dev/mmcblk0p2 rootfstype=ext4 rw rootwait";
-		linux,stdout-path = "/amba/serial@e0001000";
+		bootargs = "earlyprintk root=/dev/mmcblk0p2 rootfstype=ext4 rw rootwait";
+		stdout-path = "serial0:115200n8";
 	};
 };
 
diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
index 1fc1d3911e9b..fb59d34e8ee6 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -30,7 +30,8 @@
 	};
 
 	chosen {
-		bootargs = "console=ttyPS0,115200 earlyprintk";
+		bootargs = "earlyprintk";
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {
diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-zc706.dts
index 850518d9b8ac..abf5d238ae04 100644
--- a/arch/arm/boot/dts/zynq-zc706.dts
+++ b/arch/arm/boot/dts/zynq-zc706.dts
@@ -30,7 +30,8 @@
 	};
 
 	chosen {
-		bootargs = "console=ttyPS0,115200 earlyprintk";
+		bootargs = "earlyprintk";
+		stdout-path = "serial0:115200n8";
 	};
 
 	usb_phy0: phy0 {
diff --git a/arch/arm/boot/dts/zynq-zed.dts b/arch/arm/boot/dts/zynq-zed.dts
index 5658bc8434de..b9f2522012e8 100644
--- a/arch/arm/boot/dts/zynq-zed.dts
+++ b/arch/arm/boot/dts/zynq-zed.dts
@@ -29,7 +29,8 @@
 	};
 
 	chosen {
-		bootargs = "console=ttyPS0,115200 earlyprintk";
+		bootargs = "earlyprintk";
+		stdout-path = "serial0:115200n8";
 	};
 
 	usb_phy0: phy0 {
diff --git a/arch/arm/boot/dts/zynq-zybo.dts b/arch/arm/boot/dts/zynq-zybo.dts
index 935a561f6aa6..16c9cacd668d 100644
--- a/arch/arm/boot/dts/zynq-zybo.dts
+++ b/arch/arm/boot/dts/zynq-zybo.dts
@@ -29,7 +29,8 @@
 	};
 
 	chosen {
-		bootargs = "console=ttyPS0,115200 earlyprintk";
+		bootargs = "earlyprintk";
+		stdout-path = "serial0:115200n8";
 	};
 
 };
-- 
1.8.2.3
