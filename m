From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/5] DT: Vendor: Add prefixes used by Kirkwood devices
Date: Mon, 7 Apr 2014 18:13:40 +0200
Message-ID: <20140407161340.GH18785@lunn.ch>
References: <1395492360-1865-1-git-send-email-andrew@lunn.ch>
 <1395492360-1865-2-git-send-email-andrew@lunn.ch>
 <CAL_JsqJkrE2FeVkYzsRaGSTx3Ly9C3SPX902so96zo=n7yQaZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJkrE2FeVkYzsRaGSTx3Ly9C3SPX902so96zo=n7yQaZw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 07, 2014 at 11:13:34AM -0500, Rob Herring wrote:
> On Sat, Mar 22, 2014 at 7:45 AM, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
> > Add a number of vendor prefixes by kirkwood devices. These are not all
> > stock tickers, but have been in use for a while so changing would not
> > be easy.
> >
> > Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> Looks like I missed these. Applied patches 1, 2, and 4 for 3.15.

Thanks Rob.

Jason, please can you pick up the others?

       Thanks
 	 Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
