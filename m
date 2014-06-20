From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Device-tree and Marvell vendor prefix
Date: Fri, 20 Jun 2014 08:36:40 +0800
Message-ID: <CAN1soZztOAJv1TRAt1roOASeU1Lm5C+YiL-+BQ+D_QuyJxmQ0g@mail.gmail.com>
References: <8738f0so0m.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8738f0so0m.fsf-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 20, 2014 at 3:22 AM, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org> wrote:
>
> Hi Haojian, Grant and Rob,
>
> I'm submitting various patches for Marvell PXA27x architecture to support
> device-tree.
>
> In a review from Guennadi, he made me a comment that the official prefix for
> Marvell is "marvell" (according to
> Documentation/devicetree/bindings/vendor-prefixes.txt).
>
> As a matter of fact, there are 2 prefixes used :
>  - "marvell" : 264 uses in *.c files
>  - "mrvl" : 64 uses in *.c files
>
> So which one should I use ?
>
> Cheers.
>
> --
> Robert

Please use "marvell" instead since it's preferred. We can't replace
"mrvl" by "marvell" roughly.
It may cause incompatible in other's tree. We can add "marvell" for
all "mrvl" entries.

Regards
Haojian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
