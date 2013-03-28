From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v9 RESEND 4/4] ARM: dts: add sram for imx53 and imx6q
Date: Thu, 28 Mar 2013 16:23:06 +0100
Message-ID: <1364484186.4018.66.camel@pizza.hi.pengutronix.de>
References: <1363776767-2635-1-git-send-email-p.zabel@pengutronix.de>
	 <1363776767-2635-5-git-send-email-p.zabel@pengutronix.de>
	 <20130328025422.GH5429@S2101-09.ap.freescale.net>
	 <1364461518.4018.4.camel@pizza.hi.pengutronix.de>
	 <20130328142106.GA699@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130328142106.GA699@S2101-09.ap.freescale.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Huang Shijie <shijie8@gmail.com>, Dong Aisheng <dong.aisheng@linaro.org>, Matt Porter <mporter@ti.com>, Fabio Estevam <fabio.estevam@freescale.com>, Javier Martin <javier.martin@vista-silicon.com>, kernel@pengutronix.de, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 28.03.2013, 22:22 +0800 schrieb Shawn Guo:
> On Thu, Mar 28, 2013 at 10:05:18AM +0100, Philipp Zabel wrote:
> > > > +
> > > > +		ocram: ocram@f8000000 {
> > > > +			compatible = "fsl,imx-ocram", "mmio-sram";
> > > 
> > > We should probably just drop "fsl,imx-ocram".
> > > 
> > > Shawn
> > 
> > I thought that in the future somebody might want to implement some i.MX
> > OCRAM specifics in a different driver, like the L2 cache / OCRAM mode
> > switching, the timing settings, or the TrustZone bits that are
> > configurable in the IOMUXC GPR registers.
> 
> We can add i.MX OCRAM specific compatible when we see that real need.
> Also, generally we should use a specific chip/osc name rather than "imx"
> for compatible to specify the particular hardware version.

Alright, I'll drop it, then.

thanks
Philipp
