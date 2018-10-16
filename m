From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 2/4] crypto: mxs-dcp - Add support for dcp clk
Date: Tue, 16 Oct 2018 13:03:47 -0300
Message-ID: <CAOMZO5Ck846zd_Xo=9sVK0EAxNLsUsWiC59H2Ms6x8xoD8iwWw@mail.gmail.com>
References: <cover.1539705285.git.leonard.crestez@nxp.com> <dcbcaf888bbd0a35dcf34228df2d9eb4fd762ea7.1539705286.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dcbcaf888bbd0a35dcf34228df2d9eb4fd762ea7.1539705286.git.leonard.crestez@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, Horia Geanta Neag <horia.geanta@nxp.com>, Franck LENORMAND <franck.lenormand@nxp.com>, Aymen Sghaier <aymen.sghaier@nxp.com>, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>linux-kernel <l>
List-Id: devicetree@vger.kernel.org

Hi Leonard,

On Tue, Oct 16, 2018 at 12:58 PM Leonard Crestez
<leonard.crestez@nxp.com> wrote:

> +       /* DCP clock is optional, only used on some SOCs */
> +       sdcp->dcp_clk = devm_clk_get(dev, "dcp");
> +       if (IS_ERR(sdcp->dcp_clk)) {
> +               if (sdcp->dcp_clk != ERR_PTR(-ENOENT))
> +                       return PTR_ERR(sdcp->dcp_clk);
> +               sdcp->dcp_clk = NULL;

This dcp_clk assignment to NULL does not seem to be necessary.

> +
> +       ret = clk_prepare_enable(sdcp->dcp_clk);
> +       if (ret)
> +               return ret;
>
>         ret = devm_request_irq(dev, dcp_vmi_irq, mxs_dcp_irq, 0,
>                                "dcp-vmi-irq", sdcp);
>         if (ret) {
>                 dev_err(dev, "Failed to claim DCP VMI IRQ!\n");

In case of subsequent errors you should call
clk_disable_unprepare(sdcp->dcp_clk).
