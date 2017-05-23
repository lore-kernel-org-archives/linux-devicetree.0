From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/3] mfd: arizona: Update GPIO binding for newly
 supported flag
Date: Tue, 23 May 2017 10:00:14 +0100
Message-ID: <20170523090014.GN1594@localhost.localdomain>
References: <1494948714-15203-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1494948714-15203-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <CACRpkdaLR9pH4HX4h3wuGAVbcETGn-k6VkXYsMAq_YPAsnOUvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaLR9pH4HX4h3wuGAVbcETGn-k6VkXYsMAq_YPAsnOUvg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 23, 2017 at 10:49:23AM +0200, Linus Walleij wrote:
> On Tue, May 16, 2017 at 5:31 PM, Charles Keepax
> <ckeepax@opensource.wolfsonmicro.com> wrote:
> 
> > Update the device tree binding to show that the new GPIO_SLEEP flags are
> > now supported in the flags field of the GPIO binding for Arizona
> > devices.
> >
> > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> (...)
> >    - gpio-controller : Indicates this device is a GPIO controller.
> >    - #gpio-cells : Must be 2. The first cell is the pin number and the
> > -    second cell is used to specify optional parameters (currently unused).
> > +    second cell is used to specify optional parameters, the following flags
> > +    are supported:
> > +      "GPIO_SLEEP_MAY_LOOSE_OUTPUT" the output of this GPIO does not need to
> > +      be maintained whilst the CODEC is in low power mode.
> 
> Your gpio controller most definately support more options than that,
> for example open drain.
> 

Not at the moment, there are potentially a few more things we
could support with the hardware though.

> But it is supposed to be a generic property so instead patch gpio.txt
> and reference that file from here.
> 

Yeah happy to move it over there.

Thanks,
Charles
