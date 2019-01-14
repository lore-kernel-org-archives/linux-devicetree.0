From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: fsl: Add devicetree binding for Oxalis
Date: Mon, 14 Jan 2019 12:02:47 -0600
Message-ID: <CAL_JsqJpRPrCpRTpqh1v6JZwpEtZnaeuLTHR+0EiMSoxbk9zeQ@mail.gmail.com>
References: <20190114102053.16013-1-manivannan.sadhasivam@linaro.org> <20190114102053.16013-3-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190114102053.16013-3-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Yang-Leo Li <leoyang.li@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, a.tropschug@ebs-systart.com, m.bittner@ebs-systart.com, Amit Kucheria <amit.kucheria@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 14, 2019 at 4:21 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Add devicetree binding for Oxalis board in JSON format. While adding
> that, let's fix the description for LS1012A also.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index d34fe0749199..0f30142fe316 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -173,12 +173,13 @@ properties:
>                - fsl,vf610
>                - fsl,vf610m4
>
> -      - description: LS1021A based Boards
> +      - description: LS1012A based Boards

Well, yes that was wrong...

>          items:
>            - enum:
>                - fsl,ls1012a-rdb
>                - fsl,ls1012a-frdm
>                - fsl,ls1012a-qds
> +              - ebs-systart,oxalis

Sort alphabetically.

>            - const: fsl,ls1021a

And this is wrong too.

I you just change it, then we will be missing an entry for LS1021A.
What's the status of that SoC because there is no board dts file? We
should not have .dtsi files in the kernel which don't get built.

Rob
