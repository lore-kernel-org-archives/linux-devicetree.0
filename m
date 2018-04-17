Return-Path: <SRS0=pf7g=HG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:57579 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752883AbeDQVBa (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 17 Apr 2018 17:01:30 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCH 2/2] thermal: rcar_gen3_thermal: add r8a77965 support
Date: Tue, 17 Apr 2018 23:00:45 +0200
Message-Id: <20180417210045.15798-3-niklas.soderlund@ragnatech.se>
In-Reply-To: <20180417210045.15798-1-niklas.soderlund@ragnatech.se>
References: <20180417210045.15798-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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

