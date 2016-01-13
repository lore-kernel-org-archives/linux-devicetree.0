From: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] of: add vendor prefix for UniWest
Date: Wed, 13 Jan 2016 15:51:21 -0800
Message-ID: <20160113155121.48a5f0b1@jclayton-pc>
References: <b11bf2208fe30b96c4d82e634e8abe04343754de.1452717014.git.stillcompiling@gmail.com>
	<CAL_JsqKLDZ55XtA2fsy_0s50wA-o_cvwgFNb5Y+Qq14ErJJbJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKLDZ55XtA2fsy_0s50wA-o_cvwgFNb5Y+Qq14ErJJbJA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 13 Jan 2016 17:37:46 -0600
Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Wed, Jan 13, 2016 at 2:45 PM, Joshua Clayton
> <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > United Western Technologies Corp, known primarily as UniWest,
> > is a manufacturer of eddy current and ultrasonic testing equipment.
> >
> > Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > b/Documentation/devicetree/bindings/vendor-prefixes.txt index
> > 55df1d4..7dabdee 100644 ---
> > a/Documentation/devicetree/bindings/vendor-prefixes.txt +++
> > b/Documentation/devicetree/bindings/vendor-prefixes.txt @@ -230,6
> > +230,7 @@ toradex     Toradex AG toshiba        Toshiba Corporation
> >  toumaz Toumaz
> >  tplink TP-LINK Technologies Co., Ltd.
> > +uniwest        United Western Technologies Corp (UniWest)
> >  tronfy Tronfy
> 
> Alphabetical order please.
Gah. It was alphabetical until I rebased against v4.4

Will fix.
> 
> >  truly  Truly Semiconductors Limited
> >  upisemi        uPI Semiconductor Corp.
> > --
> > 2.5.0
> >

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
