From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 6/7] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Date: Mon, 6 May 2019 10:30:27 -0500
Message-ID: <CAL_Jsq+OywH+_caxtrBJF=nMVxFeHsuL8jbLq=a6VBXWiZ0ktA@mail.gmail.com>
References: <20190428024847.5046-1-peter.chen@nxp.com>
 <20190428024847.5046-7-peter.chen@nxp.com>
 <CAL_JsqLPK8kuYTT7ekZbAzywp2kr9xKA0_X3BAqVn5hShbPM+w@mail.gmail.com>
 <VI1PR04MB5327641FD0A21BB4C93A85A58B370@VI1PR04MB5327.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <VI1PR04MB5327641FD0A21BB4C93A85A58B370@VI1PR04MB5327.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Chen <peter.chen@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "balbi@kernel.org" <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 4, 2019 at 10:13 PM Peter Chen <peter.chen@nxp.com> wrote:
>
>
> > > ---
> > >  arch/arm/boot/dts/imx7ulp.dtsi | 30 ++++++++++++++++++++++++++++++
> > >  1 file changed, 30 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/imx7ulp.dtsi
> > > b/arch/arm/boot/dts/imx7ulp.dtsi index fca6e50f37c8..e2944f98eac6
> > > 100644
> > > --- a/arch/arm/boot/dts/imx7ulp.dtsi
> > > +++ b/arch/arm/boot/dts/imx7ulp.dtsi
> > > @@ -30,6 +30,7 @@
> > >                 serial1 = &lpuart5;
> > >                 serial2 = &lpuart6;
> > >                 serial3 = &lpuart7;
> > > +               usbphy0 = &usbphy1;
> >
> > Drop this. You shouldn't need an alias.
> >
>
> It is a derived USB PHY and used on most of i.mx chipidea USB controllers.
> At the source code, we use aligned id to know the controller number.
>
>         ret = of_alias_get_id(np, "usbphy");
>         if (ret < 0)
>                 dev_dbg(&pdev->dev, "failed to get alias id, errno %d\n", ret);
>         mxs_phy->port_id = ret;

fsl,anatop property should probably have cell to specify this.

>
> > >         };
> > >
> > >         cpus {
> > > @@ -133,6 +134,35 @@
> > >                         clock-names = "ipg", "per";
> > >                 };
> > >
> > > +               usbotg1: usb@40330000 {
> > > +                       compatible = "fsl,imx7ulp-usb", "fsl,imx6ul-usb",
> > > +                               "fsl,imx27-usb";
> > > +                       reg = <0x40330000 0x200>;
> > > +                       interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       clocks = <&pcc2 IMX7ULP_CLK_USB0>;
> > > +                       fsl,usbphy = <&usbphy1>;
> >
> > Don't use this for new users. Use the phy binding instead.
> >
>
> It is not a new user, the USB PHY used at imx7ulp is the same with imx6's.

New SoC is a new user. The chipidea core already supports using 'phys'
so you should be able to just use the common code.

Rob
