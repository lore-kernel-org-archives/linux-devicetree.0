From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Wed, 19 Feb 2014 15:12:48 -0600
Message-ID: <CAL_JsqJG+OXbT7sMiHV2dCx+nf--RidL8MmMd=dy6_gAa0yYcg@mail.gmail.com>
References: <20140217180544.GU7862@titan.lakedaemon.net>
	<20140218155750.GS17250@pengutronix.de>
	<20140218181854.GB7862@titan.lakedaemon.net>
	<CAOesGMhvoB7vRf3H1kMaL5+MgZ2gJy=ZVNU0gsXVye9S4YGBOg@mail.gmail.com>
	<CAOesGMi8zJXhfj46CLB-_Kk2s4MY9da46DhMoCtRj=zSUiuOGA@mail.gmail.com>
	<CA+bK7J5+n2Se4cLv5WjR5B31ej7FdrGjPcjUULNrhb1UQ7=vmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+bK7J5+n2Se4cLv5WjR5B31ej7FdrGjPcjUULNrhb1UQ7=vmA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 18, 2014 at 4:44 PM, Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I'm not in favor of separating the device tree information from the kernel.
>
> If we switch, then whatever synchronization issues other projects
> are having now with synching with the device tree info from the kernel will
> just then become the problem of the kernel developers, who will then
> have to sync with the device tree info from another repository.  If the
> sync issues can't be solved now for them, why or how would it be solved
> post-separation for us?  (It sounds like a zero-sum game of pain transfer
> to me.)
>
> I'm relatively unfamiliar with the arguments.  Can someone provide
> a brief list of reasons this is needed, and how the inconvenience to Linux
> kernel developers will be minimized, should it proceed?

- Primarily, other projects like u-boot, barebox, FreeBSD and possibly
TianoCore (UEFI) are using DT now. Leaving them in the kernel will
cause fragmentation. The statements about barebox needing to add
barebox properties to the dtb is exactly the kind of fragmentation I'm
worried about.
- The need to share dts fragments across arches. This is a bit
orthogonal, but this restructuring would be easier done outside the
kernel tree. Restructuring everything in the kernel tree and then
moving it out would be a lot of churn.
- As we add schema checking, we need somewhere to put those.

One way to minimize the inconvenience is keep versioning and dev
cycles in sync with the kernel. We could also start doing things to
align the kernel workflow with how things will work when we do have a
separate repository.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
