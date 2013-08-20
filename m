Return-Path: <devicetree-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:27416 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751322Ab3HTIzF (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 20 Aug 2013 04:55:05 -0400
Date: Tue, 20 Aug 2013 11:54:48 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] crypto: tegra-aes - bitwise vs logical and
Message-ID: <20130820085447.GA20170@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.hengli.com.au>
Cc: "David S. Miller" <davem@davemloft.net>, Stephen Warren <swarren@wwwdotorg.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The bug here is that:

	while (eng_busy & (!icq_empty) & dma_busy)

is never true because it's using bitwise instead of logical ANDs.  The
other bitwise AND conditions work as intended but I changed them as well
for consistency.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  I don't have the hardware.

diff --git a/drivers/crypto/tegra-aes.c b/drivers/crypto/tegra-aes.c
index 85ea752..2d58da9 100644
--- a/drivers/crypto/tegra-aes.c
+++ b/drivers/crypto/tegra-aes.c
@@ -275,7 +275,7 @@ static int aes_start_crypt(struct tegra_aes_dev *dd, u32 in_addr, u32 out_addr,
 			value = aes_readl(dd, TEGRA_AES_INTR_STATUS);
 			eng_busy = value & TEGRA_AES_ENGINE_BUSY_FIELD;
 			icq_empty = value & TEGRA_AES_ICQ_EMPTY_FIELD;
-		} while (eng_busy & (!icq_empty));
+		} while (eng_busy && !icq_empty);
 		aes_writel(dd, cmdq[i], TEGRA_AES_ICMDQUE_WR);
 	}
 
@@ -365,7 +365,7 @@ static int aes_set_key(struct tegra_aes_dev *dd)
 		eng_busy = value & TEGRA_AES_ENGINE_BUSY_FIELD;
 		icq_empty = value & TEGRA_AES_ICQ_EMPTY_FIELD;
 		dma_busy = value & TEGRA_AES_DMA_BUSY_FIELD;
-	} while (eng_busy & (!icq_empty) & dma_busy);
+	} while (eng_busy && !icq_empty && dma_busy);
 
 	/* settable command to get key into internal registers */
 	value = CMD_SETTABLE << CMDQ_OPCODE_SHIFT |
@@ -379,7 +379,7 @@ static int aes_set_key(struct tegra_aes_dev *dd)
 		value = aes_readl(dd, TEGRA_AES_INTR_STATUS);
 		eng_busy = value & TEGRA_AES_ENGINE_BUSY_FIELD;
 		icq_empty = value & TEGRA_AES_ICQ_EMPTY_FIELD;
-	} while (eng_busy & (!icq_empty));
+	} while (eng_busy && !icq_empty);
 
 	return 0;
 }
