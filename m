From: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] of/fdt: add kernel command line option for dtb_compat
	string
Date: Tue, 16 Nov 2010 17:48:27 -0800
Message-ID: <4CE3346B.3000109@gmail.com>
References: <cover.1289877715.git.dirk.brandewie@gmail.com>
	<bdb6f333aea69accf3ca3e74c1f01da0a8587aee.1289877715.git.dirk.brandewie@gmail.com>
	<20101116063253.GB4074@angua.secretlab.ca>
	<4CE28C32.3020807@gmail.com>
	<AANLkTinwGh3HsLCfnfLLBHpu8UTy69JEYG17rkBn4nW4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTinwGh3HsLCfnfLLBHpu8UTy69JEYG17rkBn4nW4-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/16/2010 04:12 PM, Grant Likely wrote:
> On Tue, Nov 16, 2010 at 6:50 AM, Dirk Brandewie
> <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  wrote:
>> On 11/15/2010 10:32 PM, Grant Likely wrote:
>>>
>>> On Mon, Nov 15, 2010 at 08:01:21PM -0800, dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>>>> +{
>>>> +       void *rc = NULL;
>>>> +       unsigned long root, size;
>>>> +       struct boot_param_header  *orig_initial_boot_params;
>>>> +       uint8_t *blob;
>>>
>>> blob should be a void* here.  It is never used as a uint8.
>>>
>>
>> I used uint8_t prevent compiler warning when blob is compared to __dtb_end
>>
>
> okay
>
>>>> +{
>>>> +       strncpy(dtb_compat_name, line, MAX_DTB_COMPAT_STR);
>>>> +       return 1;
>>>> +}
>>>
>>> I don't remember getting a response about whether or not
>>> of_find_compatible_dtb can be called directly from dtb_compat_setup.
>>> Doing so would eliminate the arbitrary MAX_DTB_COMPAT_STR because
>>> there would be no need to keep around a copy of dtb_compat_name.  It
>>> also means that of_find_compatible_dtb() can be restricted to the file
>>> scope.
>>>
>>> Is there a use-case for calling of_find_compatible_dtb() anywhere
>>> other than in dtb_compat_setup?
>>>
>>
>> The use case for having these functions exposed is allowing the platfrom
>> code decide the policy for which dtb will be used in the case where a dtb
>> might have been passed in by the boot loader. These functions can be used as
>> a fallback if a dtb was not passed in or to override of the passed in dtb by
>> the platform code.
>
> Still this all looks very generic, even across architectures.  I say
> don't export the functions for now, and change it later if a use case
> shows up that requires it.  I'd really rather not let platform code
> muck about with it directly if there isn't a use case for it.

I have the use case for it in my platform.  There will two ways that the kernel 
can get the DTB.
1. The blob is linked in and I go find the one for my platform. This is the path 
that uses the two new functions.

2. The a pointer blob passed in (physical address) from the bootloader. The blob 
is relocated/copied to keep the bootloader from having to know the kernel memory 
layout.

One method will be able to override the other.  I am not sure what the 
precedence between the methods will be ATM.

>
> However, thinking about it further.  You also need to make sure this
> code is excluded for the powerpc and microblaze architectures because
> the kernel command line is passed via the device tree blob in those
> cases.  By that time it gets called, it is too late to switch the
> device tree pointer.
>
if a "wrapped" kernel is booted doesn't it know exactly which dtb it should be 
using?  These platforms would never go looking for the command line value even 
it it was passed in.

> g.
