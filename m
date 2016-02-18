From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: meson: Adding hwrev syscon node
Date: Thu, 18 Feb 2016 15:22:29 +0100
Message-ID: <4136837.fyWFbJqZfO@wuerfel>
References: <1455730114-2547-1-git-send-email-romain.perier@gmail.com> <4158343.mkrTsd5B4G@wuerfel> <CAOQ7t2byFoW657-1xnsBpeyPkB6K25R=_pPmRDmT32Sjef=kUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOQ7t2byFoW657-1xnsBpeyPkB6K25R=_pPmRDmT32Sjef=kUw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 18 February 2016 15:14:45 Carlo Caione wrote:
> >
> > Yes, you should describe the device that is actually there, which would be
> > something like
> >
> >         cbus@c1100000 {
> >                 compatible = "amlogic,meson8b-cbus", "syscon";
> >                 reg = <0xc1100000 0x10000>; /* no idea what the length is, fix it */
> >         };
> >
> > Don't just make things up because you happen to access them in a particular
> > way, but try to stay as close as you can to describing the actual hardware.
> 
> Arnd,
> in the cbus region are mapped a lot of different devices, do you think
> that it is a good idea mapping the whole region as a single syscon
> device?

It really depends on what those other devices do with the registers:

If each device just uses a couple of random registers from the cbus,
they should probably all be changed to go through syscon.

However, if some or all of the other devices actually are entirely
made up of register ranges within cbus, that would indicate that
cbus itself is not just a collection of random registers but something
that could be considered a bus of itself in hardware, and then
we could represent the other devices as children of this bus.

Usually once you have a list of all the register locations, you can
identify the hardware structure to a certain degree from that, even
if you don't have access to a data sheet that would clarify this
better.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
