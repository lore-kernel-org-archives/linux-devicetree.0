From: Warner Losh <wlosh-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Fri, 21 Feb 2014 11:27:29 -0700
Message-ID: <0F360BC4-77AC-44E4-85FA-A8AAA336BA4D@bsdimp.com>
References: <20140217180544.GU7862@titan.lakedaemon.net> <20140218155750. GS17250@pengutronix.de> <20140218181854.GB7862@titan.lakedaemon.net> < CAOesGMhvoB7vRf3H1kMaL5+MgZ2gJy=ZVNU0gsXVye9S4YGBOg@mail.gmail.com> < CAOesGMi8zJXhfj46CLB-_Kk2s4MY9da46DhMoCtRj=zSUiuOGA@mail.gmail.com> < CA+bK7J5+n2Se4cLv5WjR5B31ej7FdrGjPcjUULNrhb1UQ7=vmA@mail.gmail.com> < CAL_JsqJG+OXbT7sMiHV2dCx+nf--RidL8MmMd=dy6_gAa0yYcg@mail.gmail.com> < CAOesGMiHOwSYTCUaptacN=_pbXnObU5gqpxQHQ+kRTaW-ow3rA@mail.gmail.com> <20140220113832.D9E13C4050F@trevor.secretlab.ca>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140220113832.D9E13C4050F-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Feb 20, 2014, at 4:38 AM, Grant Likely wrote:

> On Wed, 19 Feb 2014 13:20:15 -0800, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>> On Wed, Feb 19, 2014 at 1:12 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> One way to minimize the inconvenience is keep versioning and dev
>>> cycles in sync with the kernel. We could also start doing things to
>>> align the kernel workflow with how things will work when we do have a
>>> separate repository.
>> 
>> I don't think aligning development cycles is what we want most here it
>> might be useful for us in Linux but it'll make things difficult for
>> other projects since they're not aware of our release cycles. The
>> device tree bindings and DT contents in that repo should be "always
>> stable", i.e. no merge window / rc concept. As soon as something goes
>> in it's live, and from then out only fixes to the DTS files (or
>> appending the binding).
>> 
>> For example, I don't want to have to track two trees to test against
>> -- I'll want to keep one repo of the very latest DT files and always
>> use those to boot any and all boards.
> 
> This approach does have the subtle side effect that differs from what we
> discussed in Edinburgh.  We've talked about always being able to boot a
> new kernel on an old devicetree, but not a new devicetree on an old
> kernel. With a separate board database repo we are going to hit both
> cases. At least to a limited extent we're going to need older kernels
> booting with the latest devicetree, and we'll need some rules about how
> that gets applied.

I wasn't in Edinburgh...  Was this at the binary level or at the source level? I'm thinking specifically about the move to cpp in the back of my mind...

> The alternative is that binding changes land in .dts files after a
> kernel release, and I don't think we want that situation at all.
> 
> This is an issue for new bindings, only when a binding is getting
> extended or replaced. If the change is merely adding new properties then
> there shouldn't be a problem (the old kernel will ignore the new
> properties). If it removes properties or creates a new compatible string
> (dropping the one supported by an older kernel) then it won't boot.

Versioning here wouldn't save you either...

> Ultimately this is probably the right thing to do, but it will be
> difficult. Keeping a staging process for new bindings in lock step
> with the kernel is probably the way to mitigate this.

You could have a property like linux,version-min="3.22" if that becomes an issue...

Warner

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
