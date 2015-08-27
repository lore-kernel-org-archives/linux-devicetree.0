From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] arm/arm64: build all dtbs for CONPILE_TEST
Date: Thu, 27 Aug 2015 14:07:03 -0500
Message-ID: <CAL_JsqK+QHgCu4x-X+ShyWhj6g=+X-AC5AeCLm1DNYfFdCpH5A@mail.gmail.com>
References: <1440690994-5978-1-git-send-email-robh@kernel.org> <CAOesGMjzBaobpLsS77UziWeYO9wo21SkdpWT=Pib6AM7DDKTnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMjzBaobpLsS77UziWeYO9wo21SkdpWT=Pib6AM7DDKTnA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 27, 2015 at 11:08 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Thu, Aug 27, 2015 at 8:56 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> Enable building all dtb files when COMPILE_TEST is enabled. The dtbs are
>> not really dependent on a platform being enabled or any other kernel
>> config, so for testing coverage it is convenient to build all of the
>> dtbs.
>>
>> This builds all dts files in the tree, not just targets listed. This
>> is simpler for arm64 which has a bunch of sub-dirs.
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>> Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
>> Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
>> ---
>> I've had this on my todo list for a while. RFC for now as I want to do
>> the rest of the arches as well. I was originally thinking a new target
>> for this, but thanks to Olof for the COMPILE_TEST suggestion.
>>
>> Rob
>>
>>  arch/arm/boot/dts/Makefile   | 4 ++++
>>  arch/arm64/boot/dts/Makefile | 6 ++++++
>>  2 files changed, 10 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 246473a..4968442a 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -712,5 +712,9 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
>>  dtb-$(CONFIG_ARCH_ZX) += zx296702-ad1.dtb
>>  endif
>>
>> +dtstree                := $(srctree)/$(src)
>> +
>> +dtb-$(CONFIG_COMPILE_TEST) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
>> +
>>  always         := $(dtb-y)
>>  clean-files    := *.dtb
>> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
>> index 38913be..9f19390 100644
>> --- a/arch/arm64/boot/dts/Makefile
>> +++ b/arch/arm64/boot/dts/Makefile
>> @@ -11,3 +11,9 @@ dts-dirs += sprd
>>  dts-dirs += xilinx
>>
>>  subdir-y       := $(dts-dirs)
>> +
>> +dtstree                := $(srctree)/$(src)
>> +
>> +dtb-$(CONFIG_COMPILE_TEST) := $(patsubst $(dtstree)/%.dts,%.dtb, $(foreach d,$(dts-dirs), $(wildcard $(dtstree)/$(d)/*.dts)))
>
> I think it would be more appropriate to build dtb-n  here instead of
> _any_ file ending in dts.

The problem is here dtb-n is NULL. We have to add this into every
sub-dir. Not a big deal to do, but my concern was remembering to it
for new ones. Then again, most people are good at mindlessly
copy-pasting so maybe that won't be a problem. :)

> It would be useful to build all files, but it's not the behavior that
> COMPILE_TEST usually has.

Just changing to dtb-n would be equivalent because there is no other
dependency to enable building. Code has other dependencies typically.
What dtb do we not want to built in an allyesconfig build? If dtb's
have any dependencies, that would be a bug. To really make this
equivalent to a driver using COMPILE_TEST, we would need kconfig
symbols specifically for each platform's dtbs. Then we would have the
2 stage unhide (setting COMPILE_TEST) then enable the option.

I was also thinking that perhaps we don't want to require a kconfig
symbol for every platform family. Adding a kconfig entry is the only
way to enable building a dtb ATM. I know there are 2 camps to this
policy though.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
