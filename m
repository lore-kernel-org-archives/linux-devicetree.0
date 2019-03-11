Return-Path: <bunk@kernel.org>
From: Adrian Bunk <bunk@kernel.org>
Subject: [PATCH 2/2] pps-gpio.c: Add capture-clear
Date: Mon, 11 Mar 2019 16:59:51 +0200
Message-Id: <20190311145951.847-2-bunk@kernel.org>
In-Reply-To: <20190311145951.847-1-bunk@kernel.org>
References: <20190311145951.847-1-bunk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The code was already there but the device tree wiring was missing,
resulting in out-of-tree patches enabling it in various places.

This is safe to backport since it only has an effect if enabled
in the device tree.

Signed-off-by: Adrian Bunk <bunk@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/pps/clients/pps-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpio.c
index dd5d1103e02b..f6549c4c9c81 100644
--- a/drivers/pps/clients/pps-gpio.c
+++ b/drivers/pps/clients/pps-gpio.c
@@ -119,6 +119,8 @@ static int pps_gpio_probe(struct platform_device *pdev)
 
 		if (of_get_property(np, "assert-falling-edge", NULL))
 			data->assert_falling_edge = true;
+		if (of_get_property(np, "capture-clear", NULL))
+			data->capture_clear = true;
 	}
 
 	/* GPIO setup */
-- 
2.20.1
