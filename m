From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v7 2/6] dt-bindings: arm: fsl: add mu binding doc
Date: Thu, 26 Jul 2018 15:26:33 +0530
Message-ID: <CABb+yY3+8+-popsTx2n-bNeBEVAdJrG_b4GmZm9DHr_L=abQ=A@mail.gmail.com>
References: <20180726065331.6186-1-o.rempel@pengutronix.de>
 <20180726065331.6186-3-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180726065331.6186-3-o.rempel@pengutronix.de>
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
 srv_heupstream" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 26, 2018 at 12:23 PM, Oleksij Rempel
<o.rempel@pengutronix.de> wrote:
> From: Dong Aisheng <aisheng.dong@nxp.com>
>
> The Messaging Unit module enables two processors within
> the SoC to communicate and coordinate by passing messages
> (e.g. data, status and control) through the MU interface.
>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  .../devicetree/bindings/mailbox/fsl,mu.txt    | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/fsl,mu.txt
>
> diff --git a/Documentation/devicetree/bindings/mailbox/fsl,mu.txt b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
> new file mode 100644
> index 000000000000..90e4905dfc69
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
> @@ -0,0 +1,34 @@
> +NXP i.MX Messaging Unit (MU)
> +--------------------------------------------------------------------
> +
> +The Messaging Unit module enables two processors within the SoC to
> +communicate and coordinate by passing messages (e.g. data, status
> +and control) through the MU interface. The MU also provides the ability
> +for one processor to signal the other processor using interrupts.
> +
> +Because the MU manages the messaging between processors, the MU uses
> +different clocks (from each side of the different peripheral buses).
> +Therefore, the MU must synchronize the accesses from one side to the
> +other. The MU accomplishes synchronization using two sets of matching
> +registers (Processor A-facing, Processor B-facing).
> +
> +Messaging Unit Device Node:
> +=============================
> +
> +Required properties:
> +-------------------
> +- compatible : should be "fsl,<chip>-mu", the supported chips include
> +               imx8qxp, imx8qm.
> +- reg :                Should contain the registers location and length
> +- interrupts : Interrupt number. The interrupt specifier format depends
> +               on the interrupt controller parent.
> +- #mbox-cells:  Must be 0. Number of cells in a mailbox
>
Please consider my reply to patch-3
