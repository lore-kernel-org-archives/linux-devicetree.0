From: Geoff Lansberry <geoff@kuvee.com>
Subject: [PATCH v3 3/3] nfc: trf7970a: Prevent repeated polling from crashing the kernel
Date: Wed, 21 Dec 2016 23:18:34 -0500
Message-ID: <1482380314-16440-3-git-send-email-geoff@kuvee.com>
References: <1482380314-16440-1-git-send-email-geoff@kuvee.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1482380314-16440-1-git-send-email-geoff@kuvee.com>
Sender: netdev-owner@vger.kernel.org
To: linux-wireless@vger.kernel.org
Cc: lauro.venancio@openbossa.org, aloisio.almeida@openbossa.org, sameo@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mgreer@animalcreek.com, justin@kuvee.com, Jaret Cantu <jaret.cantu@timesys.com>, Geoff Lansberry <geoff@kuvee.com>
List-Id: devicetree@vger.kernel.org

From: Jaret Cantu <jaret.cantu@timesys.com>

Repeated polling attempts cause a NULL dereference error to occur.
This is because the state of the trf7970a is currently reading but
another request has been made to send a command before it has finished.

The solution is to properly kill the waiting reading (workqueue)
before failing on the send.

Signed-off-by: Geoff Lansberry <geoff@kuvee.com>
---
 drivers/nfc/trf7970a.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index e3c72c6..ba5f9b8 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -1496,6 +1496,10 @@ static int trf7970a_send_cmd(struct nfc_digital_dev *ddev,
 			(trf->state != TRF7970A_ST_IDLE_RX_BLOCKED)) {
 		dev_err(trf->dev, "%s - Bogus state: %d\n", __func__,
 				trf->state);
+		if (trf->state == TRF7970A_ST_WAIT_FOR_RX_DATA ||
+		    trf->state == TRF7970A_ST_WAIT_FOR_RX_DATA_CONT)
+			trf->ignore_timeout =
+				!cancel_delayed_work(&trf->timeout_work);
 		ret = -EIO;
 		goto out_err;
 	}
-- 
2.7.4
