From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: IMX27: How to do 22k pull-up with the pinctrl ?
Date: Mon, 11 Nov 2013 15:29:05 +0100
Message-ID: <CACRpkdatZfGDn-K-PRxCz53AKF+Q4CAwAbA+ufSKnXapZQkPyw@mail.gmail.com>
References: <5280B54A.1050503@gtsys.com.hk>
	<20131111120357.GE21201@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131111120357.GE21201-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chris Ruehl <chris.ruehl-CR359r9tUDPXPF5Rlphj1Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 11, 2013 at 1:03 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Mon, Nov 11, 2013 at 10:45:30AM +0000, Chris Ruehl wrote:

>> while I port the static code to the DT I step into the problem to
>> set the PSCR for the sdhc2 ports to 22k pull-up
>> I look for something like described in
>>      pinctrl/fsl,imx-pinctrl.txt
>>
>> the fsl,imx27-pinctrl only say 0/1 dis/enable pull up but not the strength.

So in the generic pin configuration, which we nowadays recommend new
platforms to use, there is this (include/linux/pinctrl/pinconf-generic):

 * @PIN_CONFIG_BIAS_PULL_UP: the pin will be pulled up (usually with high
 *      impedance to VDD). If the argument is != 0 pull-up is enabled,
 *      if it is 0, pull-up is total, i.e. the pin is connected to VDD.
 * @PIN_CONFIG_BIAS_PULL_DOWN: the pin will be pulled down (usually with high
 *      impedance to GROUND). If the argument is != 0 pull-down is enabled,
 *      if it is 0, pull-down is total, i.e. the pin is connected to GROUND.

The idea was to extend that with an argument for the number of
Ohms the day it was needed and supported by some platform.

We would then use the bindings from
Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
by adding something like this:

(...)
bias-pull-up-ohms = <22000>;
(...)

So in the generic world it can be accomodated in a quite
straight-forward way.

When the i.MX pin control was added in v3.5 the generic
pin config was available but it was opted to use another
pattern. One way to solve this is to migrate i.MX to use the
generic pin config, which is going to be hard work. But as
a subsystem maintainer that is still what I would recommend.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
