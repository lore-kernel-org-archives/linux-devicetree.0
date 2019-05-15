From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 1/3] dt-bindings: clock: imx8mm: Add SNVS clock
Date: Wed, 15 May 2019 11:14:05 +0000
Message-ID: <DB3PR0402MB39164F45F288EB251D5C10F4F5090@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1557883490-22360-1-git-send-email-Anson.Huang@nxp.com>
 <AM0PR04MB6434DFD7728BD5B105EF2A31EE090@AM0PR04MB6434.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB6434DFD7728BD5B105EF2A31EE090@AM0PR04MB6434.eurprd04.prod.outlook.com>
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
To: Leonard Crestez <leonard.crestez@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, Jacky Bai <ping.bai@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi, Leonard

> -----Original Message-----
> From: Leonard Crestez
> Sent: Wednesday, May 15, 2019 6:18 PM
> To: Anson Huang <anson.huang@nxp.com>; shawnguo@kernel.org;
> sboyd@kernel.org; Jacky Bai <ping.bai@nxp.com>
> Cc: robh+dt@kernel.org; mark.rutland@arm.com; s.hauer@pengutronix.de;
> kernel@pengutronix.de; festevam@gmail.com; mturquette@baylibre.com;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; linux-clk@vger.kernel.org; dl-linux-imx <linux-
> imx@nxp.com>; Abel Vesa <abel.vesa@nxp.com>
> Subject: Re: [PATCH 1/3] dt-bindings: clock: imx8mm: Add SNVS clock
> 
> On 15.05.2019 04:29, Anson Huang wrote:
> > Add macro for the SNVS clock of the i.MX8MM.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> > This patch is based on patch:
> > https://patchwork.kernel.org/patch/10939997/
> 
> Numbering also conflicts with one of my patches:
> 
> https://patchwork.kernel.org/patch/10940303/
> 
> The conflict is easy to resolve but I don't mind resending if your patches get
> accepted first. If should probably resend anyway to also add gic clk to 8mq.

Thanks, I did NOT notice this, feel free if want me to resend the patch set, both
the GPIO clock and SNVS clock patch series.

Thanks,
Anson.
> 
> For series:
> 
> Reviewed-by: Leonard Crestez <leonard.crestez@nxp.com>
