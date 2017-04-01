From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH v3 12/37] mtd: nand: denali: support 1024 byte ECC step size
Date: Sat, 1 Apr 2017 17:43:29 +0900
Message-ID: <CAK7LNAS2g4Dvv+GNvQ0XU2Gt-pvqDZbKG0xiq=bAiDTRnWqeTw@mail.gmail.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com> <1490856383-31560-13-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490856383-31560-13-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Enrico Jorns <ejo-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chuanxiao Dong <chuanxiao.dong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-03-30 15:45 GMT+09:00 Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>:
> This driver was originally written for the Intel MRST platform with
> several platform specific parameters hard-coded.  Another thing we
> need to fix is the hard-coded ECC step size.  Currently, it is
> defined as follows:
>
>   #define ECC_SECTOR_SIZE 512
>
> (somehow, it is defined in both denali.c and denali.h)
>
> This must be avoided because the Denali IP supports 1024B ECC size
> as well.  The Denali User's Guide also says supporting both 512B and
> 1024B ECC sectors is possible, though it would require instantiation
> of two different ECC circuits.  So, possible cases are:
>
>  [1] only 512B ECC size is supported
>  [2] only 1024B ECC size is supported
>  [3] both 512B and 1024B ECC sizes are supported
>
> Newer versions of this IP need ecc.size and ecc.steps explicitly
> set up via the following registers:
>   CFG_DATA_BLOCK_SIZE       (0x6b0)
>   CFG_LAST_DATA_BLOCK_SIZE  (0x6c0)
>   CFG_NUM_DATA_BLOCKS       (0x6d0)
>
> Older versions do not have such registers (they were reserved), so
> write accesses are safely ignored.
>
> This commit adds new flags DENALI_CAP_ECC_SIZE_{512,1024}.
>
> The DT property "nand-ecc-step-size" is still optional; a reasonable
> default will be chosen for [1] and [2].  For case [3], users can
> force ECC size via DT in case firmware hard-codes ECC settings.
> If not specified, the driver will use chip's ECC requirement as a
> hint to decide the ECC size.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>
> Changes in v3:
>   - Move DENALI_CAP_ define out of struct denali_nand_info
>   - Use chip->ecc_step_ds as a hint to choose chip->ecc.size
>     where possible
>


Please hold back this patch
until we decide how to handle 14.




-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
