From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V4 1/4] dt-bindings: arm: imx: Add the soc binding for
 i.MX8MN
Date: Tue, 6 Aug 2019 05:42:05 +0000
Message-ID: <DB3PR0402MB39162CCE914A9C250CC203BFF5D50__4544.99284257821$1565070142$gmane$org@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190619022145.42398-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190619022145.42398-1-Anson.Huang@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, "j.neuschaefer@gmx.net" <j.neuschaefer@gmx.net>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, Leo Li <leoyang.li@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Vabhav Sharma <vabhav.sharma@nxp.com>, Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Pramod Kumar <pramod.kumar_1@nxp.com>, Leonard Crestez <leonard.crestez@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, devicetree
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Ping for this patch series...

> From: Anson Huang <Anson.Huang@nxp.com>
> 
> This patch adds the soc & board binding for i.MX8MN.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> No change.
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml
> b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 407138e..b35abb1 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -177,6 +177,12 @@ properties:
>                - fsl,imx8mm-evk            # i.MX8MM EVK Board
>            - const: fsl,imx8mm
> 
> +      - description: i.MX8MN based Boards
> +        items:
> +          - enum:
> +              - fsl,imx8mn-ddr4-evk            # i.MX8MN DDR4 EVK Board
> +          - const: fsl,imx8mn
> +
>        - description: i.MX8QXP based Boards
>          items:
>            - enum:
> --
> 2.7.4
