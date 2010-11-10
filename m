From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] [PATCH V2] Adding DTB to architecture independent vmlinux
Date: Tue, 9 Nov 2010 23:03:01 -0700
Message-ID: <AANLkTikqDga=sDRFqECMkBW5ssBPLQVe_Xu98mkd56mw@mail.gmail.com>
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

Hi Dirk,

As promised when we talked at plumbers, here is a method that you can
use to bind multiple .dtbs into the kernel and to have symbols
pointing to the beginning of each of them.

Take a look at arch/arm/boot/compressed/piggy.*.S

You'll see this:

        .section .piggydata,#alloc
        .globl  input_data
input_data:
        .incbin "arch/arm/boot/compressed/piggy.gzip"
        .globl  input_data_end
input_data_end:


Which is used to link in a raw binary (compressed vmlinux) and
reference it with the input_data label.

A similar thing could be used for .dtbs with some script and
makefile-fu.  If you added targets for .dts--->.dtb and .dtb-->.S,
where the .dtb-->.S target generates a .S file that looks something
like this:

        .section .init.dtbdata
        .globl dtb_init_<dtb-filename>
dtb_init_<dtb-filename>:
        .incbin "<full-path-to-dtb-filename>"

Then you'd need to add pre and post linker sections with labels that
wraps the entire region of dtbs so that can be found & parsed, and so
that they can be freed.  The individual .dtbs can then be referenced
using the dtb_init_<dtb-filename> symbol.

Make sense?

g.


On Thu, Oct 28, 2010 at 9:26 AM, Dirk Brandewie
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
> platforms. =A0I am not sure how common this would be. =A0One issue I see =
with
> linking multiple DTB's into the image is now the platform init code is ba=
ck
> to
> trying to detect which hardware it is running on to select the correct bl=
ob
> to
> get its configuration from.
>
> As part of the complete DTB story on x86 I am adding the ability to pass =
the
> DTB
> in from the boot loader. =A0I think this mechanism would be the more comm=
on
> case
> for supporting multiple platforms with a single vmlinux image.
>
>
>> You might then use:
>>
>> =A0 =A0 =A0 =A0obj-y +=3D $(addprefix .dtb.o,$(PLATFORM_DTB))
>>
>> to add blob names, but I'm not completely confident this is the way to g=
o.
>
> I am still trying to settle on the right way to specify the DTB to be lin=
ked
> in
> that won't generate a lot of hate from the build/distribution people where
> they
> are supporting multiple platforms with/without the need of the DTB.
>
> --Dirk
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
