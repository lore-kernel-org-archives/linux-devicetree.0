From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/1] of: add vendor prefix for Chipidea
Date: Sun, 28 Sep 2014 08:24:40 +0800
Message-ID: <20140928002439.GA3324@peterchendt>
References: <1410827745-4101-1-git-send-email-peter.chen@freescale.com>
 <CAL_JsqLVUrxEZKQiHa=-+krnoog0rybEgp8O7pZxbR5TyQx5kA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLVUrxEZKQiHa=-+krnoog0rybEgp8O7pZxbR5TyQx5kA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 26, 2014 at 11:32:49AM -0500, Rob Herring wrote:
> On Mon, Sep 15, 2014 at 7:35 PM, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > Adds chipidea to the list of DT vendor prefixes.
> >
> > Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Applied.

Hi Rob & Greg,

I am sorry I also sent this DT patch to Greg by mistake, and queued by usb tree.
Will meet error when linus pulls both of your trees?

Peter

> 
> > ---
> >  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > index ac7269f..28c574f 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -29,6 +29,7 @@ calxeda       Calxeda
> >  capella        Capella Microsystems, Inc
> >  cavium Cavium, Inc.
> >  cdns   Cadence Design Systems Inc.
> > +chipidea       Chipidea, Inc
> >  chrp   Common Hardware Reference Platform
> >  chunghwa       Chunghwa Picture Tubes Ltd.
> >  cirrus Cirrus Logic, Inc.
> > --
> > 1.7.9.5
> >

-- 
Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
