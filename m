From: "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [sodaville] [PATCH 2/4] of: Add support for linking device tree
	blobs into vmlinux
Date: Mon, 15 Nov 2010 13:27:32 -0800
Message-ID: <4CE1A5C4.5090200@linux.intel.com>
References: <cover.1289520079.git.dirk.brandewie@gmail.com>	<7d0a9d70f1616340115c187547006c76b0135ca7.1289520079.git.dirk.brandewie@gmail.com>	<20101114052525.GC2355@angua.secretlab.ca>
	<4CE161AE.4030103@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4CE161AE.4030103-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/15/2010 08:37 AM, Dirk Brandewie wrote:
>>
>> To match other definitions in this file, this should be defined with
>> parentheses: #define KERNEL_DTB()
>>
>>> +	. = ALIGN(32);							\
>>> +	VMLINUX_SYMBOL(__dtb_start) = .;				\
>>> +	*(.dtb)			       					\
>>
>> I wonder if .meminit.rodata.dtb be a better section name.  Could use
>> some input from more experienced kernel hackers here.  hpa, what say
>> you?
> 
> I will use what ever name seems reasonable,  It turns out that the sections that 
> are named *.init.rodata are really in a R/W section :-( so that name is really a 
> misnomer.  I will check with HPA on name again.
> 

I think they should be named *rodata* just to indicate that they should
eventually be moved to a readonly section.

	-hpa
