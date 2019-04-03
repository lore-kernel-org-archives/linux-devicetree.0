From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 2/2] rtc: pcf2127: add battery-low INTn generation
Date: Wed, 3 Apr 2019 17:31:43 +0200
Message-ID: <20190403153143.GQ22216@piout.net>
References: <1554303165-24813-1-git-send-email-f.suligoi@asem.it>
 <1554303165-24813-2-git-send-email-f.suligoi@asem.it>
 <20190403150824.GO22216@piout.net>
 <452a4cf1410a41c8b6f767ac6258482e@asem.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <452a4cf1410a41c8b6f767ac6258482e@asem.it>
Sender: linux-kernel-owner@vger.kernel.org
To: Flavio Suligoi <f.suligoi@asem.it>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 03/04/2019 15:14:24+0000, Flavio Suligoi wrote:
> Hi Alexandre,
> 
> > On 03/04/2019 16:52:45+0200, Flavio Suligoi wrote:
> > > The pcf2127 has an automatic battery-low detection function.
> > >
> > > In case of battery-low event, an interrupt generation through
> > > the pin INTn (active low) can be enabled, setting the flag BLIE
> > > in the register Control_3.
> > >
> > > This function is activated by the "battery-low-hw-alarm" DT property.
> > >
> > > Example of use for an NXP i.MX7D board:
> > >
> > > &i2c3 {
> > > 	clock-frequency = <100000>;
> > > 	pinctrl-names = "default";
> > > 	pinctrl-0 = <&pinctrl_i2c3>;
> > > 	status = "okay";
> > >
> > > 	pcf2127@51 {
> > > 		compatible = "nxp,pcf2127";
> > > 		reg = <0x51>;
> > > 		battery-low-hw-alarm;
> > > 		status = "okay";
> > > 	};
> > > };
> > >
> > 
> > So I'm curious, how do you then use that signal? I have a (not yet sent)
> > series adding alarm support for the pcf2127. The issue having BLIE is
> > that then this will prevent the alarm to work properly.
> > 
> > So my guess is that you have nINT connected to an LED or something that
> > the user can see?
> > 
> 
> I'm working on our custom embedded board with an NXP i.MX7D,
> developed here, in Asem (www.asem.it).
> The nINT pin is connected to a GPIO of the MX7 and then
> used by an applicative sw, to generate an alarm for the user.
> 

Then, you should probably not enable BLIE because this will cause issues
with the alarm functionnality.. It is certainly enough to use
RTC_VL_READ periodically.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
