From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH 01/13] of: Remove comments that state the obvious
Date: Tue, 25 Oct 2016 14:29:13 -0700
Message-ID: <1477430953.1998.19.camel@perches.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
         <1477429146-27039-2-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477429146-27039-2-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2016-10-25 at 13:58 -0700, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
> 
> Remove comments that state the obvious, to reduce clutter

Some of these removals might be overly aggressive.

> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
[]
> @@ -125,7 +114,6 @@ static int __of_adjust_phandle_ref(struct device_node *node,
>  	int offset, propcurlen;
>  	int err = 0;
>  
> -	/* make a copy */
>  	propval = kmalloc(rprop->length, GFP_KERNEL);
>  	if (!propval) {
>  		pr_err("%s: Could not copy value of '%s'\n",ld

This kmalloc/memcpy could use kmemdup instead.

It doesn't really need the pr_err either as kmalloc and/or
kmemdup get a generic OOM message.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
