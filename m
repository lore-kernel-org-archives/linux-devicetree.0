From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: DT include files
Date: Mon, 13 Jan 2014 10:31:59 +0800
Message-ID: <20140113023157.GC23525@S2101-09.ap.freescale.net>
References: <20140103023211.GA25079@S2101-09.ap.freescale.net>
 <201401111415.29395.arnd@arndb.de>
 <20140112032516.GA23525@S2101-09.ap.freescale.net>
 <201401122121.20084.arnd@arndb.de>
 <CACRpkdYPrso7KSfWPhZC6chA4z=+YSjKb_SCLx4B-aMmYZYb4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYPrso7KSfWPhZC6chA4z=+YSjKb_SCLx4B-aMmYZYb4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 13, 2014 at 12:16:10AM +0100, Linus Walleij wrote:
> > I'm also surprised that you have to know multiple constants
> > (mux register, input register, config register offsets) to select a
> > particular pin. I would have expected that you could have one constant
> > from which the driver is able to compute the other ones.
> 
> I might have merged this but I was younger then :-/
> 
> Now I don't like the looks of this. I think the DT typically shall not
> store register offsets and bitfield information. I think doing
> so is taking away the responsibility of the driver knowing the
> hardware and moving too close to Open Firmware.

We only have data in device tree, and drivers, at least imx pinctrl
driver, still need to know hardware for how to apply these data into
hardware.

As I just replied to Arnd, all the motivation of having these data in
device tree is to release kernel from being bloated by those huge mount
of data due to the complexity and flexibility of IMX pin controller.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
