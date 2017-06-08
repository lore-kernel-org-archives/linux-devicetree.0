From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] external references for device tree overlays
Date: Thu, 08 Jun 2017 10:08:45 +0300
Message-ID: <1496905725.28265.7.camel@hp800z>
References: <1496667567-13266-1-git-send-email-stefani.seibold.ext@huawei.com>
         <593657AF.8050208@gmail.com> <1496776974.3821.6.camel@seibold.net>
         <59374CE9.40406@gmail.com> <1496815399.6999.1.camel@seibold.net>
         <5938BF8F.2010001@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5938BF8F.2010001-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stefani Seibold <stefani-mkwtCZVSLSnR7s880joybQ@public.gmane.org>, jcm-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org, Stefani Seibold <stefani.seibold.ext-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Frank,
On Wed, 2017-06-07 at 20:07 -0700, Frank Rowand wrote:
> Adding Jon.
> 

[snip]

> __overlays__ node if that exists).
> 

For what is worth, I will shortly post a method for fixing up
busted or incomplete device trees. It is unrelated to this specific
problem but I think addresses that too (with a couple minor fixes).

The general problem has to do with phandles. We do have a method
to apply overlays to modify the content of the tree, but we lack
a method to add missing phandles to nodes that should have them.

The first missing part of the puzzle is to pick up symbols from
applied overlays and then work from there.

> -Frank
> 
> > 
> > - Stefani

Regards

-- Pantelis


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
