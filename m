From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v4] usb: chipidea: permit driver bindings pass phy pointer
Date: Wed, 13 Jun 2012 14:23:04 +0800
Message-ID: <20120613062031.GB22680@b20223-02.ap.freescale.net>
References: <1337912665-16615-3-git-send-email-richard.zhao@freescale.com>
 <1339159026-15837-1-git-send-email-richard.zhao@freescale.com>
 <20120612231438.GA6177@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120612231438.GA6177-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 12, 2012 at 04:14:38PM -0700, Greg KH wrote:
> On Fri, Jun 08, 2012 at 08:37:06PM +0800, Richard Zhao wrote:
> > Sometimes, the driver bindings may know what phy they use.
> > For example, when using device tree, the usb controller may have a
> > phandler pointing to usb phy.
> > 
> > Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > Reviewed-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> > Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> > ---
> > Changes since laster version:
> > - hcd transceiver renamed to phy
> 
> Ick, I see patches all over this thread, and other threads, and I have
> no idea what to apply anywhere...
I thought it only need small fix, but the fix became bigger and bigger.
> 
> So, consider all chipidea patches dropped from my queue now, can you
> please resend them to me, with the accumulated acks and reviewed-by
> line, so that I can queue them up?
I'll send out a new version series.

Thanks for review.
Richard
> 
> thanks,
> 
> greg k-h
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
