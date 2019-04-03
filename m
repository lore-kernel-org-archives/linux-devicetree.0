From: Flavio Suligoi <f.suligoi@asem.it>
Subject: RE: [PATCH 2/2] rtc: pcf2127: add battery-low INTn generation
Date: Wed, 3 Apr 2019 15:14:24 +0000
Message-ID: <452a4cf1410a41c8b6f767ac6258482e@asem.it>
References: <1554303165-24813-1-git-send-email-f.suligoi@asem.it>
 <1554303165-24813-2-git-send-email-f.suligoi@asem.it>
 <20190403150824.GO22216@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190403150824.GO22216@piout.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

> On 03/04/2019 16:52:45+0200, Flavio Suligoi wrote:
> > The pcf2127 has an automatic battery-low detection function.
> >
> > In case of battery-low event, an interrupt generation through
> > the pin INTn (active low) can be enabled, setting the flag BLIE
> > in the register Control_3.
> >
> > This function is activated by the "battery-low-hw-alarm" DT property.
> >
> > Example of use for an NXP i.MX7D board:
> >
> > &i2c3 {
> > 	clock-frequency = <100000>;
> > 	pinctrl-names = "default";
> > 	pinctrl-0 = <&pinctrl_i2c3>;
> > 	status = "okay";
> >
> > 	pcf2127@51 {
> > 		compatible = "nxp,pcf2127";
> > 		reg = <0x51>;
> > 		battery-low-hw-alarm;
> > 		status = "okay";
> > 	};
> > };
> >
> 
> So I'm curious, how do you then use that signal? I have a (not yet sent)
> series adding alarm support for the pcf2127. The issue having BLIE is
> that then this will prevent the alarm to work properly.
> 
> So my guess is that you have nINT connected to an LED or something that
> the user can see?
> 

I'm working on our custom embedded board with an NXP i.MX7D,
developed here, in Asem (www.asem.it).
The nINT pin is connected to a GPIO of the MX7 and then
used by an applicative sw, to generate an alarm for the user.

> > Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> > ---
> >  drivers/rtc/rtc-pcf2127.c | 33 +++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> > index 7cb786d..e3805c8 100644
> > --- a/drivers/rtc/rtc-pcf2127.c
> > +++ b/drivers/rtc/rtc-pcf2127.c
> > @@ -228,6 +228,10 @@ static int pcf2127_probe(struct device *dev, struct
> regmap *regmap,
> >  			const char *name, bool has_nvmem)
> >  {
> >  	struct pcf2127 *pcf2127;
> > +	struct device_node *np;
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	unsigned char buf[2];
> > +	int err;
> >  	int ret = 0;
> >
> >  	dev_dbg(dev, "%s\n", __func__);
> > @@ -245,6 +249,35 @@ static int pcf2127_probe(struct device *dev, struct
> regmap *regmap,
> >  	if (IS_ERR(pcf2127->rtc))
> >  		return PTR_ERR(pcf2127->rtc);
> >
> > +	/*
> > +	 * The pcf2127 has an automatic battery-low detection function.
> > +	 *
> > +	 * In case of battery-low event, an interrupt generation through
> > +	 * the pin INTn (active low) can be enabled, setting the flag BLIE
> > +	 * in the register Control_3.
> > +	 */
> > +	np = of_node_get(dev->of_node);
> > +	if (!np) {
> > +		dev_err(dev, "failed to find the RTC pcf2127 node\n");
> > +		return -ENOENT;
> > +	}
> > +	if (of_get_property(np, "battery-low-hw-alarm", NULL)) {
> > +		dev_info(dev, "enable battery-low hw alarm on INTn pin\n");
> > +
> > +		/*
> > +		 * Set BLIE bit in register Control_3 (override is possible
> > +		 * because this register is fully zero after reset)
> > +		 */
> > +		buf[0] = PCF2127_REG_CTRL3;
> > +		buf[1] = 0x01;
> > +		/* write register's data */
> > +		err = i2c_master_send(client, buf, 2);
> 
> This has to use regmap_update_bits because this also has to work on spi.
> (I don't know where you get the client pointer from anyway).
> 
> > +		if (err != 2) {
> > +			dev_err(dev, "%s: err=%d", __func__, err);
> > +			return -EIO;
> > +		}
> > +	}
> > +
> >  	if (has_nvmem) {
> >  		struct nvmem_config nvmem_cfg = {
> >  			.priv = pcf2127,
> > --
> > 2.7.4
> >
> 
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Flavio Suligoi
