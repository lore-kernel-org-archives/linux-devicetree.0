From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 1/2] Documentation: ad5592r: Added devicetree bindings documentation
Date: Tue, 27 Oct 2015 17:15:56 +0100
Message-ID: <CACRpkdZgjp_scGX=VA-qSiQMGH_ib2ZOo-5HgZCbQWOXfw=7eQ@mail.gmail.com>
References: <1444729080-9937-1-git-send-email-paul.cercueil@analog.com>
	<562CD9BD.6030206@kernel.org>
	<CACRpkdatEhs34y3D5evo-_rmG=pPb9LcdNWE+3zgnGqbZFh9hQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdatEhs34y3D5evo-_rmG=pPb9LcdNWE+3zgnGqbZFh9hQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Michael Hennerich <Michael.Hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Antonio Fiol <antonio-ZGO+nOAM/nI@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 27, 2015 at 5:13 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> There are other problems though, but I comment on these
> separately.

Was wrong about that. I think this can go in like this.

Later, this device may fork off a GPIO chip as well, but
we will deal with that whenever we run into it.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
