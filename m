Return-Path: <SRS0=pf7g=HG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:22768 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752261AbeDQUz5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 17 Apr 2018 16:55:57 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a7795: decrease temperature hysteresis
Date: Tue, 17 Apr 2018 22:54:27 +0200
Message-Id: <20180417205428.15227-2-niklas.soderlund@ragnatech.se>
In-Reply-To: <20180417205428.15227-1-niklas.soderlund@ragnatech.se>
References: <20180417205428.15227-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

To incorporate more tests by the hardware team decrease the hysteresis
value to 1C.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 5ae85d8a7685aec8..6eaa7c78d8402a7c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -2826,12 +2826,12 @@
 			trips {
 				sensor1_passive: sensor1-passive {
 					temperature = <95000>;
-					hysteresis = <2000>;
+					hysteresis = <1000>;
 					type = "passive";
 				};
 				sensor1_crit: sensor1-crit {
 					temperature = <120000>;
-					hysteresis = <2000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -2852,12 +2852,12 @@
 			trips {
 				sensor2_passive: sensor2-passive {
 					temperature = <95000>;
-					hysteresis = <2000>;
+					hysteresis = <1000>;
 					type = "passive";
 				};
 				sensor2_crit: sensor2-crit {
 					temperature = <120000>;
-					hysteresis = <2000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -2878,12 +2878,12 @@
 			trips {
 				sensor3_passive: sensor3-passive {
 					temperature = <95000>;
-					hysteresis = <2000>;
+					hysteresis = <1000>;
 					type = "passive";
 				};
 				sensor3_crit: sensor3-crit {
 					temperature = <120000>;
-					hysteresis = <2000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
-- 
2.17.0

