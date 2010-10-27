From: "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [sodaville] [RFC] [PATCH] Adding DTB to architecture	independent
	vmlinux
Date: Wed, 27 Oct 2010 10:27:11 -0700
Message-ID: <4CC860EF.6060503@linux.intel.com>
References: <4CC6E491.7060304@gmail.com>
	<20101027110937.GD7822@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101027110937.GD7822-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/27/2010 4:09 AM, Grant Likely wrote:
> On Tue, Oct 26, 2010 at 07:24:17AM -0700, Dirk Brandewie wrote:
>> Hi All,
>>
>> I am working on working on adding support device tree support to an
>> x86 based platform, hpa pointed out that the device tree blob is
>> architecture independent and should be part of the generic kernel.
>>
>> The patch below is a first cut at adding dtb support to the architecture
>> independent kernel and adding a generic dts->dtb build rule.
>>
>> This has only been tested on x86.
>>
>> Comments/suggestions gratefully accepted.
>>
>> --Dirk
>>
>> of: add support for linking platform dtb into vmlinux
>>
>> From: Dirk Brandewie<dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> This patch adds support for linking a device tree blob into
>> vmlinux. The platform DTB to be built and linked into the kernel is
>> specified by passing PLATFORM_DTB=<platform name>  to make.
>
> I don't think it is worth trying to do this in a cross-architecture
> way.  The powerpc zImage wrappers are already very platform-specific
> code, and there are no assumptions made about how a dtb image is
> linked into the wrapper.  A wrapper could even link in multiple dtb
> images.
>
> For the x86 code, linking the dtb into the vmlinux itself is not
> something that is desired without the option of selecting it between
> multiple linked-in dtb files if firmware doesn't pass one in for you.
> This will require some discussion about how best to manage dtbs before
> merging a patch like this.
>

I have to disagree, strongly, that it is not worth doing a 
cross-architectural patch.  There is nothing that prevents an 
architecture from having any number of different ones *in addition to* 
the independent way, but that would clearly establish a baseline that 
everyone can benefit from.  This is a Very Good Thing[TM].  We already 
have too many gratuitous differences between architectures in Linux.

As far as linking in multiple dtbs, the one architecture-independent way 
we have to pass data into the kernel is the kernel command line, and it 
might make sense to have a command line parameter like "dtb=foo", 
although I expect the vast majority of all users who don't rely on the 
firmware/bootloader to feed them information are going to have one 
kernel image per platform anyway, just for space reasons.

	-hpa
