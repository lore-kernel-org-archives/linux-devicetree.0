From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: fsl: pico-pi: Add a device tree for the
 PICO-PI-IMX8M
Date: Mon, 22 Jul 2019 10:03:46 +0800
Message-ID: <20190722020345.GR3738@dragon>
References: <20190625123407.15888-1-andradanciu1997@gmail.com>
 <20190718035523.GD11324@X250>
 <CAJNLGszB239AHpD+kRCPRWZaToTYHiq5YUHRjfRwTqknwHMdMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJNLGszB239AHpD+kRCPRWZaToTYHiq5YUHRjfRwTqknwHMdMA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andra Danciu <andradanciu1997@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, leoyang.li@nxp.com, Fabio Estevam <festevam@gmail.com>, aisheng.dong@nxp.com, l.stach@pengutronix.de, angus@akkea.ca, vabhav.sharma@nxp.com, pankaj.bansal@nxp.com, bhaskar.upadhaya@nxp.com, ping.bai@nxp.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Richard Hu <richard.hu@technexion.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, matti.vaittinen@fi.rohmeurope.com, linux-imx@nxp.com, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2019 at 02:12:10PM +0300, Andra Danciu wrote:
...
> > > +     pmic: pmic@4b {
> > > +             reg = <0x4b>;
> > > +             compatible = "rohm,bd71837";
> > > +             /* PMIC BD71837 PMIC_nINT GPIO1_IO12 */
> > > +             pinctrl-0 = <&pinctrl_pmic>;
> > > +             gpio_intr = <&gpio1 3 GPIO_ACTIVE_LOW>;
> >
> > Where is the bindings for this property?
> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt

I do not see property 'gpio_intr' in there.

Shawn
