From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v5 00/23] mtd: nand: denali: Denali NAND IP patch bomb
Date: Thu, 8 Jun 2017 16:12:49 +0900
Message-ID: <CAK7LNASu=cmQo+gCmfY=MFLoGtm0oeZQ036Nst63bZOEwFxR4g@mail.gmail.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com> <CAK7LNAQMCCxZAJc=7EwEPmpxD+-VsgOvMxwk5ySLfxLVsarqhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAQMCCxZAJc=7EwEPmpxD+-VsgOvMxwk5ySLfxLVsarqhw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Enrico Jorns <ejo@pengutronix.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

2017-06-08 15:16 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Hi Boris,
>
> 2017-06-07 20:52 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>> This patch series intends to solve various problems.
>>
>> [1] The driver just retrieves the OOB area as-is
>>     whereas the controller uses syndrome page layout.
>> [2] Many NAND chip specific parameters are hard-coded in the driver.
>> [3] ONFi devices are not working
>> [4] It can not read Bad Block Marker
>>
>> Outstanding changes are:
>> - Fix raw/oob callbacks for syndrome page layout
>> - Implement setup_data_interface() callback
>> - Fix/implement more commands for ONFi devices
>> - Allow to skip the driver internal bounce buffer
>> - Support PIO in case DMA is not supported
>> - Switch from ->cmdfunc over to ->cmd_ctrl
>
>
> I am planning v6, but
> how many can you pick-up from this series?
>
> I did not see your comments for 01-05, so are they applicable?
>
> Could you add
> Acked-by: Rob Herring <robh@kernel.org>
> for 05  (http://patchwork.ozlabs.org/patch/772388/)
>
> He had already acked it, but I just missed it.
>

BTW, this series can not apply to Boris's tree
because of the following commit.

commit 4a78cc644eed3cf2dae00c3a959910a86c140fd6
Author: Boris Brezillon <boris.brezillon@free-electrons.com>
Date:   Fri May 26 17:10:15 2017 +0200

    mtd: nand: Make sure drivers not supporting SET/GET_FEATURES
return -ENOTSUPP



I will send v6 rebased on nand/next branch.



-- 
Best Regards
Masahiro Yamada
