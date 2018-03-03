From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Subject: [PATCH] ARM: dts: imx6dl: Fix typo in Engicam i.CoreM6 DualLite/Solo RQS
Date: Sat,  3 Mar 2018 11:34:29 +0100
Message-ID: <20180303103429.3063-1-jezz@sysmic.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>, Jagan Teki <jagan@amarulasolutions.com>, Michael Trimarchi <michael@amarulasolutions.com>, =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
List-Id: devicetree@vger.kernel.org

Obviously "Engicam i.CoreM6 DualLite/Solo RQS" include an imx6dl, not
an imx6q.

Signed-off-by: Jérôme Pouiller <jezz@sysmic.org>
---
 arch/arm/boot/dts/imx6dl-icore-rqs.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6dl-icore-rqs.dts b/arch/arm/boot/dts/imx6dl-icore-rqs.dts
index cf42c2f5cdc7..1281bc39b7ab 100644
--- a/arch/arm/boot/dts/imx6dl-icore-rqs.dts
+++ b/arch/arm/boot/dts/imx6dl-icore-rqs.dts
@@ -42,7 +42,7 @@
 
 /dts-v1/;
 
-#include "imx6q.dtsi"
+#include "imx6dl.dtsi"
 #include "imx6qdl-icore-rqs.dtsi"
 
 / {
-- 
2.11.0
