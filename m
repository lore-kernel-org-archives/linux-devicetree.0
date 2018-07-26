From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v7 6/6] mailbox: Add support for i.MX7D messaging unit
Date: Thu, 26 Jul 2018 15:45:59 +0530
Message-ID: <CABb+yY1Fbj2GiO_zjwnvNFutjX_fRpxnuEoeu6Z3s4NAv2ugbg@mail.gmail.com>
References: <20180726065331.6186-1-o.rempel@pengutronix.de>
 <20180726065331.6186-7-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180726065331.6186-7-o.rempel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, ", linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream" <linux-arm-kernel@lists.infradead.org>, ",
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 26, 2018 at 12:23 PM, Oleksij Rempel
<o.rempel@pengutronix.de> wrote:

.....

> +
> +/* Control Register */
> +#define IMX_MU_xCR             0x24
> +/* Transmit Interrupt Enable */
> +#define IMX_MU_xCR_TIEn(x)     BIT(20 + (3 - (x)))
> +/* Receive Interrupt Enable */
> +#define IMX_MU_xCR_RIEn(x)     BIT(24 + (3 - (x)))
> +
> +#define IMX_MU_CHANS   4u
> +
The 'u' unnecessarily refreshes my knowledge of C  :)


> +struct imx_mu_con_priv {
> +       int                     irq;
> +       unsigned int            idx;
> +       char                    *irq_desc;
>
Having      char  irq_desc[16];    seems simpler than free/kfree upon
each startup/shutdown. Simply use snprintf() in probe().

The rest of the driver seems fine.

Cheers!
