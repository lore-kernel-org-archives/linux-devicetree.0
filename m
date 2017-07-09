From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: "Generic" MMIO ADC
Date: Sun, 9 Jul 2017 06:11:25 +0200
Message-ID: <CACRpkdbMtP6-bytPePdJb1Aj37YLwt7GDjqqoqFoxYDb3ALVNQ@mail.gmail.com>
References: <b60def9a-45dc-bf97-e059-abbe105648b2@topic.nl>
 <20170630145319.20ec3696@jic23.retrosnub.co.uk> <b9dc2313-53da-1566-c0e8-ac18599f59da@topic.nl>
 <CACRpkdaZ=qSbdVxgw4DH_tOeZb0pZBYhhJJOozFn2pn25F_Kag@mail.gmail.com> <20170707154448.00006dec@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170707154448.00006dec-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <Jonathan.Cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>, Jonathan Cameron <jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 7, 2017 at 9:44 AM, Jonathan Cameron
<Jonathan.Cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:

>  Anyhow, doesn't mean the concept of such a driver is bad, merely that
> the tables should form part of the driver code (much like any other driver that supports
> a number of different parts) and be selected by the compatible string.

That works.

drivers/gpu/drm/panel/panel-simple.c

comes to mind.

Yours,
Linus Walleij
