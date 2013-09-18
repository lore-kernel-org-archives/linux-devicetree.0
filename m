From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 0/2] move of_find_next_cache_node to DT core
Date: Wed, 18 Sep 2013 09:51:16 -0500
Message-ID: <20130918145116.D53A5C42CDF@trevor.secretlab.ca>
References: <1379501585-12532-1-git-send-email-Sudeep.KarkadaNagesha@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379501585-12532-1-git-send-email-Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Sudeep KarkadaNagesha <sudeep.karkadanagesha-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 18 Sep 2013 11:53:03 +0100, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org> wrote:
> From: Sudeep KarkadaNagesha <sudeep.karkadanagesha-5wv7dgnIgG8@public.gmane.org>
> 
> Hi,
> 
> The cache bindings are generic and used by many other architectures
> apart from PPC. These patches fixes and move the existing definition
> of of_find_next_cache_node to DT common code.
> 
> Regards,
> Sudeep

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

However, do you have a user for this function on other architectures
yet? I'd like to see a user for the function in the same patch series..

g.

> 
> Sudeep KarkadaNagesha (2):
>   powerpc: remove big endianness assumption in of_find_next_cache_node
>   of: move definition of of_find_next_cache_node into common code.
> 
>  arch/powerpc/include/asm/prom.h |  3 ---
>  arch/powerpc/kernel/prom.c      | 31 -------------------------------
>  drivers/of/base.c               | 31 +++++++++++++++++++++++++++++++
>  include/linux/of.h              |  2 ++
>  4 files changed, 33 insertions(+), 34 deletions(-)
> 
> -- 
> 1.8.1.2
> 
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
