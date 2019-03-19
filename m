From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v6 07/13] mtd: rawnand: ingenic: Rename jz4780_bch_init to jz4780_bch_reset
Date: Tue, 19 Mar 2019 15:53:57 +0100
Message-ID: <20190319145403.31627-8-paul@crapouillou.net>
References: <20190319145403.31627-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319145403.31627-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The jz4780_bch_init name was confusing, as it suggested that its content
should be executed once at init time, whereas what the function really
does is reset the hardware for a new ECC operation.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v5: New patch
    
    v6: No change

 drivers/mtd/nand/raw/ingenic/jz4780_bch.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
index fdf483a49f7b..7635753bd7ea 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
@@ -69,8 +69,8 @@ struct jz4780_bch {
 	struct mutex lock;
 };
 
-static void jz4780_bch_init(struct jz4780_bch *bch,
-			    struct jz4780_bch_params *params, bool encode)
+static void jz4780_bch_reset(struct jz4780_bch *bch,
+			     struct jz4780_bch_params *params, bool encode)
 {
 	u32 reg;
 
@@ -183,7 +183,8 @@ int jz4780_bch_calculate(struct jz4780_bch *bch, struct jz4780_bch_params *param
 	int ret = 0;
 
 	mutex_lock(&bch->lock);
-	jz4780_bch_init(bch, params, true);
+
+	jz4780_bch_reset(bch, params, true);
 	jz4780_bch_write_data(bch, buf, params->size);
 
 	if (jz4780_bch_wait_complete(bch, BCH_BHINT_ENCF, NULL)) {
@@ -220,7 +221,7 @@ int jz4780_bch_correct(struct jz4780_bch *bch, struct jz4780_bch_params *params,
 
 	mutex_lock(&bch->lock);
 
-	jz4780_bch_init(bch, params, false);
+	jz4780_bch_reset(bch, params, false);
 	jz4780_bch_write_data(bch, buf, params->size);
 	jz4780_bch_write_data(bch, ecc_code, params->bytes);
 
-- 
2.11.0
