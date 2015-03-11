From: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/2] of: fix handling of '/' in path options
Date: Wed, 11 Mar 2015 13:00:43 +0000
Message-ID: <20150311130043.GW4278@bivouac.eciton.net>
References: <1425924225-22748-1-git-send-email-leif.lindholm@linaro.org>
 <CAL_JsqK=cODtAgt5jRQ-ASPBVatUztjOwDcZ6vzOh9bDKMdSBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqK=cODtAgt5jRQ-ASPBVatUztjOwDcZ6vzOh9bDKMdSBA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 11, 2015 at 07:49:33AM -0500, Rob Herring wrote:
> On Mon, Mar 9, 2015 at 1:03 PM, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > Commit 7914a7c5651a ("of: support passing console options with
> > stdout-path") neglected to deal with '/'s appearing past the ':'
> > terminator.
> >
> > This mini-series fixes this oversight and adds the tests to prove it.
> >
> > Leif Lindholm (1):
> >   of: fix handling of '/' in options for of_find_node_by_path()
> >
> > Peter Hurley (1):
> >   of: unittest: Add options string testcase variants
> 
> Are there changes from the previous versions? I've already pulled those in.

No, just sent together as a series since I didn't realise you had.

/
    Leif
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
