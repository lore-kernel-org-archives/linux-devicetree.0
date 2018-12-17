Return-Path: <SRS0=oElv=O2=gmail.com=ykaneko0929@kernel.org>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH/RFT v2 2/2] thermal: rcar_thermal: add R8A77990 support
Date: Mon, 17 Dec 2018 23:50:21 +0900
Message-Id: <1545058221-22529-3-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1545058221-22529-1-git-send-email-ykaneko0929@gmail.com>
References: <1545058221-22529-1-git-send-email-ykaneko0929@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add support for R-Car E3 (R8A77990) thermal support.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/thermal/rcar_thermal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
index 8014a20..30a12b8 100644
--- a/drivers/thermal/rcar_thermal.c
+++ b/drivers/thermal/rcar_thermal.c
@@ -117,6 +117,10 @@ struct rcar_thermal_priv {
 		.data = &rcar_gen3_thermal,
 	},
 	{
+		.compatible = "renesas,thermal-r8a77990",
+		.data = &rcar_gen3_thermal,
+	},
+	{
 		.compatible = "renesas,thermal-r8a77995",
 		.data = &rcar_gen3_thermal,
 	},
-- 
1.9.1
