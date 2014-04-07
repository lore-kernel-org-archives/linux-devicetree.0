From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/5] ARM: zynq: dt: Convert to preprocessor includes
Date: Mon, 7 Apr 2014 08:39:34 -0700
Message-ID: <8db0b480-2c27-4f97-8712-e16fd39d4159@CH1EHSMHS038.ehs.local>
References: <1396653256-28397-1-git-send-email-soren.brinkmann@xilinx.com>
 <1396653256-28397-3-git-send-email-soren.brinkmann@xilinx.com>
 <53423E75.3020008@monstr.eu>
 <53429754.8080105@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53429754.8080105-Oq418RWZeHk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
Cc: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2014-04-07 at 02:17PM +0200, Mike Looijmans wrote:
> On 04/07/2014 07:58 AM, Michal Simek wrote:
> >Hi Soren,
> >
> >On 04/05/2014 01:14 AM, Soren Brinkmann wrote:
> >>Convert all Zynq DT files to the dtc preprocessor include syntax.
> >>This allows to include header files in the devicetrees like other
> >>SoC-types already do.
> >>
> >>Inspired-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >>(http://www.spinics.net/lists/arm-kernel/msg319832.html)
> >>
> >>Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> >
> >These 4 patches needs more wider discussion if this is helpful or
> >not. Currently I can't see any value in it because everything
> >is just generated and fixed. I think I had the same discussion
> >with Laurent some weeks ago regarding this.
>=20
> I would be kinda neutral here. I'd consider it helpful, it improves
> readability (regardless of whether they are generated or hand
> crafted). That's convenient for things like interrupt sensitivity, I
> can't remember whether 4 is level or edge type. On the other hand,
> the clock indices are just as much magic numbers as the memory
> addresses. If I suspect an error in that area, I'd start by lokking
> in /sys/kernel/debug/clk but wouldn't start in the DT.

I agree. Readability is better this way. And whether our generator spit=
s
out magic numbers of these symbolic names should not be a big
difference, is it?

	S=C3=B6ren


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
