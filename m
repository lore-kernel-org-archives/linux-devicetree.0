Return-Path: <SRS0=HJQ3=KR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mout.gmx.net ([212.227.15.15]:59977 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727046AbeHBKf5 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 2 Aug 2018 06:35:57 -0400
From: Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH] ARM: dts: paz00: fix wakeup gpio keycode
Date: Thu,  2 Aug 2018 10:45:40 +0200
Message-Id: <92555b9110d94f5689a3ab59c1b31387635e7178.1533199116.git.marvin24@gmx.de>
Sender: devicetree-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Marc Dietrich <marvin24@gmx.de>
List-ID: <devicetree@vger.kernel.org>

The power key is controlled solely by the EC, which only tiggeres this
gpio after wakeup.
Fixes immediately return to suspend after wake from LP1.

Signed-off-by: Marc Dietrich <marvin24@gmx.de>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index ef245291924f..4f9b4a889feb 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -524,10 +524,10 @@
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		power {
-			label = "Power";
+		wakeup {
+			label = "Wakeup";
 			gpios = <&gpio TEGRA_GPIO(J, 7) GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_POWER>;
+			linux,code = <KEY_WAKEUP>;
 			wakeup-source;
 		};
 	};
-- 
2.17.1

