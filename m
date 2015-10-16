From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] gpiolib: Add and use OF_GPIO_SINGLE_ENDED flag
Date: Fri, 16 Oct 2015 22:52:13 +0200
Message-ID: <CACRpkdYrGi6w_=ng3bL7Fq7N4nmobXuOFfeJ=f+h0bMhU-0Tpw@mail.gmail.com>
References: <1444684821-17389-1-git-send-email-laurent.pinchart@ideasonboard.com>
	<1444684821-17389-3-git-send-email-laurent.pinchart@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444684821-17389-3-git-send-email-laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 12, 2015 at 11:20 PM, Laurent Pinchart
<laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:

> The flag matches the DT GPIO_SINGLE_ENDED flag and allows drivers to
> parse and use the DT flag to handle single-ended (open-drain or
> open-source) GPIOs.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

Patch applied!

I feel a bit guilty for fixing the OF docs (with help from Nikolaus Schaller)
and then just leaving it open as an exercise for someone else to implement
it in gpiolib ... hats of for immediately grasping this and implementing it
exactly as it should be!

All of a sudden I now have an influx of GPIO drivers supporting open drain.
I wonder why it happens right now, probably sun spot activity.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
