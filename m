From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [Patch v5 12/13] ARM: mxs: clk_register_clkdev mx28 usb clocks
Date: Wed, 13 Jun 2012 20:34:22 +0800
Message-ID: <1339590863-10564-13-git-send-email-richard.zhao@freescale.com>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1339590863-10564-1-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/clk/mxs/clk-imx28.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/mxs/clk-imx28.c b/drivers/clk/mxs/clk-imx28.c
index 2826a26..0201a0f 100644
--- a/drivers/clk/mxs/clk-imx28.c
+++ b/drivers/clk/mxs/clk-imx28.c
@@ -328,6 +328,10 @@ int __init mx28_clocks_init(void)
 	clk_register_clkdevs(clks[fec], fec_lookups, ARRAY_SIZE(fec_lookups));
 	clk_register_clkdevs(clks[can0], can0_lookups, ARRAY_SIZE(can0_lookups));
 	clk_register_clkdevs(clks[can1], can1_lookups, ARRAY_SIZE(can1_lookups));
+	clk_register_clkdev(clks[usb0_pwr], NULL, "8007c000.usbphy");
+	clk_register_clkdev(clks[usb1_pwr], NULL, "8007e000.usbphy");
+	clk_register_clkdev(clks[usb0], NULL, "80080000.usb");
+	clk_register_clkdev(clks[usb1], NULL, "80090000.usb");
 
 	for (i = 0; i < ARRAY_SIZE(clks_init_on); i++)
 		clk_prepare_enable(clks[clks_init_on[i]]);
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
