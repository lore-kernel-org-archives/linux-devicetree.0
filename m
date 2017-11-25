From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 2/2] pinctrl: sunxi: Disable strict mode for H5 driver
Date: Sat, 25 Nov 2017 12:02:00 +0000
Message-ID: <20171125120200.23294-3-andre.przywara@arm.com>
References: <20171125120200.23294-1-andre.przywara@arm.com>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBW5X4XIAKGQEDBRYPJQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171125120200.23294-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chris Obbard <obbardc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

All of the H5 boards in the kernel reference the MMC0 CD pin twice in
their DT, so strict mode will make the MMC driver fail to load.
To keep existing DTs working, disable strict mode in the H5 driver.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Reported-by: Chris Obbard <obbardc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c
index 97b48336f84a..a78d7b922ef4 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c
@@ -535,14 +535,16 @@ static const struct sunxi_pinctrl_desc sun50i_h5_pinctrl_data_broken = {
 	.pins = sun50i_h5_pins,
 	.npins = ARRAY_SIZE(sun50i_h5_pins),
 	.irq_banks = 2,
-	.irq_read_needs_mux = true
+	.irq_read_needs_mux = true,
+	.disable_strict_mode = true,
 };
 
 static const struct sunxi_pinctrl_desc sun50i_h5_pinctrl_data = {
 	.pins = sun50i_h5_pins,
 	.npins = ARRAY_SIZE(sun50i_h5_pins),
 	.irq_banks = 3,
-	.irq_read_needs_mux = true
+	.irq_read_needs_mux = true,
+	.disable_strict_mode = true,
 };
 
 static int sun50i_h5_pinctrl_probe(struct platform_device *pdev)
-- 
2.14.1
