From: "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [RFC] [PATCH V2] Adding DTB to architecture independent vmlinux
Date: Thu, 28 Oct 2010 08:18:25 -0700
Message-ID: <4CC99441.4030307@linux.intel.com>
References: <4CC6E491.7060304@gmail.com>
	<20101027110937.GD7822@angua.secretlab.ca>
	<4CC860EF.6060503@linux.intel.com> <4CC8C423.9050600@gmail.com>
	<20101028005754.GA27386@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101028005754.GA27386-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org>
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
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/27/2010 5:57 PM, David VomLehn wrote:
>
> I've been playing a bit with the patch, and would suggest something
> like the following for the second target:
>
> 	$(obj)/%.dtb.S: $(obj)/%.dtb
> 		@echo '#include<asm/page.h>'>$@
> 		@echo '.balign PAGE_SIZE'>>  $@
> 		@echo '.section .kernel:dtb,"a"'>>  $@
> 		@echo '.global __$(*F)_dtb'>>  $@
> 		@echo '__$(*F)_dtb:'>>  $@
> 		@echo '.incbin "$<" '>>  $@
> 		@echo '.balign PAGE_SIZE'>>  $@
>
> Advantages:
> 1.	Each blob gets a name that can be used to refer to it. This
> 	allows multiple blobs to be built into a kernel, each with
> 	its own name.  The name of each blob is taken from the file
> 	name, so a source
> 	file abc.dts would produce a blob referred to as __abc_dtb.
> 2.	Blobs are aligned on a page boundary and extend to the nearest
> 	page boundary. Any blobs you don't care about can then easily
> 	be completely freed.
>
> You might then use:
>
> 	obj-y += $(addprefix .dtb.o,$(PLATFORM_DTB))
>
> to add blob names, but I'm not completely confident this is the way to go.

To be able to specify "dtb=<name>" on the command line, you want the 
name to be manifest in string form, rather than as a symbol.  That means 
putting a header or something similar in front of the blobs.

How big are these blobs in the typical case?  Padding to the page size 
could easily add more waste than it saves.  In that case it probably 
would be better to put the stuff in the init area and copy the active 
blob to an allocated location.

	-hpa
