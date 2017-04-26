From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] gpio - Add EXAR XRA1403 SPI GPIO expander driver
Date: Wed, 26 Apr 2017 20:50:46 +0300
Message-ID: <CAHp75VeVPJfakw0GdsKXqZ0ecUNHB2XvEnw15aATuLR2B=vXRQ@mail.gmail.com>
References: <cover.1492077070.git.nandor.han@ge.com> <f28eef264102786357ac5ed7205813619c508fb4.1492077070.git.nandor.han@ge.com>
 <CACRpkdZHMWH2W-i4MGZ7NKzPHUURRmC-5YwiK7cVLCHKDsb7sw@mail.gmail.com>
 <CANjd3ndZkVi5OA0eqDewrpqVLQpT11QbVOA98F=ghMhcwPu2hQ@mail.gmail.com> <CAMuHMdUvQwqhuoWnS3h1S7p0q1K9m5BBFue54pkOykMgi+xmWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdUvQwqhuoWnS3h1S7p0q1K9m5BBFue54pkOykMgi+xmWw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: zoobab-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Semi Malinen <semi.malinen-JJi787mZWgc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 25, 2017 at 10:15 AM, Geert Uytterhoeven
<geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:

>> Is there some good cli tools to access the new char device? If they
>> are shipped with most distros, that would reduce the pain.
>
> https://github.com/brgl/libgpiod
>
> A bit early to expect it to be shipped with all distros, though.

Buildroot has it.
For kernel development it is quite enough.

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
