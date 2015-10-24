From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 2/4] ARM: dts: uniphier: delete i2c aliases
Date: Sat, 24 Oct 2015 12:24:07 +0900
Message-ID: <CAK7LNAQGGdcDq8Q=9LG2ev_O3eaH55Hq-Te5NZCTSuB-K+9dVw@mail.gmail.com>
References: <1445427390-22750-1-git-send-email-yamada.masahiro@socionext.com>
	<1445427390-22750-3-git-send-email-yamada.masahiro@socionext.com>
	<4000897.7Un1B3qMyp@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4000897.7Un1B3qMyp@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, arm@kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

2015-10-24 5:16 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> On Wednesday 21 October 2015 20:36:28 Masahiro Yamada wrote:
>> The user space should not expect that a particular I2C channel is
>> always visible through the same character device.
>> No reason to fix the I2C indexes with aliases.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>
>
> As I said in my reply to the earlier mail, I didn't really like the
> idea of having holes in the numbering for the i2c controllers, but
> this new approach also doesn't look ideal.
>
> We should have stable bus numbers on any given board, and the aliases
> work well for that. I just don't think the aliases need to be stable
> between different boards just because they are based on the same
> SoC.
>
> I'd suggest staying with the current slightly awkward approach though,
> to avoid regressions. Please send a follow-up patch to add the same
> aliases on the new boards and drop this patch, unless someone else
> can come up with a better idea.
>

OK, will do.


-- 
Best Regards
Masahiro Yamada
