From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/6] Documentation: devicetree: dwc3: Add interrupt
 moderation
Date: Fri, 28 Oct 2016 11:23:50 +0100
Message-ID: <20161028102350.GD5806@leverpostej>
References: <cover.1477424426.git.johnyoun@synopsys.com>
 <e7a864e5a2af12d5a8d97f2591065f4aa85f86cb.1477424426.git.johnyoun@synopsys.com>
 <20161026105632.GG19965@leverpostej>
 <36413315-16eb-d690-b559-ab5ae103c5f9@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <36413315-16eb-d690-b559-ab5ae103c5f9-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 27, 2016 at 02:08:25PM -0700, John Youn wrote:
> On 10/26/2016 3:57 AM, Mark Rutland wrote:
> > On Tue, Oct 25, 2016 at 12:42:46PM -0700, John Youn wrote:
> >> Add interrupt moderation interval binding for dwc3.

> >> + - snps,imod_interval: the interrupt moderation interval.

> > What is "interrupt moderation"? The cover mentions that this is to be
> > used for some kind of workaround, but it's not clear to me what this is,
> > and as such, whether it makes sense to describe it in this manner.
> > 
> 
> Interrupt moderation throttles the interrupt rate to be no faster than
> a specified interval. It's an optional feature of the controller.

Ok.

> This series implements the feature and enables it as a workaround for
> a particular version of the controller.

... as a workaround for *what*? Is there a bug in that IP version, or an
integration issue? Does the problem vary per-board?

Generally, if there's a problem that needs to be worked around, we
describe the problem in the DT (perhaps implicitly in the compatible
string), and then the kernel chooses the workaround.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
