From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL] RealView Device Tree support for v3.18
Date: Fri, 26 Sep 2014 00:34:31 +0200
Message-ID: <201409260034.31884.arnd@arndb.de>
References: <CACRpkdbHcJgnXDxO=yjuqbppT6OSR=N=4T80FFsrwKNM9Dy=sA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbHcJgnXDxO=yjuqbppT6OSR=N=4T80FFsrwKNM9Dy=sA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 19 September 2014, Linus Walleij wrote:
> Linus Walleij (6):
>       leds: add a driver for syscon-based LEDs
>       leds: add device tree bindings for register bit LEDs
>       power: reset: driver for the Versatile syscon reboot
>       soc: add driver for the ARM RealView
>       ARM: l2c: parse cache properties from ePAPR definitions
>       ARM: realview: basic device tree implementation
> 

These really shouldn't be all in one branch, and the last one should
be split into the dts and the platform changes.

I've cherry-picked the first four patches into the next/drivers
branch, so no need to send them again.

Please split up the last patch in two and put the l2c changes
into Russell's patch tracker and add my 'Reviewed-by: 
Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>'.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
