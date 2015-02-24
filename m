From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] mfd: arizona: Move useful defines into a dt-binding
	include
Date: Tue, 24 Feb 2015 22:46:39 +0000
Message-ID: <20150224224639.GA8082@opensource.wolfsonmicro.com>
References: <1424257419-28000-1-git-send-email-ckeepax@opensource.wolfsonmicro.com> <CAL_JsqJwOD+BtFK=UZ+4smy4FN_8N2ATWXj+it2giRejsxD_hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJwOD+BtFK=UZ+4smy4FN_8N2ATWXj+it2giRejsxD_hw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, ijc+devicetree-KcIKpvwj1kWeLe5EKmSxzQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, sameo-VuQAYsv1563kn/h4/h/YSQ@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 23, 2015 at 10:00:50AM -0600, Rob Herring wrote:
> On Wed, Feb 18, 2015 at 5:03 AM, Charles Keepax
> <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> > Move parts of linux/mfd/arizona/pdata.h and gpio.h into a new file in
> > the dt-binding directory for use by device tree bindings. This also
> > makes gpio.h redundant so remove it in the process.
> >
> > Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> > ---
> >  include/dt-bindings/mfd/arizona.h |  109 +++++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/arizona/gpio.h  |   96 --------------------------------
> >  include/linux/mfd/arizona/pdata.h |   46 +---------------
> >  sound/soc/codecs/arizona.c        |    1 -
> >  4 files changed, 110 insertions(+), 142 deletions(-)
> >  create mode 100644 include/dt-bindings/mfd/arizona.h
> >  delete mode 100644 include/linux/mfd/arizona/gpio.h
> >
> > diff --git a/include/dt-bindings/mfd/arizona.h b/include/dt-bindings/mfd/arizona.h
> > new file mode 100644
> > index 0000000..f2a4821
> > --- /dev/null
> > +++ b/include/dt-bindings/mfd/arizona.h
> > @@ -0,0 +1,109 @@
> > +/*
> > + * Device Tree defines for Arizona devices
> > + *
> > + * Copyright 2014 Wolfson Microelectronics. PLC.
> > + *
> > + * Author: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_MFD_ARIZONA_H
> > +#define _DT_BINDINGS_MFD_ARIZONA_H
> > +
> > +#define ARIZONA_GP_FN_TXLRCLK                    0x00
> > +#define ARIZONA_GP_FN_GPIO                       0x01
> 
> These are all register offsets? If so, I don't think they belong in dts files.

These are the various functions that the chips GPIO pins can be
set to. They are values rather than register offsets.

> 
> > +#define ARIZONA_GP_FN_IRQ1                       0x02
> > +#define ARIZONA_GP_FN_IRQ2                       0x03
> > +#define ARIZONA_GP_FN_ASYNC_OPCLK                0x3D
> > +#define ARIZONA_GP_FN_BOOT_DONE                  0x44
> > +#define ARIZONA_GP_FN_DSP1_RAM_READY             0x45
> > +#define ARIZONA_GP_FN_SYSCLK_ENA_STATUS          0x4B
> > +#define ARIZONA_GP_FN_ASYNCCLK_ENA_STATUS        0x4C
> > +
> > +#define ARIZONA_GPN_DIR                          0x8000  /* GPN_DIR */
> > +#define ARIZONA_GPN_DIR_MASK                     0x8000  /* GPN_DIR */
> > +#define ARIZONA_GPN_DIR_SHIFT                        15  /* GPN_DIR */
> > +#define ARIZONA_GPN_DIR_WIDTH                         1  /* GPN_DIR */
> 
> Similarly, how do you intend to use these in dts files?
> 
> Rob

Admittedly, the shift and width defines are unlikely to see use
in the DT file, I will do a respin to filter those out.

The defines themselves are settings for the GPIO pins again.
Direction, pull up, pull down. These all go into the
wlf,gpio-defaults field in the DT binding.

So instead of:

        wlf,gpio-defaults = <
                0x00000000 /* AIF1TXLRCLK */
                0xffffffff
                0xffffffff
                0xffffffff
                0xffffffff
        >;

We can write something a little more readable like:

        wlf,gpio-defaults = <
                ARIZONA_GP_FN_TXLRCLK
                0xffffffff
                0xffffffff
                0xffffffff
                0xffffffff
        >;

Although looking at that example I feel like I should add a
define for the default value (triggered by an out of range value
such as 0xffffffff).

Thanks,
Charles
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
