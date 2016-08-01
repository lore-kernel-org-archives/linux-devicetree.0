From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Documentation inconsistency
Date: Mon, 1 Aug 2016 14:04:43 -0700
Message-ID: <579FB96B.2070807@gmail.com>
References: <CALw8SCUjiKsAoNVxORkwyrDztEAGYd-zdCGpj6UJHjskppuROQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALw8SCUjiKsAoNVxORkwyrDztEAGYd-zdCGpj6UJHjskppuROQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/01/16 12:55, Mirza Krak wrote:
> Hi all.
> 
> Came across a small documentation regression.
> 
> In 75f353b61342 ("of/platform: Fix of_platform_device_destroy
> iteration of devices") return value was removed from
> of_platform_depopulate but documentation brief was not updated.
> 
> /**
>  * of_platform_depopulate() - Remove devices populated from device tree
>  * @parent: device which children will be removed
>  *
>  * Complementary to of_platform_populate(), this function removes children
>  * of the given device (and, recurrently, their children) that have been
>  * created from their respective device tree nodes (and only those,
>  * leaving others - eg. manually created - unharmed).
>  *
>  * Returns 0 when all children devices have been removed or
>  * -EBUSY when some children remained.
>  */
> void of_platform_depopulate(struct device *parent)
> 
> I could send a patch removing the "return" part, but I am not sure if
> the rest of the brief needs some updating.
> 
> Best Regards
> Mirza
> 

Hi Mirza,

Thanks for pointing that out.  But no need for a patch.  I've been going
through all of the docbook headers (which have much breakage) and will
be updating them.

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
