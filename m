From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 2/2] rtc: add driver for RX6110SA real time clock
Date: Thu, 3 Mar 2016 13:57:38 +0100
Message-ID: <20160303125738.GD2567@piout.net>
References: <1451927075-8656-1-git-send-email-s.trumtrar@pengutronix.de>
 <1451927075-8656-2-git-send-email-s.trumtrar@pengutronix.de>
 <20160131115457.GL20165@piout.net>
 <20160131140418.GD11885@pengutronix.de>
 <6c5c65d7-2cee-4e3f-a91c-c9fbd4c006c7@googlegroups.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6c5c65d7-2cee-4e3f-a91c-c9fbd4c006c7-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cvs268-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: rtc-linux <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 03/03/2016 at 03:58:45 -0800, cvs268-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote :
>  
> 
> > > > If the need ever arises to also support the I2C variant, this driver 
> > > > could easily be refactored to support both cases. 
> >
> I will soon be getting an embedded board with this RX6110 RTC on it 
> connected via I2C.
> So i would like to take-up the task of adding I2C support in a few weeks.
> 
> A quick search shows drivers/rtc/rtc-rx4581.c was similarly written based 
> on drivers/rtc/rtc-rx8581.c
> 
> Q. Should i proceed to create drivers/rtc/rtc-rx6110-i2c.c or whats the 
> recommended approach?
> I did not find any RTC driver that supports both i2c and spi (eg. depending 
> upon some config option)
> 

You can have a look at sound/soc/codecs/wm8750.c which register one
driver for both i2c and spi. It is simple enough and you should be able
to do the same.

Obviously, a new category will be needed in the Kconfig to handle RTC
that are both spi and i2c with the same part number.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
