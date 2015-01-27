From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH 3/3] usb: ohci: jz4740: prepare the clock before enabling it
Date: Tue, 27 Jan 2015 13:47:19 +0000
Message-ID: <1422366439-34641-4-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1422366439-34641-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422366439-34641-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org, lars@metafoo.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Zubair.Kakakhel@imgtec.com
List-Id: devicetree@vger.kernel.org

From: Paul Burton <paul.burton@imgtec.com>

The clock must have been prepared before enabling it.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 drivers/usb/host/ohci-jz4740.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ohci-jz4740.c b/drivers/usb/host/ohci-jz4740.c
index bb69733..1455a8b 100644
--- a/drivers/usb/host/ohci-jz4740.c
+++ b/drivers/usb/host/ohci-jz4740.c
@@ -189,7 +189,7 @@ static int jz4740_ohci_probe(struct platform_device *pdev)
 
 
 	clk_set_rate(jz4740_ohci->clk, 48000000);
-	clk_enable(jz4740_ohci->clk);
+	clk_prepare_enable(jz4740_ohci->clk);
 	if (jz4740_ohci->vbus)
 		ohci_jz4740_set_vbus_power(jz4740_ohci, true);
 
-- 
1.9.1
