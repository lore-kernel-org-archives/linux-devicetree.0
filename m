Return-Path: <SRS0=RDbo=FO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:42310 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751529AbeBTMiX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 20 Feb 2018 07:38:23 -0500
Received: by mail-pl0-f66.google.com with SMTP id 31so7328332ple.9
        for <devicetree@vger.kernel.org>; Tue, 20 Feb 2018 04:38:23 -0800 (PST)
From: shyam saini <mayhs11saini@gmail.com>
Subject: [PATCH] ARM: dts: imx6dl: Include correct dtsi file for Engicam i.CoreM6 DualLite/Solo RQS
Date: Tue, 20 Feb 2018 18:08:08 +0530
Message-Id: <1519130288-12666-1-git-send-email-mayhs11saini@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: kernel@pengutronix.de, fabio.estevam@nxp.com, devicetree@vger.kernel.org, michael@amarulasolutions.com, jagan@amarulasolutions.com, Shyam Saini <shyam@amarulasolutions.com>
List-ID: <devicetree@vger.kernel.org>

From: Shyam Saini <shyam@amarulasolutions.com>

This patch fixes the wrongly included dtsi file which
was breaking mainline support for Engicam i.CoreM6 DualLite/Solo RQS.

As per the board name, the correct file should be imx6dl.dtsi instead
of imx6q.dtsi

Reported-by: Michael Trimarchi <michael@amarulasolutions.com>
Suggested-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Shyam Saini <shyam@amarulasolutions.com>
---
 arch/arm/boot/dts/imx6dl-icore-rqs.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6dl-icore-rqs.dts b/arch/arm/boot/dts/imx6dl-icore-rqs.dts
index cf42c2f..1281bc3 100644
--- a/arch/arm/boot/dts/imx6dl-icore-rqs.dts
+++ b/arch/arm/boot/dts/imx6dl-icore-rqs.dts
@@ -42,7 +42,7 @@
 
 /dts-v1/;
 
-#include "imx6q.dtsi"
+#include "imx6dl.dtsi"
 #include "imx6qdl-icore-rqs.dtsi"
 
 / {
-- 
2.7.4

