From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 01/14] clk: rockchip: add more clk ids for rv1108
Date: Tue, 01 Aug 2017 01:27:45 +0200
Message-ID: <3065556.yAAG1ix4ad@phil>
References: <1501495449-21290-1-git-send-email-andy.yan@rock-chips.com> <1501495602-21351-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1501495602-21351-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org, shawn.lin@rock-chips.com, zhangqing@rock-chips.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Montag, 31. Juli 2017, 18:06:42 CEST schrieb Andy Yan:
> From: Elaine Zhang <zhangqing@rock-chips.com>
> 
> Added the missing clock ids, make the clock more complete.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

this clock-id patch is way to overloaded. Please split into 3 parts:

- completely new clock-ids
- changes to existing clock-ids
  This also needs a very good reasoning, as such constant ids are
  considered part of api and should not change to prevent breakage
  with old devicetrees. So please double-check if the rename is really
  necessary.
- cosmetics ... aka the indentation stuff

[...]

>  /* aclk gates */
>  #define ACLK_DMAC			192
> -#define ACLK_PRE			193
> +#define ACLK_BUS			193

This is one such case where you need a very good reason

[...]

> @@ -59,18 +120,30 @@
>  #define PCLK_I2C2			261
>  #define PCLK_I2C3			262
>  #define PCLK_SPI			263
> -#define PCLK_SFC			264

why is this clock going away?

>  #define PCLK_UART0			265
>  #define PCLK_UART1			266
>  #define PCLK_UART2			267
>  #define PCLK_TSADC			268
> -#define PCLK_PWM			269
> +#define PCLK_PWM1			269

In your pwm patch, all blocks use the same clocks, so
this rename should be unnecessary


>  /* hclk gates */
>  #define HCLK_I2S0_8CH			320
> -#define HCLK_I2S1_8CH			321
> +#define HCLK_I2S1_2CH			321

Again reasoning required (that i2s1 has 2 channels
but not 8 should be ok for that)

>  #define HCLK_I2S2_2CH			322
>  #define HCLK_NANDC			323
>  #define HCLK_SDMMC			324

Heiko
