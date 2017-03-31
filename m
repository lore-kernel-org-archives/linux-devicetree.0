From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v3 14/37] mtd: nand: denali: support "nand-ecc-strength"
 DT property
Date: Fri, 31 Mar 2017 14:06:32 +0900
Message-ID: <CAK7LNARUKwMHd79ALDx_SDY9XKcHPY96xTAOMQx6XarFgwb-AA@mail.gmail.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
 <1490856383-31560-15-git-send-email-yamada.masahiro@socionext.com> <20170330160238.59e5a2c1@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170330160238.59e5a2c1@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Graham Moore <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Boris,


2017-03-30 23:02 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Thu, 30 Mar 2017 15:46:00 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Historically, this driver tried to choose as big ECC strength as
>> possible, but it would be reasonable to allow DT to set a particular
>> ECC strength with "nand-ecc-strength" property.  This is useful
>> when a particular ECC setting is hard-coded by firmware (or hard-
>> wired by boot ROM).
>>
>> If no ECC strength is specified in DT, "nand-ecc-maximize" is implied
>> since this was the original behavior.
>
> You said there is currently no DT users,

Right.  No DT users ever in upstream.


> so how about changing the
> "fallback to ECC maximization" behavior for DT users, and instead of
> maximizing the ECC strength take the NAND requirements into account
> (chip->ecc_strength_ds).

This is difficult to judge in some cases.

As I said before, 4/512 and 8/1024 are not equivalent.

If chip's requirement  chip->ecc_step_ds matches
to the ecc->size supported by the controller,
this is easy.


If a chip requests 1024B, then the controller can only support 512B chunk
(or vice versa), it is difficult to simply compare
ecc strength.

Is it a bad thing if we use too strong ECC strength?

The disadvantage I see is we will have less OOB-free bytes,
but this will not be fatal, I guess.




-- 
Best Regards
Masahiro Yamada
