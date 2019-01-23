From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V2 3/5] dt-bindings: clock: update CPU clock ID name
Date: Wed, 23 Jan 2019 11:17:09 +0000
Message-ID: <AM0PR04MB4211EAC52F0744EB516717EE80990@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1548231044-4344-1-git-send-email-aisheng.dong@nxp.com>
 <1548231044-4344-4-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548231044-4344-4-git-send-email-aisheng.dong@nxp.com>
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
To: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Aisheng Dong
> Sent: Wednesday, January 23, 2019 4:17 PM
> To: linux-clk@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org; sboyd@kernel.org;
> mturquette@baylibre.com; shawnguo@kernel.org; Fabio Estevam
> <fabio.estevam@nxp.com>; dl-linux-imx <linux-imx@nxp.com>;
> kernel@pengutronix.de; robh+dt@kernel.org; devicetree@vger.kernel.org;
> Aisheng Dong <aisheng.dong@nxp.com>
> Subject: [PATCH V2 3/5] dt-bindings: clock: update CPU clock ID name
> 
> Update the CPU clocks to CPU cluster clock.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  include/dt-bindings/clock/imx8-clock.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/imx8-clock.h
> b/include/dt-bindings/clock/imx8-clock.h
> index 4236818..aa9b9a0 100644
> --- a/include/dt-bindings/clock/imx8-clock.h
> +++ b/include/dt-bindings/clock/imx8-clock.h
> @@ -12,7 +12,7 @@
>  #define IMX_CLK_DUMMY				0
> 
>  /* CPU */
> -#define IMX_A35_CLK					1

Sorry this one breaks the building as clock driver already use IMX_A35_CLK.
Will update and resend.

Regards
Dong Aisheng

> +#define IMX_CPU_CLUSTER_A35_CLK				1
> 
>  /* LSIO SS */
>  #define IMX_LSIO_MEM_CLK				2
> --
> 2.7.4
