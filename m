From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC v3 1/3] gpio: dt-bindings: add basic-mmio-gpio bindings
Date: Tue, 26 Apr 2016 21:06:14 -0500
Message-ID: <CAL_Jsq+OrkudQwxqfSvuqW=HWm6B74pE9bec0QBh5xNbF+s2Hw@mail.gmail.com>
References: <cover.1461710784.git.chunkeey@googlemail.com> <7e8845e6b6384c6b5673532ebef79c8730ed7748.1461710784.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7e8845e6b6384c6b5673532ebef79c8730ed7748.1461710784.git.chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 26, 2016 at 5:51 PM, Christian Lamparter
<chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> From: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> This patch adds the device tree bindings for the basic-mmio-gpio.
> The basic-mmio-gpio is already part of a the GPIO generic library
> and shares its compatible with the platform device.

These things always start out "simple", "basic" or "generic". Then
people extend them a property or 2 at a time until they are no longer
basic. Make a bunch of GPIO drivers use a generic driver then maybe
I'll be convinced this is a good idea. The concepts of generic code
and generic bindings don't have to be coupled.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
