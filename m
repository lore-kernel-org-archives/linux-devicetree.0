From: Talel Shenhar <talel@amazon.com>
Subject: [PATCH v2 3/3] soc: amazon: al-pos: cast to u64 before left shifting
Date: Tue, 10 Sep 2019 22:05:10 +0300
Message-ID: <1568142310-17622-4-git-send-email-talel@amazon.com>
References: <1568142310-17622-1-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568142310-17622-1-git-send-email-talel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, marc.zyngier@arm.com, tglx@linutronix.de, jason@lakedaemon.net, mark.rutland@arm.com, nicolas.ferre@microchip.com, mchehab+samsung@kernel.org, shawn.lin@rock-chips.com, gregkh@linuxfoundation.org, dwmw@amazon.co.uk, benh@kernel.crashing.org, talel@amazon.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Fix wrap around for pos errors on addresses above 32 bit.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Talel Shenhar <talel@amazon.com>
---
 drivers/soc/amazon/al_pos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/amazon/al_pos.c b/drivers/soc/amazon/al_pos.c
index a865111..e95e1fc 100644
--- a/drivers/soc/amazon/al_pos.c
+++ b/drivers/soc/amazon/al_pos.c
@@ -49,7 +49,7 @@ static irqreturn_t al_pos_irq_handler(int irq, void *info)
 	writel(0, pos->mmio_base + AL_POS_ERROR_LOG_1);
 
 	addr = FIELD_GET(AL_POS_ERROR_LOG_0_ADDR_LOW, log0);
-	addr |= (FIELD_GET(AL_POS_ERROR_LOG_1_ADDR_HIGH, log1) << 32);
+	addr |= (((u64)FIELD_GET(AL_POS_ERROR_LOG_1_ADDR_HIGH, log1)) << 32);
 	request_id = FIELD_GET(AL_POS_ERROR_LOG_1_REQUEST_ID, log1);
 	bresp = FIELD_GET(AL_POS_ERROR_LOG_1_BRESP, log1);
 
-- 
2.7.4
