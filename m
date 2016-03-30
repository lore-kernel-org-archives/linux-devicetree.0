From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/7] ARM: dts: skeleton: add unit name to memory node
Date: Wed, 30 Mar 2016 14:41:55 +0100
Message-ID: <20160330134155.GC25354@leverpostej>
References: <1459290646-3592-1-git-send-email-manabian@gmail.com>
 <1459290646-3592-3-git-send-email-manabian@gmail.com>
 <20160330110611.GB25354@leverpostej>
 <56FBCF70.80006@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56FBCF70.80006-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 30, 2016 at 04:06:56PM +0300, Vladimir Zapolskiy wrote:
> On 30.03.2016 14:06, Mark Rutland wrote:
> > On Wed, Mar 30, 2016 at 12:30:41AM +0200, Joachim Eastwood wrote:
> >> Add unit name to memory to remove the following warning:
> >>  Warning (unit_address_vs_reg): Node /memory has a reg or ranges
> >> 				property, but no unit name
> > 
> > If anything, it would be better to get rid of the memory node from the
> > skeleton DTs.
> > 
> > For DTs which have a memory node there's no problem, and DTs which
> > expect a bootlaoder to fill things in have a logical place to document
> > that fact.

> The only problem I see if DTB is updated on a board but a board bootloader
> on fix-up is capable to fill a preexisting "/memory" device node in only,
> otherwise it is not clear why the device node is present in skeleton.dtsi.

Sure. To clarify the above, what I expect that for this case is that the
empty memory node would exist in the dts for that particular board,
along with a comment, e.g.

	/* The firmware/bootloader for $BOARD fills this in */
	memory {
		device_type = "memory";
		reg = <0 0 0 0>;
	};

That way you can tell at a glance that the lack of memory information in
the DT for a board is intentional, and the bootloader still gets the
node it expects.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
