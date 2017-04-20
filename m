From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH/RFC v2 1/2] arm64: dts: r8a7795: Add support for R-Car H3 ES2.0
Date: Thu, 20 Apr 2017 14:24 +0300
Message-ID: <3119026.3cPho1BBNv@avalon>
References: <1490362665-4422-1-git-send-email-geert+renesas@glider.be> <1714563.qChlbIjNcO@avalon> <CAMuHMdWmvhZjxKfEdGJ3d_w0d2s2kK+8iW1tsEM584qZc+dVEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdWmvhZjxKfEdGJ3d_w0d2s2kK+8iW1tsEM584qZc+dVEQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Wolfram Sang <wsa-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Thursday 20 Apr 2017 12:55:28 Geert Uytterhoeven wrote:
> On Thu, Apr 20, 2017 at 12:42 PM, Laurent Pinchart wrote:
> > On Thursday 20 Apr 2017 11:36:59 Geert Uytterhoeven wrote:
> >> On Mon, Mar 27, 2017 at 10:48 AM, Laurent Pinchart wrote:
> >>> On Friday 24 Mar 2017 14:37:44 Geert Uytterhoeven wrote:
> >>>> Update r8a7795.dtsi so it corresponds to R-Car H3 ES2.0 or later:
> >>>>   - The following devices no longer exist on ES2.0, and are thus
> >>>>     removed:
> >>>>     fcpf2, fcpvd3, fcpvi2, fdp1-2, usb3-if1, vspd3, vspi2.
> >>>>   
> >>>>   - The DU <-> VSPD topology is different on ES2.0, hence remove the
> >>>>     "vsps" property from the DU node until the driver can handle this.
> >>> 
> >>> I think I'll need a different compatible string between ES1.x and ES2
> >>> for the DU. It could make sense to move the whole DU node to *-es1.dtsi.
> >>> We can decide about that later when I'll have a DU driver prototype
> >>> ready.
> >> 
> >> Why would you need a different compatible string?
> >> Can't you use soc_device_match() to handle ES1.x SoCs?
> >> 
> >> The different DU <-> VSPD topology is handled through the vsps property
> >> in
> >> DTS. Are the ports different, too? That can be handled in DTS.
> > 
> > My point (not expressed clearly) was that, as I'll need a different vsps
> > property, I can as well go for a different compatible string.
> 
> Do you need a different vsps property?
> AFAIK, the current array links each DU channel to a VSPD.
> When a VSPD is shared between multiple channels, you can still link these
> channels to the same VSPD.
> 
> Or is my understanding incorrect?

Do you mean listing the same VSP multiple times in the vsps array ? Yes, from 
a bindings point of view I think that would work too. That is, until we get a 
ES2.1 that will have a completely different hardware topology :-)

> >> The main reason why I kept the DU node in r8a7795.dtsi is that the board
> >> DTS refers to it.  Sharing board DTS means there needs to be at least a
> >> placeholder node for the DU in r8a7795.dtsi, unless you want to keep on
> >> shuffling board overrides around.
> > 
> > As the ports are identical it makes sense to share the same board DTS, I
> > agree with you. We could override the compatible string in
> > r8a7795-es1.dtsi and leave it blank in r8a7795.dtsi for now, as there's
> > no driver support for ES2.0. That's a bit of a workaround as it shouldn't
> > matter to DT whether driver support is available or not. On the other
> > hand, leaving the vsps property out is a workaround too.
> > 
> > The current driver will fail probing if the number of VSPs is different
> > than the number of CRTCs, so I believe you can keep the vsps property in
> > r8a7795.dtsi with 3 VSPS without causing any problem. However, there's no
> > DT bindings for the H3 ES2.0 DU yet, so we would end up merging DT
> > without bindings, which is not good. I think that regardless of how we
> > proceed, keeping the DU node in the ES2.0 .dtsi will be a violation of
> > that policy.
>
> What does the current driver do if the number of VSPs is the same as the
> number of CRTCs, but some VSPs are listed more than once?
> I guess it will break in a subtle way, instead of refusing to probe?

Correct, it will be messy.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
