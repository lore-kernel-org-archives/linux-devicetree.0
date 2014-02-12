From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sabresd: Do not place regulator nodes
 under simple-bus
Date: Wed, 12 Feb 2014 23:20:52 +0800
Message-ID: <20140212152050.GA28749@S2101-09.ap.freescale.net>
References: <1392165078-25794-1-git-send-email-festevam@gmail.com>
 <20140212092227.GA24834@S2101-09.ap.freescale.net>
 <20140212095450.GB21992@e106331-lin.cambridge.arm.com>
 <20140212122837.GD24834@S2101-09.ap.freescale.net>
 <20140212135736.GB25957@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140212135736.GB25957-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 12, 2014 at 01:57:36PM +0000, Mark Rutland wrote:
> As it stands, the dts are buggy. I can appreciate that you don't feel
> this is important, but I do. It's not just an IMX issue, there is
> widespread misunderstanding and abuse of simple-bus.
> 
> Said abuse is relying on current Linux implementation details, and that
> can and will create problems if and when probing code is changed.

The reality is the code already gets no chance to change on this regard,
considering the requirement that we need to maintain the interface
between kernel and DT as ABI.  The dts have been there like this for
10 kernel releases or so.

> There's no good reason for abusing the binding when we can get it right
> today.

As I said from the beginning, though I personally take it as a churn, I
will still be happy take the change, as long as my upstream folks are
also fine with it.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
