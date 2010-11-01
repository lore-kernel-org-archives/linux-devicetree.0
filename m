From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] [PATCH V2] Adding DTB to architecture independent vmlinux
Date: Mon, 1 Nov 2010 00:02:07 -0400
Message-ID: <AANLkTi=8LFai5nDu=qzH37bRgL9zVZ4MpAYtqZWP1Gfk@mail.gmail.com>
References: <4CC99628.6000002@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4CC99628.6000002-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 28, 2010 at 11:26 AM, Dirk Brandewie
<dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi David,
>
> Thanks for looking at the patch.
>
> On 10/27/2010 05:57 PM, David VomLehn wrote:
>>
>> On Wed, Oct 27, 2010 at 05:30:27PM -0700, Dirk Brandewie wrote:
>>>
>>> Here is V2 of the patch.
>>
>> ...
>>>
>>> diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
>>> index 3068e1e..0f5eb1d 100644
>>> --- a/arch/x86/kernel/Makefile
>>> +++ b/arch/x86/kernel/Makefile
>>> @@ -120,6 +120,21 @@ obj-$(CONFIG_X86_CHECK_BIOS_CORRUPTION) +=3D check=
.o
>>> =A0obj-$(CONFIG_SWIOTLB) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D pci-swiot=
lb.o
>>> =A0obj-$(CONFIG_X86_OF) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D prom.o
>>>
>>> +ifeq ($(CONFIG_KERNEL_DTB),y)
>>> +ifneq ($(PLATFORM_DTB),)
>>> +obj-y +=3D $(PLATFORM_DTB).dtb.o
>>> +endif
>>> +endif
>>> +
>>> +dtstree =A0 =A0 =A0 =A0:=3D $(srctree)/arch/x86/boot/dts
>>> +
>>> +$(obj)/%.dtb: $(dtstree)/%.dts
>>> + =A0 =A0 =A0 $(call if_changed,dtc)
>>> +
>>> +$(obj)/%.dtb.S: $(obj)/%.dtb
>>> + =A0 =A0 =A0 @echo '.section .dtb,"a"'> =A0$@
>>> + =A0 =A0 =A0 @echo '.incbin "$<" '>> =A0$@
>>> +
>>
>> I've been playing a bit with the patch, and would suggest something
>> like the following for the second target:
>>
>> =A0 =A0 =A0 =A0$(obj)/%.dtb.S: $(obj)/%.dtb
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0@echo '#include<asm/page.h>'>$@
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0@echo '.balign PAGE_SIZE'>> =A0$@
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0@echo '.section .kernel:dtb,"a"'>> =A0$@
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0@echo '.global __$(*F)_dtb'>> =A0$@
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0@echo '__$(*F)_dtb:'>> =A0$@
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0@echo '.incbin "$<" '>> =A0$@
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0@echo '.balign PAGE_SIZE'>> =A0$@
>>
>> Advantages:
>> 1. =A0 =A0 =A0Each blob gets a name that can be used to refer to it. This
>> =A0 =A0 =A0 =A0allows multiple blobs to be built into a kernel, each with
>> =A0 =A0 =A0 =A0its own name. =A0The name of each blob is taken from the =
file
>> =A0 =A0 =A0 =A0name, so a source
>> =A0 =A0 =A0 =A0file abc.dts would produce a blob referred to as __abc_dt=
b.
>> 2. =A0 =A0 =A0Blobs are aligned on a page boundary and extend to the nea=
rest
>> =A0 =A0 =A0 =A0page boundary. Any blobs you don't care about can then ea=
sily
>> =A0 =A0 =A0 =A0be completely freed.
>>
>
> I like this idea in general but I have to admit I don't completely
> understand
> all the implications of adding multiple blobs. =A0I can see a use case wh=
ere a
> vendor would want to make a single static image that supported multiple
> platforms. =A0I am not sure how common this would be.

It is quite common.  ARM currently supports this.

> =A0One issue I see with
> linking multiple DTB's into the image is now the platform init code is ba=
ck
> to
> trying to detect which hardware it is running on to select the correct bl=
ob
> to
> get its configuration from.

This is the bit that is architecture specific.  In arm and in powerpc,
each platform or each platform family is recorded in the machine_desc
table (the structure of the entries is completely different for each
arch).  Does x86 have any such mechanism for differentiating between
machines?

g.
