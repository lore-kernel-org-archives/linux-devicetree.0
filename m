From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 3/3] reset: imx7: Add support for i.MX8MQ IP block
 variant
Date: Wed, 23 Jan 2019 11:49:20 +0100
Message-ID: <1548240560.3904.6.camel@pengutronix.de>
References: <20190122021043.25449-1-andrew.smirnov@gmail.com>
         <20190122021043.25449-4-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122021043.25449-4-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, cphealy@gmail.com, l.stach@pengutronix.de, Leonard Crestez <leonard.crestez@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andrey,

On Mon, 2019-01-21 at 18:10 -0800, Andrey Smirnov wrote:
> Add bits and pieces needed to support IP block variant found on
> i.MX8MQ SoCs.
> 
> Cc: p.zabel@pengutronix.de
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: cphealy@gmail.com
> Cc: l.stach@pengutronix.de
> Cc: Leonard Crestez <leonard.crestez@nxp.com>
> Cc: "A.s. Dong" <aisheng.dong@nxp.com>
> Cc: Richard Zhu <hongxing.zhu@nxp.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-imx@nxp.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
[...]
> +static int imx8mq_reset_assert(struct reset_controller_dev *rcdev,
> +			     unsigned long id)
                            ^
> +{
> +	return imx8mq_reset_set(rcdev, id, true);
> +}
> +
> +static int imx8mq_reset_deassert(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
                              ^
> +{
> +	return imx8mq_reset_set(rcdev, id, false);
> +}

Thank you, applied all three to reset/next with a small whitespace
alignment fix.

regards
Philipp
