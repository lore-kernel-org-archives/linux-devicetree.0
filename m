From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: Excluding pins from Linux control
Date: Tue, 14 Mar 2017 21:09:54 +0100 (CET)
Message-ID: <1588667510.505126.1489522194503@email.1und1.de>
References: <433834766.313467.1488218521360@email.1und1.de>
 <CACRpkdYB+4=hG4YcUTvyg50cP6SfMhUuUMW7XqJAVxswYBsWng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYB+4=hG4YcUTvyg50cP6SfMhUuUMW7XqJAVxswYBsWng-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Linus,

> Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> hat am 14. März 2017 um 15:39 geschrieben:
> 
> 
> On Mon, Feb 27, 2017 at 7:02 PM, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> wrote:
> 
> > on BCM2835 (Raspberry Pi) the firmware on the VideoCore and Linux on the ARM core share
> > a common pin "space". Depending on the board revision the VideoCore needs to controls
> > some pins, which shouldn't be claimed by Linux on the ARM.
> >
> > What is the right way to exclude control on Linux for those pins in order to avoid possible
> > harmful operations?
> 
> Do you want to do this statically (at boot) or dynamically (at runtime)?

statically

> 
> If you want to do it statically, at boot time:
> Just add some NOOP function (i.e. a function that result in
> zero register writes or anything) named "videocore-reserved" or
> something to the driver in  drivers/pinctrl/bcm/pinctrl-bcm2835.c,
> make it applicable to the affected pins, making it possible
> to create a state that will combine the function "videocore-reserved"
> with these pins, resulting in them being exclusively used for
> that.

If you speak of a NOOP function, do you mean a "dummy" pin function which is configured by the device tree? Like extending the "brcm,function" property from the existing binding?

> 
> Then in the videocore device tree node (I assume there is
> something like such) create a pinctrl state that just take all these
> pins with this dummy function.

Is there a comparable example in the existing drivers?

Thanks
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
