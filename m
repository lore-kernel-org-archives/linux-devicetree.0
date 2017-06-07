From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH v4 04/23] mtd: nand: denali: avoid hard-coding ECC step,
 strength, bytes
Date: Wed, 7 Jun 2017 16:21:15 +0900
Message-ID: <CAK7LNATObBpfjdSJB9G5RgHQV2FaSepzk6Lb=b=_eMqfxYf7ng@mail.gmail.com>
References: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
 <1496704922-12261-5-git-send-email-yamada.masahiro@socionext.com>
 <20170607000133.69fbf82b@bbrezillon> <CAK7LNATXygK2f71J8gggGQRuEdJ21CJfg9WVCYXgO=+NRBwcLg@mail.gmail.com>
 <20170607090250.729625c9@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170607090250.729625c9@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chuanxiao Dong <chuanxiao.dong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Enrico Jorns <ejo-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Boris,


2017-06-07 16:02 GMT+09:00 Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> On Wed, 7 Jun 2017 12:09:31 +0900
> Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
>
>> >> +
>> >> +static int denali_ecc_setup(struct mtd_info *mtd, struct nand_chip *chip,
>> >> +                         struct denali_nand_info *denali)
>> >> +{
>> >> +     struct nand_ecc_caps caps;
>> >> +     int ret;
>> >> +
>> >> +     caps.stepinfos = denali->stepinfo;
>> >> +     caps.nstepinfos = 1;
>> >> +     caps.calc_ecc_bytes = denali_calc_ecc_bytes;
>> >> +     caps.oob_reserve_bytes = denali->bbtskipbytes;
>> >
>> > If you get rid of this oob_reserve_bytes field, you can define caps as
>> > a static const and even directly store ecc_caps in denali_nand_info.
>>
>> To make caps static const, denali_calc_ecc_bytes must be exported
>> to be referenced from denali_dt/denali_pci.
>> I am reluctant to do it.
>
> You already duplicate other information in denali_dt.c and
> denali_pci.c,

The ECC step-size and strength are tightly associated to each IP variant.
I see duplication between denali_dt and denali_pci, but it is just because
Intel and Altera happened to have the same parameters.

On the other hand, denali_calc_ecc_bytes() is common to all variants
because ECC algorithm is not customizable.


> so what prevents you from duplicating this one-line
> function?
>
> Also, denali core already exports 2 functions,

They are entries for probe/remove.

> I don't see the problem
> in exporting the common nand_ecc_caps object. Why are you reluctant to
> that?

denali_calc_ecc_bytes() is independent of DT, PCI, or whatever.
I see less reason to expose it.

caps is only used on probing, so I used a local variable.
I do not think it is a big problem.

-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
