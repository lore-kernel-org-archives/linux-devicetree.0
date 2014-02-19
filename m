From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Wed, 19 Feb 2014 13:20:15 -0800
Message-ID: <CAOesGMiHOwSYTCUaptacN=_pbXnObU5gqpxQHQ+kRTaW-ow3rA@mail.gmail.com>
References: <20140217180544.GU7862@titan.lakedaemon.net>
	<20140218155750.GS17250@pengutronix.de>
	<20140218181854.GB7862@titan.lakedaemon.net>
	<CAOesGMhvoB7vRf3H1kMaL5+MgZ2gJy=ZVNU0gsXVye9S4YGBOg@mail.gmail.com>
	<CAOesGMi8zJXhfj46CLB-_Kk2s4MY9da46DhMoCtRj=zSUiuOGA@mail.gmail.com>
	<CA+bK7J5+n2Se4cLv5WjR5B31ej7FdrGjPcjUULNrhb1UQ7=vmA@mail.gmail.com>
	<CAL_JsqJG+OXbT7sMiHV2dCx+nf--RidL8MmMd=dy6_gAa0yYcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJG+OXbT7sMiHV2dCx+nf--RidL8MmMd=dy6_gAa0yYcg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 19, 2014 at 1:12 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> One way to minimize the inconvenience is keep versioning and dev
> cycles in sync with the kernel. We could also start doing things to
> align the kernel workflow with how things will work when we do have a
> separate repository.

I don't think aligning development cycles is what we want most here it
might be useful for us in Linux but it'll make things difficult for
other projects since they're not aware of our release cycles. The
device tree bindings and DT contents in that repo should be "always
stable", i.e. no merge window / rc concept. As soon as something goes
in it's live, and from then out only fixes to the DTS files (or
appending the binding).

For example, I don't want to have to track two trees to test against
-- I'll want to keep one repo of the very latest DT files and always
use those to boot any and all boards.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
