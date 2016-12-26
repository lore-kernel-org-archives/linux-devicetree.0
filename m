From: Chen Feng <puck.chen@hisilicon.com>
Subject: [RESEND 1/2] document: dt: add binding for Hi3660 SoC
Date: Mon, 26 Dec 2016 17:36:11 +0800
Message-ID: <1482744972-56622-1-git-send-email-puck.chen@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: puck.chen@hisilicon.com, xuwei5@hisilicon.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: suzhuangluan@hisilicon.com, xuyiping@hisilicon.com
List-Id: devicetree@vger.kernel.org

Add binding for hisilicon Hi3660 SoC and HiKey960 Board.

Signed-off-by: Chen Feng <puck.chen@hisilicon.com>
---
 Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
index 3f81575..7cf2847 100644
--- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
+++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
@@ -8,6 +8,10 @@ Hi6220 SoC
 Required root node properties:
 	- compatible = "hisilicon,hi6220";
 
+Hi3660 SoC
+Required root node properties:
+	- compatible = "hisilicon,hi3660";
+
 HiKey Board
 Required root node properties:
 	- compatible = "hisilicon,hi6220-hikey", "hisilicon,hi6220";
-- 
1.9.1
