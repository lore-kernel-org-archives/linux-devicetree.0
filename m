From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH 2/2] arm: dts: berlin: use stdout-path
Date: Mon, 6 Jul 2015 17:50:34 +0800
Message-ID: <1436176234-819-3-git-send-email-jszhang@marvell.com>
References: <1436176234-819-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436176234-819-1-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, antoine.tenart@free-electrons.com, boris.brezillon@free-electrons.com, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

Use stdout-path to specify the console and remove the console argument
from the kernel command line.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts        | 3 ++-
 arch/arm/boot/dts/berlin2cd-google-chromecast.dts | 3 ++-
 arch/arm/boot/dts/berlin2q-marvell-dmp.dts        | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts b/arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts
index 5c99fb3..3c0907b 100644
--- a/arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts
+++ b/arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts
@@ -45,7 +45,8 @@
 	compatible = "sony,nsz-gs7", "marvell,berlin2", "marvell,berlin";
 
 	chosen {
-		bootargs = "console=ttyS0,115200 earlyprintk";
+		bootargs = "earlyprintk";
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory {
diff --git a/arch/arm/boot/dts/berlin2cd-google-chromecast.dts b/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
index 772165a..8ba8b50 100644
--- a/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
+++ b/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
@@ -46,7 +46,8 @@
 	compatible = "google,chromecast", "marvell,berlin2cd", "marvell,berlin";
 
 	chosen {
-		bootargs = "console=ttyS0,115200 earlyprintk";
+		bootargs = "earlyprintk";
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory {
diff --git a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
index 4a749e5..da28c97 100644
--- a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
+++ b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
@@ -49,7 +49,8 @@
 	};
 
 	choosen {
-		bootargs = "console=ttyS0,115200 earlyprintk";
+		bootargs = "earlyprintk";
+		stdout-path = "serial0:115200n8";
 	};
 
 	regulators {
-- 
2.1.4
