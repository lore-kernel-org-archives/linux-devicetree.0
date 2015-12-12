From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 0/4] arm,arm64: uniphier: add a new driver, device tree updates
Date: Sat, 12 Dec 2015 15:57:47 +0900
Message-ID: <CAK7LNATcvAFr3joQ0xjZ+M+HEmPubXxj_v09r1VPfTnGtnRKpQ@mail.gmail.com>
References: <1448357962-12259-1-git-send-email-yamada.masahiro@socionext.com>
	<10682472.c84OiaBWfX@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <10682472.c84OiaBWfX@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm@kernel.org, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,


Sorry for confusing you.

2015-12-12 9:12 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> On Tuesday 24 November 2015 18:39:18 Masahiro Yamada wrote:
>>
>> Here is another series for UniPhier SoC family:
>>
>>  - 1/4: add a new driver.  The UniPhier System Bus is an external bus
>>         where on-board devices are connected to the SoC.
>>         (please check if the binding specification is OK.)
>>
>>  - 2/4: device tree updates to use the driver added by 1/4
>>
>>  - 3/4: trivial rename of device node names
>>
>>  - 4/4: initial commit for ARMv8 SoC/Board device trees
>>
>> Please apply 2/4, 3/4/, 4/4 into the same branch because 4/4 depends on 2/4 and 3/4.
>> (4/4 creates symbolic links to ARM device trees.)
>
> I'm a bit confused how this relates to the newer version ("[PATCH v5] bus:
> uniphier-system-bus: add UniPhier System Bus driver"). The new version
> only has one patch instead of four, so I'm not sure if the patches 2, 3
> and 4 of this series still apply.
>
> Can you clarify, or send the entire series again?
>
>         Arnd


I'd like to retract this series.
Please just disregard it.


Instead, please review this one:
https://patchwork.kernel.org/patch/7714151/


Thanks!

-- 
Best Regards
Masahiro Yamada
