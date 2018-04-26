Return-Path: <SRS0=DPw9=HP=ragnatech.se=niklas.soderlund+renesas@kernel.org>
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/2] thermal: rcar_gen3_thermal: add r8a77965 support
Date: Thu, 26 Apr 2018 21:42:02 +0200
Message-Id: <20180426194202.31662-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180426194202.31662-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180426194202.31662-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Rob Herring <robh+dt@kernel.org>, Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/thermal/rcar_gen3_thermal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 561a0a332208504a..c04182e1518cd613 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -329,6 +329,7 @@ static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
 static const struct of_device_id rcar_gen3_thermal_dt_ids[] = {
 	{ .compatible = "renesas,r8a7795-thermal", },
 	{ .compatible = "renesas,r8a7796-thermal", },
+	{ .compatible = "renesas,r8a77965-thermal", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rcar_gen3_thermal_dt_ids);
-- 
2.17.0
