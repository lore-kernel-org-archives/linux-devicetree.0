From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH 0/5] clk: imx8qm: prepare for imx8qm clock support
Date: Fri, 21 Dec 2018 01:51:44 +0000
Message-ID: <AM0PR04MB421151E86936A1FAB5CD34D380B80@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1545232888-9302-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1545232888-9302-1-git-send-email-aisheng.dong@nxp.com>
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
To: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

The patch set is missed to CC Devicetree maintainers.
Copy Rob and Devicetree maillist.

Regards
Dong Aisheng

> -----Original Message-----
> From: Aisheng Dong
> Sent: Wednesday, December 19, 2018 11:27 PM
> To: linux-clk@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org; sboyd@kernel.org;
> mturquette@baylibre.com; shawnguo@kernel.org; Fabio Estevam
> <fabio.estevam@nxp.com>; dl-linux-imx <linux-imx@nxp.com>;
> kernel@pengutronix.de; Aisheng Dong <aisheng.dong@nxp.com>
> Subject: [PATCH 0/5] clk: imx8qm: prepare for imx8qm clock support
> 
> After a bit more investigation on IMX8QM, it seemed SCU clock can be used in
> a similar way as IMX8QXP. So update the binding and driver to be a bit generic
> for easily extension of IMX8QM support later.
> 
> Dong Aisheng (5):
>   dt-bindings: fsl: scu: add fallback compatible string for clock
>   dt-bindings: fsl: scu: add imx8qm scu clock support
>   clk: imx: scu: add fallback compatible string support
>   clk: imx8qxp: make the name of clock ID generic
>   dt-bindings: imx8-clock: add a53 and a72 clock id
> 
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt  |   7 +-
>  drivers/clk/imx/clk-imx8qxp-lpcg.c                 | 146 +++++------
>  drivers/clk/imx/clk-imx8qxp.c                      | 153 +++++------
>  include/dt-bindings/clock/imx8-clock.h             | 291
> +++++++++++++++++++++
>  include/dt-bindings/clock/imx8qxp-clock.h          | 289 --------------------
>  5 files changed, 446 insertions(+), 440 deletions(-)  create mode 100644
> include/dt-bindings/clock/imx8-clock.h
>  delete mode 100644 include/dt-bindings/clock/imx8qxp-clock.h
> 
> --
> 2.7.4
