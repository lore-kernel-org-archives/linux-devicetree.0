From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v7 3/6] dt-bindings: mailbox: imx-mu: add generic MU
 channel support
Date: Thu, 26 Jul 2018 15:19:57 +0530
Message-ID: <CABb+yY0kVFvQRBrU4j9t=_JcSUkcXMMSK5u=XSufM6XcmKiv-g@mail.gmail.com>
References: <20180726065331.6186-1-o.rempel@pengutronix.de>
 <20180726065331.6186-4-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180726065331.6186-4-o.rempel@pengutronix.de>
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

> Each MU has four pairs of rx/tx data register with four rx/tx interrupts
> which can also be used as a separate channel.
>
So the hardware actually supports 4 channels.

> -- #mbox-cells:  Must be 0. Number of cells in a mailbox
> +- #mbox-cells:  Must be:
> +               0 - for single channel mode. i.MX8* SCU protocol specific.
> +               1 - for multichannel (generic) mode.
> +
No, please.
DT bindings should reflect the real hardware, and not the software
mode we want the driver to work in.
Please define mbox-cells=1  and have the i.MX8* platform always ask
for channel-0.
