From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 1/2] Documentation: ad5592r: Added devicetree bindings documentation
Date: Tue, 27 Oct 2015 17:13:17 +0100
Message-ID: <CACRpkdatEhs34y3D5evo-_rmG=pPb9LcdNWE+3zgnGqbZFh9hQ@mail.gmail.com>
References: <1444729080-9937-1-git-send-email-paul.cercueil@analog.com>
	<562CD9BD.6030206@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <562CD9BD.6030206-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Michael Hennerich <Michael.Hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Antonio Fiol <antonio-ZGO+nOAM/nI@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 25, 2015 at 2:31 PM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On 13/10/15 10:37, Paul Cercueil wrote:
>> Signed-off-by: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
> Looks good to me, but as it is a little bit 'different' and we are
> defining entirely new generic bindings (the channel modes stuff)
> I would like some more input.  It might be overkill but we do
> of course have the pinctl framework which covers this sort of
> thing... Might be worth considering if using that to get the unified
> bindings might make sense here...
>
> cc'd Linus in case he wants to comment on this.
>
> It would obviously be a very heavy weight solution to the problem
> so I'm far from convinced it makes sense - or even fits the usecase
> terrible well.  Just thought I'd mention the possibility.

There is something of a grey area between "definately pin control"
and "some extra pin hardware duct-taped to something else".

I guess that is natural, life is full of grey areas...

Basically if there are plenty of pins and functions, local solutions
to the problem will not scale. Then it is necessary to go ahead
and implement full pin control. Especially for say a big BGA
package or so with lots and lots of pins.

It is is a few pins or they just alter between similar functionality
(like different graphic modes) I think local solutions are OK.

There are other problems though, but I comment on these
separately.

Yours,
Linus Walleij
