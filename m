From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: Re: [PATCH] pinctrl: msm: Add msm8960 definitions
Date: Tue, 17 Jun 2014 22:32:32 -0700
Message-ID: <CAJAp7OhRSHjq7hyTVbWcoq_OfnFbZ7Ud=uWzfsSNku7Zqm4x6w@mail.gmail.com>
References: <1402424723-9659-1-git-send-email-bjorn.andersson@sonymobile.com>
	<20140617220017.GA17864@qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140617220017.GA17864-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 17, 2014 at 3:00 PM, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On Tue, Jun 10, 2014 at 11:25:23AM -0700, Bjorn Andersson wrote:
>
> In general, it all looks good.  I only have 2 areas of concern.  The first is a
> nit and it has to do with alternate pins for functions.  There really isn't a
> need for a separate function name.  That would only be required if the same pin
> had multiple functions defined for the same thing.
>

I have to blame unclear documentation here ;)
Will drop all the _[abc] suffixes.

> As for the second area of concern, there are some discrepancies between our
> internal function map and yours.  This is probably due to some minor difference
> in chip rev.  I'll try to find more information on this and determine if that is
> true, or if one set of documentation is incorrect.

I'll await your feedback on this; but as the documentation available
to me would be
a rewrite of what you have I suspect we'll end up with your versions.
Just ping me
when you figure this one out and I'll respin.

Thanks for the review!

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
