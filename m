From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Device-tree and Marvell vendor prefix
Date: Thu, 19 Jun 2014 21:22:17 +0200
Message-ID: <8738f0so0m.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi Haojian, Grant and Rob,

I'm submitting various patches for Marvell PXA27x architecture to support
device-tree.

In a review from Guennadi, he made me a comment that the official prefix for
Marvell is "marvell" (according to
Documentation/devicetree/bindings/vendor-prefixes.txt).

As a matter of fact, there are 2 prefixes used :
 - "marvell" : 264 uses in *.c files
 - "mrvl" : 64 uses in *.c files

So which one should I use ?

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
