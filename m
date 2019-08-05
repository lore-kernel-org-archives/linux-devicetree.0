From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [RESEND PATCH v5 3/4] dt-bindings: mailbox: imx-mu: add imx7ulp
 MU support
Date: Mon, 5 Aug 2019 22:20:21 +0300
Message-ID: <CAEnQRZBHBzXGCAihRVpAT4LoUzrXbUWh53zzwM_7pNCesx55+g@mail.gmail.com>
References: <1564980742-19124-1-git-send-email-hongxing.zhu@nxp.com>
 <1564980742-19124-4-git-send-email-hongxing.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1564980742-19124-4-git-send-email-hongxing.zhu@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, jassisinghbrar@gmail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

+ Rob

On Mon, Aug 5, 2019 at 8:18 AM Richard Zhu <hongxing.zhu@nxp.com> wrote:
>
> There is a version 1.0 MU on imx7ulp, use "fsl,imx7ulp-mu" compatible
> to support it.
>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  Documentation/devicetree/bindings/mailbox/fsl,mu.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/fsl,mu.txt b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
> index f3cf77e..9c43357 100644
> --- a/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
> +++ b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
> @@ -21,6 +21,8 @@ Required properties:
>                 imx6sx, imx7s, imx8qxp, imx8qm.
>                 The "fsl,imx6sx-mu" compatible is seen as generic and should
>                 be included together with SoC specific compatible.
> +               There is a version 1.0 MU on imx7ulp, use "fsl,imx7ulp-mu"
> +               compatible to support it.
>  - reg :                Should contain the registers location and length
>  - interrupts : Interrupt number. The interrupt specifier format depends
>                 on the interrupt controller parent.
> --
> 2.7.4
>
