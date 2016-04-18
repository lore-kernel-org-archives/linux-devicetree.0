From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: uniphier: add /memreserve/ for spin-table
 release address
Date: Mon, 18 Apr 2016 17:55:14 +0900
Message-ID: <CAK7LNATtWyZtVWrW3nOYjN=aRvCO1w8Rvr6_JWm3QfMMPhrSAQ@mail.gmail.com>
References: <1460743138-17768-1-git-send-email-yamada.masahiro@socionext.com>
	<20160418084508.GA21438@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160418084508.GA21438@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,


2016-04-18 17:45 GMT+09:00 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>:
> On Sat, Apr 16, 2016 at 02:58:58AM +0900, Masahiro Yamada wrote:
>> As Documentation/arm64/booting.txt says, the cpu-release-addr
>> location should be reserved.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
>> ---
>>
>>  arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi
>> index 651c9d9..90909d2 100644
>> --- a/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi
>> +++ b/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi
>> @@ -42,6 +42,8 @@
>>   *     OTHER DEALINGS IN THE SOFTWARE.
>>   */
>>
>> +/memreserve/ 0x80000100 0x00000008;
>> +
>
> Please add a comment above the memreserve to mention what it is
> protecting. That helps to avoid having this cargo-culted to cases where
> it is not needed.

OK, will do.


> I take it that the code for the spin-table is not in RAM, and does not
> need to be protected similarly?


I use U-Boot to boot Linux for this board.

The code for the spin-table is on SDRAM, and not protected.

I already recognize this problem.

The difficulty for U-Boot is that
U-Boot relocates itself to the top of the DRAM.
So, it is difficult to predict
where the code will be placed.

I will discuss this issue in the U-Boot ML.


So, My current solution is
pre-fetch the code for the spin-table onto I-cache.



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
