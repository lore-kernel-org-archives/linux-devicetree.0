From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [RESEND PATCH v2 00/53] mtd: nand: denali: 2nd round of Denali
 NAND IP patch bomb
Date: Thu, 23 Mar 2017 10:54:08 +0900
Message-ID: <CAK7LNATT9uz+vqRx6Fndyxm=TeVVRseM1rsA+8tNw7un5bkB6A@mail.gmail.com>
References: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com> <20170322223550.1f1c97ae@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170322223550.1f1c97ae@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, laurent.monat-1zQW0WpQGTYgLlGVC3PcNw@public.gmane.org, thorsten.christiansson-1zQW0WpQGTYgLlGVC3PcNw@public.gmane.org, Enrico Jorns <ejo-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chuanxiao Dong <chuanxiao.dong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Boris,


2017-03-23 6:35 GMT+09:00 Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> Hi Masahiro,
>
> On Thu, 23 Mar 2017 05:06:59 +0900
> Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
>
>> It took a couple months to update this series, but finally here is v2.
>> (v1: https://lkml.org/lkml/2016/11/26/144 )
>>
>> This driver includes many problems.
>>
>> One of the biggest one is a bunch of hard-coded parameters.  This IP
>> has many parameters that can be customized when a delivery RTL is
>> generated.  However, this driver was upstreamed by Intel, with
>> Intel parameters hard-coded.  Later, Altera added denali_dt.c to use
>> this driver for embedded boards, but they did not fix the code in
>> denali.c  So, this driver has never worked.  Even some DT bindings
>> actually turned out wrong.
>>
>> There are more problems: [1] The driver just retrieves the OOB area as-is
>> whereas the controller uses syndrome page layout. [2] Many NAND chip
>> specific parameters are hard-coded in the driver. [3] ONFi devices are
>> not working  [4] It can not read Bad Block Marker
>>
>> This patch series intends to solve those problems.
>>
>> Since v1, here are more fixes/improvements:
>>  - Fix raw/oob callbacks for syndrome page layout
>>  - Implement setup_data_interface() callback
>>  - Fix/implement more commands for ONFi devices
>>  - Allow to skip the driver internal bounce buffer
>>  - Support PIO in case DMA is not supported
>>  - Switch from ->cmdfunc over to ->cmd_ctrl
>
> I'll probably pick a few patches for 4.12, so please wait a bit before
> sending a v4.


This will be helpful.

I was refused by the SMTP server I use
(probably due to too much volume at once).




Please check the following as well.

>>   mtd: nand: do not check R/B# for CMD_READID in nand_command(_lp)
>>   mtd: nand: do not check R/B# for CMD_SET_FEATURES in nand_command(_lp)

I noticed them when I switched from ->cmdfunc to ->cmd_ctrl hook.



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
