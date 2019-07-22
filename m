From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Subject: RE: [PATCH v2] arm64: dts: fsl: pico-pi: Add a device tree for the
 PICO-PI-IMX8M
Date: Mon, 22 Jul 2019 17:40:43 +0000
Message-ID: <042F8805D2046347BB8420BEAE397A40749E9BDA@WILL-MAIL002.REu.RohmEu.com>
References: <20190625123407.15888-1-andradanciu1997@gmail.com>
 <20190718035523.GD11324@X250>
 <CAJNLGszB239AHpD+kRCPRWZaToTYHiq5YUHRjfRwTqknwHMdMA@mail.gmail.com>,<20190722020345.GR3738@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722020345.GR3738@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Andra Danciu <andradanciu1997@gmail.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>, Fabio Estevam <festevam@gmail.com>, "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "angus@akkea.ca" <angus@akkea.ca>, "vabhav.sharma@nxp.com" <vabhav.sharma@nxp.com>, "pankaj.bansal@nxp.com" <pankaj.bansal@nxp.com>, "bhaskar.upadhaya@nxp.com" <bhaskar.upadhaya@nxp.com>, "ping.bai@nxp.com" <ping.bai@nxp.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Richard Hu <richard.hu@technexion.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>, Daniel
List-Id: devicetree@vger.kernel.org

Sorry for top posting. I'm replying using mobile phone and outlook web app... 

gpio_intr is not needed. Irq must be given using the standard irq property. gpio_intr has been used in an old draft driver - I assume the dts originates from NXP bsp which used the old driver.

Br,
Matti Vaittinen

--
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes.  Just then, he vanished ~~~


________________________________________
From: Shawn Guo [shawnguo@kernel.org]
Sent: Monday, July 22, 2019 5:03 AM
To: Andra Danciu
Cc: robh+dt@kernel.org; mark.rutland@arm.com; leoyang.li@nxp.com; Fabio Estevam; aisheng.dong@nxp.com; l.stach@pengutronix.de; angus@akkea.ca; vabhav.sharma@nxp.com; pankaj.bansal@nxp.com; bhaskar.upadhaya@nxp.com; ping.bai@nxp.com; Manivannan Sadhasivam; Richard Hu; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Vaittinen, Matti; linux-imx@nxp.com; Daniel Baluta
Subject: Re: [PATCH v2] arm64: dts: fsl: pico-pi: Add a device tree for the PICO-PI-IMX8M

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
