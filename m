From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH RESEND v1 0/4] dt-binding: clk: prepare for imx8qm clock
 support
Date: Wed, 16 Jan 2019 05:40:01 +0000
Message-ID: <AM0PR04MB42115D3E98B8B319936AC60E80820@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
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
To: Aisheng Dong <aisheng.dong@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Ping...

BTW, as the first two patches change the same firmware binding doc fs.scu.txt.
I'm not sure whether it should go to Shawn's tree for the binding part, or Stephen's clock tree.

Shawn & Stephen,
What's your suggestion?

Regards
Dong Aisheng

> From: Aisheng Dong [mailto:aisheng.dong@nxp.com]
> Sent: Friday, January 11, 2019 7:56 PM
> 
> After a bit more investigation on IMX8QM, it seemed SCU clock can be used in
> a similar way as IMX8QXP. So update the binding and driver to be a bit generic
> for easily extension of IMX8QM support later.
> 
> Dong Aisheng (4):
>   dt-bindings: fsl: scu: add fallback compatible string for clock
>   dt-bindings: fsl: scu: add imx8qm scu clock support
>   clk: imx: scu: add fallback compatible string support
>   dt-bindings: imx8-clock: add a53 and a72 clock id
> 
>  Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 7 +++++--
>  drivers/clk/imx/clk-imx8qxp.c                               | 1 +
>  include/dt-bindings/clock/imx8-clock.h                      | 6 ++++--
>  3 files changed, 10 insertions(+), 4 deletions(-)
> 
> --
> 2.7.4
