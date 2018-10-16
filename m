From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH V2 2/4] arm64: dts: imx: add imx8qxp support
Date: Tue, 16 Oct 2018 09:08:01 +0200
Message-ID: <20181016070801.h2tohd4u436ei46c@pengutronix.de>
References: <1539527419-23613-1-git-send-email-aisheng.dong@nxp.com>
 <1539527419-23613-3-git-send-email-aisheng.dong@nxp.com>
 <20181015065859.lxevjroly435hlaq@pengutronix.de>
 <AM0PR04MB42117867A50BB18D8127BE8080FD0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20181015082751.ytuleg67p5pgtnov@pengutronix.de>
 <AM0PR04MB421179CEB214D46BCDE6ACF280FD0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20181015094053.7bpydkdhyds25n3u@pengutronix.de>
 <AM0PR04MB421179F1C5B93209D398B4F380FD0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <AM0PR04MB421179F1C5B93209D398B4F380FD0@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "A.s. Dong" <aisheng.dong@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dongas86@gmail.com" <dongas86@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 15, 2018 at 04:09:01PM +0000, A.s. Dong wrote:
> > -----Original Message-----
> > From: Sascha Hauer [mailto:s.hauer@pengutronix.de]
> > Sent: Monday, October 15, 2018 5:41 PM
> > To: A.s. Dong <aisheng.dong@nxp.com>
> > Cc: linux-arm-kernel@lists.infradead.org; Mark Rutland
> > <mark.rutland@arm.com>; dongas86@gmail.com; devicetree@vger.kernel.org;
> > catalin.marinas@arm.com; will.deacon@arm.com; robh+dt@kernel.org;
> > dl-linux-imx <linux-imx@nxp.com>; kernel@pengutronix.de; Fabio Estevam
> > <fabio.estevam@nxp.com>; shawnguo@kernel.org
> > Subject: Re: [PATCH V2 2/4] arm64: dts: imx: add imx8qxp support
> > 
> > On Mon, Oct 15, 2018 at 09:03:04AM +0000, A.s. Dong wrote:
> > > > -----Original Message-----
> > > > From: Sascha Hauer [mailto:s.hauer@pengutronix.de]
> > > > Sent: Monday, October 15, 2018 4:28 PM
> > > > To: A.s. Dong <aisheng.dong@nxp.com>
> > > > Cc: linux-arm-kernel@lists.infradead.org; Mark Rutland
> > > > <mark.rutland@arm.com>; dongas86@gmail.com;
> > > > devicetree@vger.kernel.org; catalin.marinas@arm.com;
> > > > will.deacon@arm.com; robh+dt@kernel.org; dl-linux-imx
> > > > <linux-imx@nxp.com>; kernel@pengutronix.de; Fabio Estevam
> > > > <fabio.estevam@nxp.com>; shawnguo@kernel.org
> > > > Subject: Re: [PATCH V2 2/4] arm64: dts: imx: add imx8qxp support
> > > >
> > > > On Mon, Oct 15, 2018 at 08:08:31AM +0000, A.s. Dong wrote:
> > > > > > > +		imx8qx-pm {
> > > > > > > +			compatible = "fsl,scu-pd";
> > > > > >
> > > > > > I missed this earlier, but there should be a i.MX8qp specific
> > > > > > compatible as the SCU API might change for future SoCs.
> > > > > >
> > > > >
> > > > > We still do not see that requirement up till now. Not sure if it
> > > > > would be possible in the future. I see low possibilities.
> > > > > SCU IPC is designed to be generic to all MX8 SCU firmwares.
> > > >
> > > > And i.MX9? i.MX10?
> > > >
> > >
> > > MX8DM MX8DXP
> > 
> > I was not talking about existing SoCs, I was talking about future SoCs.
> > 
> > >
> > > > > Even it changes, SCU firmware version control may helps.
> > > >
> > > > It's not the first time that the position of the version field
> > > > changes with a newer version.
> > > >
> > >
> > > I understand your worry.
> > > Up till now all SCU firmware based SoCs are all using one generic IPC driver
> > internally.
> > > And I have not heard a possible changing in the future.
> > > I double checked the SCU firmware implementation that the IPC Is
> > > deigned to be platform independent. So it's less to be changed.
> > > So I wonder if this could be over worried.
> > > Even it is changed, (quite less probility), we still can user version
> > > To distinguish them, just like arm,scpi , arm,scmi. Right?
> > 
> > You can still add and use a generic compatible, but does it hurt when you add
> > a SoC specific one that you *can* use should you have to?
> > 
> 
> Do you mean only change "fsl,scu-pd" to "fsl,imx8qxp-scu-pd"?
> And keep the "fsl,imx-scu" as it is, right?

Yes, that's what I meant.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
