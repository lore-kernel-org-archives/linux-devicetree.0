From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/6] staging: board: armadillo800eva: Use "arm,pl390"
Date: Fri, 20 Nov 2015 13:36:57 +0100
Message-ID: <1448023017-21816-7-git-send-email-geert+renesas@glider.be>
References: <1448023017-21816-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1448023017-21816-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Must be applied together with "ARM: shmobile: r8a7740 dtsi: Use
"arm,pl390" for GIC"!

Greg: Can you please provide your ack? Thanks!
---
 drivers/staging/board/armadillo800eva.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/board/armadillo800eva.c b/drivers/staging/board/armadillo800eva.c
index 9c41652ee908b5e8..912c96b0536def7c 100644
--- a/drivers/staging/board/armadillo800eva.c
+++ b/drivers/staging/board/armadillo800eva.c
@@ -97,7 +97,7 @@ static const struct board_staging_dev armadillo800eva_devices[] __initconst = {
 
 static void __init armadillo800eva_init(void)
 {
-	board_staging_gic_setup_xlate("arm,cortex-a9-gic", 32);
+	board_staging_gic_setup_xlate("arm,pl390", 32);
 	board_staging_register_devices(armadillo800eva_devices,
 				       ARRAY_SIZE(armadillo800eva_devices));
 }
-- 
1.9.1

