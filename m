From: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [sodaville] [PATCH 3/4] of/dtc: force dtb size to modulo 32 bytes
Date: Fri, 12 Nov 2010 08:24:53 -0800
Message-ID: <4CDD6A55.6040603@gmail.com>
References: <cover.1289520079.git.dirk.brandewie@gmail.com>
	<a7e6885535e6c930560f3d79a8a55ae922499752.1289520079.git.dirk.brandewie@gmail.com>
	<4CDC8EA3.6080608@linux.intel.com> <4CDC91DC.7030407@gmail.com>
	<20101112011617.GA3102@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101112011617.GA3102@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,
On 11/11/2010 05:16 PM, David Gibson wrote:
> On Thu, Nov 11, 2010 at 05:01:16PM -0800, Dirk Brandewie wrote:
>> On 11/11/2010 04:47 PM, H. Peter Anvin wrote:
>>> On 11/11/2010 04:03 PM, dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>>>> From: Dirk Brandewie<dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>
>>>> This patch forces the size of the DTB to be modulo 32 bytes. This is
>>>> needed to support linking multiple DTB's into a single section in the
>>>> image. GCC wants structures to be 32 byte aligned without this change
>>>> DTB's after the first in the section may not be properly aligned so
>>>> the flat tree parsing code will fall over.
>>>>
>>>> Signed-off-by: Dirk Brandewie<dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>
>>> I don't think 32 is a universal number; it should depend on the ABI.  On
>>> x86, for one thing, I'm pretty sure that there is no particular
>>> alignment requirements beyond the natural alignment of the data items,
>>> for example.
>>>
>>> Although 32 is probably conservative on any platform, please flag the
>>> origin of this with a comment, or make it a constant defined in a header
>>> file... otherwise, if this breaks for whatever reason it'll be near
>>> impossible to find.
>>>
>>
>> I will change . = ALIGN(32); to STRUCT_ALIGN();
>>
>> from vmlinux.lds.h:
>> /*
>>   * Align to a 32 byte boundary equal to the
>>   * alignment gcc 4.5 uses for a struct
>>   */
>> #define STRUCT_ALIGN() . = ALIGN(32)
>
> I also think this is the wrong place to do this.  scripts/dtc is a
> mirror of copy of upstream dtc, designed for making dtb images for
> general purposes.  I think the alignment should instead go into the
> linker script fragments you generate to incbin the dtbs.
>

I was sleep deprived when I responded to HPA I thought he had replied to the 
patch modifying vmlinux.lds.h since we had talked about that file a fair amount. 
So my first response had little bearing on patch in question.

I am trying to solve two issues with this change.

The structure needs to be 32 byte aligned for the code in fdt.c to be able parse 
the blob.  You are right I can force this alignment in the assembly fragment.

The second issue is being able to parse the section in the kernel image to find 
each of the blobs that have been concatenated together.  If the DTB size is 
modulo 32 bytes I can use  blob = blob+be32_to_cpu(blob->totalsize) to find the 
next blob in the section and use that address directly to have fdt.c parse the 
blob.  Otherwise I would need to search for the signature of the next blob 
somewhere past the end of the current blob which is knid of messy IMHO.

I have two questions,
Do you think this acceptable if I made forcing the alignment a command line 
argument?

Where is the DTC git tree I should be delivering patches against?  is 
git://www.jdl.com/software/dtc.git the correct tree?

Thanks
--Dirk
