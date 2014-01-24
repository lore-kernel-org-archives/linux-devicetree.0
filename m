From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: DT include files
Date: Fri, 24 Jan 2014 09:02:09 +0100
Message-ID: <2907925.DyxHkYtGr7@phil>
References: <20140103023211.GA25079@S2101-09.ap.freescale.net> <201401122121.20084.arnd@arndb.de> <20140113021912.GB23525@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140113021912.GB23525-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

did this topic get any final resolution - especially in terms of the pingrp.h 
header?

As I'm currently preparing two board files (imx50 and imx6sl) this discussion 
made me unsure if using the pin-group definitions is still the preferred style.


Thanks
Heiko

On Monday 13 January 2014 10:19:14 Shawn Guo wrote:
> On Sun, Jan 12, 2014 at 09:21:19PM +0100, Arnd Bergmann wrote:
> > I was under the impression that the generic pinctrl binding was designed
> > in a way to let you assign labels to each possible (reasonable)
> > configuration so you didn't have get to this level of detail at the
> > driver.
> 
> The generic part of pinctrl binding only covers the procedure how a
> client device get its pinctrl state configuration from a pin controller
> node.  That's what we defined in bindings/pinctrl/pinctrl-bindings.txt
> and implemented in pinctrl core.  But the details of how a pinctrl state
> configuration should be interpreted for a particular pin controller is
> defined by individual pin controller binding like fsl,imx-pinctrl.txt,
> and implemented in the pin controller driver like
> drivers/pinctrl/pinctrl-imx.c.
> 
> > I'm also surprised that you have to know multiple constants
> > (mux register, input register, config register offsets) to select a
> > particular pin. I would have expected that you could have one constant
> > from which the driver is able to compute the other ones.
> 
> That's what we do before.  We define a constant in the binding and have
> the driver to maintain these data and look up the data using the
> constant.  See commit below for imx6q example.
> 
>   d8fe357 pinctrl: pinctrl-imx: add imx6q pinctrl driver
> 
> The biggest problem with that approach is we have huge data to maintain
> in the driver because of the complexity and flexibility of IMX pin
> controller design.  And these data can not be init data.  Check that big
> array of struct imx_pin_reg in commit above for what I'm talking about.
> So when we build a v7 kernel image for IMX, we will have such big array
> for each of these SoCs, imx50, imx51, imx53, imx6sl, imx6dl, imx6q, and
> more to come.
> 
> That's why we went through the pain of breaking DT compatibility to move
> all these data into device tree one year ago with the commit below.
> 
>   e164153 pinctrl: imx: move hard-coding data into device tree
> 
> Now kernel gets released from the floating and we do not even need to
> touch kernel to add these data when new SoC support is added.
> 
> Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
