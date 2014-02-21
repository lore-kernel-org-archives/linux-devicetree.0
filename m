From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v10 01/15] usb: doc: phy-mxs: Add more compatible
 strings
Date: Fri, 21 Feb 2014 12:38:31 +0000
Message-ID: <20140221123831.GG8783@e106331-lin.cambridge.arm.com>
References: <1392873284-9386-1-git-send-email-peter.chen@freescale.com>
 <1392873284-9386-2-git-send-email-peter.chen@freescale.com>
 <20140221091345.GA7541@e106331-lin.cambridge.arm.com>
 <5e4d795b507a4ea7b9faa69dd05148c4@BL2PR03MB226.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5e4d795b507a4ea7b9faa69dd05148c4@BL2PR03MB226.namprd03.prod.outlook.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <Peter.Chen@freescale.com>
Cc: "balbi@ti.com" <balbi@ti.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Pawel Moll <Pawel.Moll@arm.com>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "festevam@gmail.com" <festevam@gmail.com>, "marex@denx.de" <marex@denx.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>, "Frank.Li@freescale.com" <Frank.Li@freescale.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 21, 2014 at 09:40:29AM +0000, Peter Chen wrote:
>  
> > >
> > >  Required properties:
> > > -- compatible: Should be "fsl,imx23-usbphy"
> > > +- compatible: "fsl,imx23-usbphy" for imx23 and imx28, "fsl,imx6q-
> > usbphy"
> > > +  for imx6dq and imx6dl, "fsl,imx6sl-usbphy" for imx6sl
> > 
> > Minor nit, but could we restructure this as something like the following,
> > with each string on a new line:
> > 
> > - compatible: should contain:
> >     * "fsl,imx23-usbphy" for imx23 and imx28
> >     * "fsl,imx6q-usbphy" for imx6dq and imx6dl
> >     * "fsl,imx6sl-usbphy" for imx6sl
> > 
> > It makes it a bit easier to read.
> 
> Thanks, will change like above.
> 
> > 
> > I see the existing "fsl,imx23-usbphy" is used as a fallback for
> > "fsl,imx28-usbphy", "fsl,imx6q-usbphy", and "fsl,imx6sl-usbphy" in
> > existing DTs.
> > 
> > Is this expected going forward? It might be worth mentioning.
> > 
> 
> These SoCs used the same FSL imx PHY, but different versions.
> imx23/imx28 are the first version, more improvements are at
> later SoCs (like imx6x) version. Keep "fsl,imx23-usbphy" at
> imx6 dts will be user know it is from imx23's. If you think
> it does not need, I can delete "fsl,imx23-usbphy" from imx6 dts.

I'm not arguing to remove it, I'm suggesting it might be worth
mentioning that it's not mutually exclusive, and can be a fallback for
the other strings.

Cheers,
Mark.
