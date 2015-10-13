From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 12/13] powerpc: enable building of all dtbs
Date: Tue, 13 Oct 2015 10:24:14 -0500
Message-ID: <CAL_JsqLnUtoNcAuyAQHX62zzgsARczD+CrXZkbfBZTV=wJmXyQ@mail.gmail.com>
References: <1444326827-3565-1-git-send-email-robh@kernel.org>
 <1444326827-3565-13-git-send-email-robh@kernel.org> <1444645581.31951.2.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444645581.31951.2.camel@ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Olof Johansson <olof@lixom.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 12, 2015 at 5:26 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> On Thu, 2015-10-08 at 12:53 -0500, Rob Herring wrote:
>> Enable building all dtb files when CONFIG_OF_ALL_DTBS is enabled. The dtbs
>> are not really dependent on a platform being enabled or any other kernel
>> config, so for testing coverage it is convenient to build all of the dtbs.
>> This builds all dts files in the tree, not just targets listed.
>>
>> Supporting this requires adding 'dtbs' make target which was not yet
>> supported on powerpc.
>
> I'm not entirely clear why we want this? It just means we can test build all
> the dts regardless of what kernel config we are building?

Yes. Given that I haven't found any that didn't build, that alone is
probably not so important. There's also an effort to move DT binding
docs to YAML, and I'm using dtc to dump out binding information to
automatically populate the binding docs hence I need to build all.
Eventually, we also plan to use the binding docs to validate dts
files.

> Have you tested the powerpc build with this applied or do you want me to?

Yes, I've tested powerpc.

>
>> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
>> index b9b4af2..0ec35ff 100644
>> --- a/arch/powerpc/Makefile
>> +++ b/arch/powerpc/Makefile
>> @@ -273,6 +273,11 @@ bootwrapper_install:
>>  %.dtb: scripts
>>       $(Q)$(MAKE) ARCH=ppc64 $(build)=$(boot) $(patsubst %,$(boot)/%,$@)
>>
>> +PHONY += dtbs
>> +
>> +dtbs: prepare scripts
>> +     $(Q)$(MAKE) ARCH=ppc64 $(build)=$(boot)/dts
>
> The ARCH should be powerpc, I guess you just copied the one above.

Okay, I'll drop it (it should already be set).

>
>> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
>> index 4eec430..381df1a 100644
>> --- a/arch/powerpc/boot/Makefile
>> +++ b/arch/powerpc/boot/Makefile
>> @@ -402,7 +402,7 @@ zInstall: $(CONFIGURE) $(addprefix $(obj)/, $(image-y))
>>  clean-files += $(image-) $(initrd-) cuImage.* dtbImage.* treeImage.* \
>>       zImage zImage.initrd zImage.chrp zImage.coff zImage.holly \
>>       zImage.miboot zImage.pmac zImage.pseries \
>> -     zImage.maple simpleImage.* otheros.bld *.dtb
>> +     zImage.maple simpleImage.* otheros.bld
>
> This looks like we used to clean *.dtb in the current dir but now we don't? But
> I'm probably just not understanding how clean-files works.

dtbs target is building in boot/dts. I just noticed that %.dtb targets
(or dtbImage.% targets) still build in boot/. I need to move them to
boot/dts/ as well to align with all other arches. This clean should
probably stay so dtbs get cleaned in either location.

>
>> @@ -410,6 +410,9 @@ clean-kernel += $(addsuffix .gz,$(clean-kernel))
>>  # If not absolute clean-files are relative to $(obj).
>>  clean-files += $(addprefix $(objtree)/, $(clean-kernel))
>>
>> +# Let clean descend into subdirs
>> +subdir- := dts
>> +
>>  WRAPPER_OBJDIR := /usr/lib/kernel-wrapper
>>  WRAPPER_DTSDIR := /usr/lib/kernel-wrapper/dts
>>  WRAPPER_BINDIR := /usr/sbin
>> diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
>> new file mode 100644
>> index 0000000..f121775
>> --- /dev/null
>> +++ b/arch/powerpc/boot/dts/Makefile
>> @@ -0,0 +1,5 @@
>> +dtstree              := $(srctree)/$(src)
>> +dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
>> +
>> +always               := $(dtb-y)
>
> How/is that different from just doing the more normal:
>
> obj-$(CONFIG_OF_ALL_DTBS) := ...
>
> ?

obj-y will build the dtb into the kernel which some arches do and not
what we want here.

Rob
