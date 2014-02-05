From: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Subject: Re: [PATCH v4] gpio: Driver for SYSCON-based GPIOs
Date: Wed, 5 Feb 2014 20:08:42 +0400
Message-ID: <20140205200842.0df1896311293a31bae3633c@mail.ru>
References: <1389632203-22806-1-git-send-email-shc_work@mail.ru>
	<CACRpkdaVn0iNFYKE3HXWxnb4iCJorF0HSVG4Uvz8Q18SiF5PUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdaVn0iNFYKE3HXWxnb4iCJorF0HSVG4Uvz8Q18SiF5PUQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 30 Jan 2014 14:54:36 +0100
Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> On Mon, Jan 13, 2014 at 5:56 PM, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org> wrote:
> 
> > SYSCON driver was designed for using memory areas (registers)
> > that are used in several subsystems. There are systems (CPUs)
> > which use bits in one register for various purposes and thus
> > should be handled by various kernel subsystems. This driver
> > allows you to use the individual SYSCON bits as GPIOs.
> > ARM CLPS711X SYSFLG1 input lines has been added as first user
> > of this driver.
> >
> > Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
> 
> Oh the pain. I am so ambivalent of this patch as it obfuscates
> some stuff about the hardware that the driver should know,
> while at the same time being elegant in a way.
> 
> What does the ARM SoC maintainers think about this approach?
> 
> Arnd, Olof, Kevin: is this something you'd like to see deployed?

Ping.

-- 
Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
