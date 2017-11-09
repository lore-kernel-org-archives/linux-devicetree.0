From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: handle dtb-y and CONFIG_OF_ALL_DTBS natively
 in Makefile.lib
Date: Thu, 9 Nov 2017 14:34:38 -0600
Message-ID: <CAL_JsqLJZ3D8MXooiS+RFC1jJTCf7L6epwXUgovMAtH5Logwqg@mail.gmail.com>
References: <1509859853-27473-1-git-send-email-yamada.masahiro@socionext.com>
 <1509859853-27473-3-git-send-email-yamada.masahiro@socionext.com>
 <CAAG0J98rRS+Sw8k_87gmTqYdNWByk=9zWVbWnC348vd63H4N9w@mail.gmail.com>
 <CAAG0J99envT6gtM6tHdTvetrHr0itX1dexkuWSU=u1c5UTLE1A@mail.gmail.com> <CAK7LNAT-3yBTFqnFECbGzSHRUiaG38b0BG3_3ouRAZRTF+iiDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <CAK7LNAT-3yBTFqnFECbGzSHRUiaG38b0BG3_3ouRAZRTF+iiDQ@mail.gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: James Hogan <james@albanarts.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, James Hogan <james.hogan@mips.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 9, 2017 at 6:23 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Hi James,
>
>
> 2017-11-09 21:19 GMT+09:00 James Hogan <james@albanarts.com>:
>> (resend using a working From address)
>>
>> <yamada.masahiro@socionext.com> wrote:
>>> If CONFIG_OF_ALL_DTBS is enabled, "make ARCH=arm64 dtbs" compiles each
>>> DTB twice; one from arch/arm64/boot/dts/*/Makefile and the other from
>>> the dtb-$(CONFIG_OF_ALL_DTBS) line in arch/arm64/boot/dts/Makefile.
>>> It could be a race problem when building DTBS in parallel.
>>>
>>> Another minor issue is CONFIG_OF_ALL_DTBS covers only *.dts in vendor
>>> sub-directories, so this broke when Broadcom added one more hierarchy
>>> in arch/arm64/boot/dts/broadcom/<soc>/.
>>>
>>> One idea to fix the issues in a clean way is to move DTB handling
>>> to Kbuild core scripts.  Makefile.dtbinst already recognizes dtb-y
>>> natively, so it should not hurt to do so.
>>>
>>> Add $(dtb-y) to extra-y, and $(dtb-) as well if CONFIG_OF_ALL_DTBS is
>>> enabled.  All clutter things in Makefiles go away.
>>>
>>> As a bonus clean-up, I also removed dts-dirs.  Just use subdir-y
>>> directly to traverse sub-directories.
>>>
>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>
>>  ...
>>
>>> diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
>>> index 7891ffa..b2b0d88 100644
>>> --- a/arch/mips/boot/dts/Makefile
>>> +++ b/arch/mips/boot/dts/Makefile
>>> @@ -1,20 +1,14 @@
>>> -dts-dirs       += brcm
>>> -dts-dirs       += cavium-octeon
>>> -dts-dirs       += img
>>> -dts-dirs       += ingenic
>>> -dts-dirs       += lantiq
>>> -dts-dirs       += mti
>>> -dts-dirs       += netlogic
>>> -dts-dirs       += ni
>>> -dts-dirs       += pic32
>>> -dts-dirs       += qca
>>> -dts-dirs       += ralink
>>> -dts-dirs       += xilfpga
>>> +subdir-y       += brcm
>>> +subdir-y       += cavium-octeon
>>> +subdir-y       += img
>>> +subdir-y       += ingenic
>>> +subdir-y       += lantiq
>>> +subdir-y       += mti
>>> +subdir-y       += netlogic
>>> +subdir-y       += ni
>>> +subdir-y       += pic32
>>> +subdir-y       += qca
>>> +subdir-y       += ralink
>>> +subdir-y       += xilfpga
>>>
>>> -obj-y          := $(addsuffix /, $(dts-dirs))
>>> -
>>> -dtstree                := $(srctree)/$(src)
>>> -dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(foreach d,$(dts-dirs), $(wildcard $(dtstree)/$(d)/*.dts)))
>>> -
>>> -always         := $(dtb-y)
>>> -subdir-y       := $(dts-dirs)
>>> +obj-$(BUILTIN_DTB)     := $(addsuffix /, $(subdir-y))
>>
>> I wonder if that should be CONFIG_BUILTIN_DTB?
>>
>> This is causing failures in linux-next with MIPS
>> cavium_octeon_defconfig like below, and changing this line to
>> CONFIG_BUILTIN_DTB seems to fix it.
>
> Good catch!
>
>
> Rob,
> Can you fix it to CONFIG_BUILTIN_DTB?

Fixed.

Rob
