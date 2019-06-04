From: Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH 1/3] rtc: pcf8563: Fix interrupt trigger method
Date: Tue,  4 Jun 2019 12:23:35 +0800
Message-ID: <20190604042337.26129-2-wens@kernel.org>
References: <20190604042337.26129-1-wens@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190604042337.26129-1-wens@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Chen-Yu Tsai <wens@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

The PCF8563 datasheet says the interrupt line is active low and stays
active until the events are cleared, i.e. a level trigger interrupt.

Fix the flags used to request the interrupt.

Fixes: ede3e9d47cca ("drivers/rtc/rtc-pcf8563.c: add alarm support")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---

Not sure if this would cause issues for other platforms. Ideally we'd
take the flags from the device tree, but it seems not all platforms
support this.

---
 drivers/rtc/rtc-pcf8563.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 3efc86c25d27..e358313466f1 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -605,7 +605,7 @@ static int pcf8563_probe(struct i2c_client *client,
 	if (client->irq > 0) {
 		err = devm_request_threaded_irq(&client->dev, client->irq,
 				NULL, pcf8563_irq,
-				IRQF_SHARED|IRQF_ONESHOT|IRQF_TRIGGER_FALLING,
+				IRQF_SHARED | IRQF_ONESHOT | IRQF_TRIGGER_LOW,
 				pcf8563_driver.driver.name, client);
 		if (err) {
 			dev_err(&client->dev, "unable to request IRQ %d\n",
-- 
2.20.1
