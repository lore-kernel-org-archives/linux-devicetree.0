From: Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH v2 1/4] regulator: act8865: set correct number of regulators in pdata
Date: Sat,  5 Jul 2014 15:20:53 +0200
Message-ID: <1404566456-9121-2-git-send-email-b.galvani@gmail.com>
References: <1404566456-9121-1-git-send-email-b.galvani@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404566456-9121-1-git-send-email-b.galvani@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Wenyou Yang <wenyou.yang@atmel.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>, Axel Lin <axel.lin@ingics.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Beniamino Galvani <b.galvani@gmail.com>
List-Id: devicetree@vger.kernel.org

act8865_pdata_from_dt() populates the array pdata->regulators with all
the regulators and then assigns the field init_data only for the ones
actually found in the DT.

The patch changes the value assigned to pdata->num_regulators to match
the size of the array.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
Tested-by: Wenyou Yang <wenyou.yang@atmel.com>
---
 drivers/regulator/act8865-regulator.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/act8865-regulator.c b/drivers/regulator/act8865-regulator.c
index f07be36..52d1b6c 100644
--- a/drivers/regulator/act8865-regulator.c
+++ b/drivers/regulator/act8865-regulator.c
@@ -230,7 +230,7 @@ static int act8865_pdata_from_dt(struct device *dev,
 	if (!pdata->regulators)
 		return -ENOMEM;
 
-	pdata->num_regulators = matched;
+	pdata->num_regulators = ARRAY_SIZE(act8865_matches);
 	regulator = pdata->regulators;
 
 	for (i = 0; i < ARRAY_SIZE(act8865_matches); i++) {
-- 
1.7.10.4
