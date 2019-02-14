From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [RFC 2/5] dt-bindings: imx8mq-clock: Add the missing ARM clock
Date: Thu, 14 Feb 2019 16:51:46 +0100
Message-ID: <1550159506.2546.42.camel@pengutronix.de>
References: <1550084693-9797-1-git-send-email-abel.vesa@nxp.com>
         <1550084693-9797-3-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550084693-9797-3-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Angus Ainslie <angus.ainslie@puri.sm>, Anson Huang <anson.huang@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 13.02.2019, 19:05 +0000 schrieb Abel Vesa:
> Add the missing ARM clock which will be used by cpufreq
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  include/dt-bindings/clock/imx8mq-clock.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/imx8mq-clock.h b/include/dt-
> bindings/clock/imx8mq-clock.h
> index 04f7ac3..47c790c 100644
> --- a/include/dt-bindings/clock/imx8mq-clock.h
> +++ b/include/dt-bindings/clock/imx8mq-clock.h
> @@ -391,5 +391,7 @@
>  
>  #define IMX8MQ_CLK_NAND_USDHC_BUS_RAWNAND_CLK	267
>  
> -#define IMX8MQ_CLK_END				268
> +#define IMX8MQ_CLK_ARM				268
> +
> +#define IMX8MQ_CLK_END				269
>  #endif /* __DT_BINDINGS_CLOCK_IMX8MQ_H */
