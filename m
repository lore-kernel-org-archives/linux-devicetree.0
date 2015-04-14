From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Invitation and RFC: Linux Plumbers Device Tree track proposed
Date: Tue, 14 Apr 2015 18:14:43 +0100
Message-ID: <20150414171443.GN28709@leverpostej>
References: <8251B150E4DF5041A62C3EA9F0AB2E0603A53FE1082E@SELDMBX99.corpusers.net>
 <CAL_JsqL0FdvKtGTxFNYxtrGWkm3z-1m0v9dHwYezCtkFOW6EgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqL0FdvKtGTxFNYxtrGWkm3z-1m0v9dHwYezCtkFOW6EgQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Rowand, Frank" <Frank.Rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org" <celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 14, 2015 at 04:36:15PM +0100, Rob Herring wrote:
> On Sat, Apr 11, 2015 at 2:20 PM, Rowand, Frank
> <Frank.Rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org> wrote:
> > In recent years there have been proposed tools to aid in the creation of valid
> > device trees and in debugging device tree issues.  An example of this is the
> > various approaches proposed (with source code provided) to validate device tree
> > source against valid bindings.  As of today, device tree related tools,
> > techniques, and debugging infrastructure have not progressed very far.  I have
> > submitted a device tree related proposal for the Linux Plumbers 2015 conference
> > to spur action and innovation in such tools, techniques, and debugging
> > infrastructure.
> >
> > The current title of the track is "Device Tree Tools, Validation, and
> > Troubleshooting".  The proposal is located at
> >
> >    http://wiki.linuxplumbersconf.org/2015:device_tree_tools_validation_and_trouble_shooting
> >
> > I am looking for several things at the moment:
> >
> >    1) Suggestions of additional topics to be discussed.
> 
> A few things on my list:
> 
> - Supported and not supported overlay usecases

I guess Kernel-driven overlay application (it's been called "quirks"
elsewhere) would fall under this? It's rather scary, and would need
fairly strict rules to be feasible and remain maintainable, which is
going to limit where it can be used.

I think the core guys for that are on the list already?

> - Standardizing Android dtb handling. Appended DTB for arm64? Not
> liked by upstream, but already in use.

If people are going to package a kernel and DTB together, it would be
nice if they could at least be easily decomposed (using something like
FIT).

So +1 for that discussion.

> >    2) Emails or other messages expressing an interest in attending the
> >       device tree track.

I'm interested.

> >    3) Commitments to attend the device tree track (the conference committee
> >       is looking at attendee interest and commitments as part of the process
> >       of accepting the device tree track).

If the DT track goes ahead, I'll be there.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
