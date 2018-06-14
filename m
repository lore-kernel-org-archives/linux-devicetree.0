From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v3 3/4] soc: sunxi: sram: Add updated compatible
 string for A64 system control
Date: Thu, 14 Jun 2018 23:35:47 +0800
Message-ID: <20180614153548.9644-4-wens@csie.org>
References: <20180614153548.9644-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBW4WRLMQKGQEWXUUILQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180614153548.9644-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The SRAM mapping controls on Allwinner SoCs is located in a block called
"System Controls". This block also has registers for identifying the SoC,
reading the state of an external boot-related pin, and on some newer SoCs,
glue layer controls for the EMAC Ethernet controller.

The A64 variant compatible is renamed to "allwinner,a64-system-control"
to reflect this. The old A64 compatible is deprecated. So far we haven't
seen any actual use of it.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/soc/sunxi/sunxi_sram.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index eec7fc6e9f66..7fec1b160dbb 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -359,6 +359,10 @@ static const struct of_device_id sunxi_sram_dt_match[] = {
 		.compatible = "allwinner,sun50i-a64-sram-controller",
 		.data = &sun50i_a64_sramc_variant,
 	},
+	{
+		.compatible = "allwinner,sun50i-a64-system-control",
+		.data = &sun50i_a64_sramc_variant,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, sunxi_sram_dt_match);
-- 
2.17.1
