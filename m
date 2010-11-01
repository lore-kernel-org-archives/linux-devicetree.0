From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] [PATCH V2] Adding DTB to architecture independent vmlinux
Date: Mon, 1 Nov 2010 00:12:15 -0400
Message-ID: <AANLkTinjb40We-MR66wAx9Wzrcv9bC8FALR0YnXDkNe7@mail.gmail.com>
References: <4CC6E491.7060304@gmail.com>
	<20101027110937.GD7822@angua.secretlab.ca>
	<4CC860EF.6060503@linux.intel.com> <4CC8C423.9050600@gmail.com>
	<20101028005754.GA27386@dvomlehn-lnx2.corp.sa.net>
	<4CC99441.4030307@linux.intel.com>
	<20101028173202.GA25771@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101028173202.GA25771-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 28, 2010 at 1:32 PM, David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Oct 28, 2010 at 08:18:25AM -0700, H. Peter Anvin wrote:
>> On 10/27/2010 5:57 PM, David VomLehn wrote:
>>>
>>> I've been playing a bit with the patch, and would suggest something
>>> like the following for the second target:
>>>
>>> =A0 =A0 =A0$(obj)/%.dtb.S: $(obj)/%.dtb
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0@echo '#include<asm/page.h>'>$@
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0@echo '.balign PAGE_SIZE'>> =A0$@
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0@echo '.section .kernel:dtb,"a"'>> =A0$@
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0@echo '.global __$(*F)_dtb'>> =A0$@
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0@echo '__$(*F)_dtb:'>> =A0$@
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0@echo '.incbin "$<" '>> =A0$@
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0@echo '.balign PAGE_SIZE'>> =A0$@
>>>
>>> Advantages:
>>> 1. =A0 Each blob gets a name that can be used to refer to it. This
>>> =A0 =A0 =A0allows multiple blobs to be built into a kernel, each with
>>> =A0 =A0 =A0its own name. =A0The name of each blob is taken from the file
>>> =A0 =A0 =A0name, so a source
>>> =A0 =A0 =A0file abc.dts would produce a blob referred to as __abc_dtb.
>>> 2. =A0 Blobs are aligned on a page boundary and extend to the nearest
>>> =A0 =A0 =A0page boundary. Any blobs you don't care about can then easily
>>> =A0 =A0 =A0be completely freed.
>>>
>>> You might then use:
>>>
>>> =A0 =A0 =A0obj-y +=3D $(addprefix .dtb.o,$(PLATFORM_DTB))
>>>
>>> to add blob names, but I'm not completely confident this is the way to =
go.
>>
>> To be able to specify "dtb=3D<name>" on the command line, you want the
>> name to be manifest in string form, rather than as a symbol. =A0That mea=
ns
>> putting a header or something similar in front of the blobs.
>
> Could you not iterate over the blobs and use the "compatible" property to
> match the string? It would seem to me that this would be the right thing
> to do in any case since it would then follow the standard method for
> interpreting that property.

Hmmm, I had mistakenly thought that dtb=3D<blah> was proposed to pass in
the address of a blob already loaded into memory (perhaps by grub),
but I understand now.  Yes, it could be performed by name.  However,
David's suggestion of passing in a compatible string better matches
existing conventions.

>> How big are these blobs in the typical case? =A0Padding to the page size
>> could easily add more waste than it saves. =A0In that case it probably
>> would be better to put the stuff in the init area and copy the active
>> blob to an allocated location.

4-8k typically.  They could also be compressed, but that doesn't gain
a whole lot and it would complicate the process of scanning the
compatible values as suggested above.

> In my case, where there are a lot of up-front reservations of memory
> at a static address, there is a fair amount of work to do before
> it's possible to do the dynamic address allocation for the blob's
> ultimate destination, but I'm okay with either doing blob size and address
> rounding or copying it from init. I don't see a benefit of supporting
> multiple approaches for Linux.

It is already possible to do allocation early allocation in both
powerpc and arm.  Also, blob relocation can be deferred until later in
boot if need be.  The flat tree can be accessed before relocating it.
Just as long as it is done so before unflattening the tree (possibly
as part of).

Regardless, Peter is absolutely right; the linked in .dtbs definitely
must be in an init section so they can be discarded after copy.

g.
