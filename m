From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: r8a7745: add PFC support
Date: Thu, 17 Aug 2017 09:56:18 +0200
Message-ID: <20170817075618.GB26170@verge.net.au>
References: <20170415202036.987901107@cogentembedded.com>
 <CAMuHMdUPda7Mjo_P8p1V5a20XOAYM6GFf8Jqf0KLUuO7zAODeA@mail.gmail.com>
 <TY1PR06MB07025D9CE628A3D4CED37AA9B78D0@TY1PR06MB0702.apcprd06.prod.outlook.com>
 <b3bcd091-4f96-c37a-54ec-c8ee5b0fd916@cogentembedded.com>
 <20170815160049.GC26748@verge.net.au>
 <521e62cc-46d4-b067-59b2-cc085fd88e84@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <521e62cc-46d4-b067-59b2-cc085fd88e84-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 16, 2017 at 02:00:37PM +0300, Sergei Shtylyov wrote:
> On 08/15/2017 07:00 PM, Simon Horman wrote:
> 
> >>>>>Define the generic R8A7745 part of the PFC device node.
> >>>>>
> >>>>>Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> >>>>
> >>>>Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> >>>
> >>>It looks like the dependencies for this patch are met now [1].
> >>>
> >>>Are you happy to accept this patch? (and presumably the others in the series for the sk-rzg1e board).
> >>>
> >>>We plan to add GPIO support for r8a7745, but need this patch in place first.
> >>>
> >>>
> >>>[1] https://patchwork.kernel.org/patch/9705249/
> >>
> >>    Actually, R8A774x PFC support has hit the Linus' tree in the meanwhile.
> >>Simon, please merge the .dts patches.
> >>
> >>>Kind regards, Chris
> >
> >Thanks, I have applied the series for v4.14.
> 
>    Are you going to finally push the devel branch? I'm not seeing changes
> since the Monday tags.

Sorry, about the delay.
I have (finally) pushed Tuesday's tags.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
