From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2] of/fdt: add kernel command line option for dtb_compat
	string
Date: Tue, 16 Nov 2010 22:59:04 -0700
Message-ID: <AANLkTi=sXgd0MxNiKJKOvMtE=s6yFVq6owifoOHXUhcO@mail.gmail.com>
References: <cover.1289877715.git.dirk.brandewie@gmail.com>
	<bdb6f333aea69accf3ca3e74c1f01da0a8587aee.1289877715.git.dirk.brandewie@gmail.com>
	<20101116063253.GB4074@angua.secretlab.ca> <4CE28C32.3020807@gmail.com>
	<AANLkTinwGh3HsLCfnfLLBHpu8UTy69JEYG17rkBn4nW4@mail.gmail.com>
	<4CE3346B.3000109@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4CE3346B.3000109-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Tue, Nov 16, 2010 at 6:48 PM, Dirk Brandewie
<dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 11/16/2010 04:12 PM, Grant Likely wrote:
>>
>> On Tue, Nov 16, 2010 at 6:50 AM, Dirk Brandewie
>> <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =A0wrote:
>>>
>>> On 11/15/2010 10:32 PM, Grant Likely wrote:
>>>>
>>>> On Mon, Nov 15, 2010 at 08:01:21PM -0800, dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>>>> wrote:
>>>>>
>>>>> +{
>>>>> + =A0 =A0 =A0 void *rc =3D NULL;
>>>>> + =A0 =A0 =A0 unsigned long root, size;
>>>>> + =A0 =A0 =A0 struct boot_param_header =A0*orig_initial_boot_params;
>>>>> + =A0 =A0 =A0 uint8_t *blob;
>>>>
>>>> blob should be a void* here. =A0It is never used as a uint8.
>>>>
>>>
>>> I used uint8_t prevent compiler warning when blob is compared to
>>> __dtb_end
>>>
>>
>> okay
>>
>>>>> +{
>>>>> + =A0 =A0 =A0 strncpy(dtb_compat_name, line, MAX_DTB_COMPAT_STR);
>>>>> + =A0 =A0 =A0 return 1;
>>>>> +}
>>>>
>>>> I don't remember getting a response about whether or not
>>>> of_find_compatible_dtb can be called directly from dtb_compat_setup.
>>>> Doing so would eliminate the arbitrary MAX_DTB_COMPAT_STR because
>>>> there would be no need to keep around a copy of dtb_compat_name. =A0It
>>>> also means that of_find_compatible_dtb() can be restricted to the file
>>>> scope.
>>>>
>>>> Is there a use-case for calling of_find_compatible_dtb() anywhere
>>>> other than in dtb_compat_setup?
>>>>
>>>
>>> The use case for having these functions exposed is allowing the platfrom
>>> code decide the policy for which dtb will be used in the case where a d=
tb
>>> might have been passed in by the boot loader. These functions can be us=
ed
>>> as
>>> a fallback if a dtb was not passed in or to override of the passed in d=
tb
>>> by
>>> the platform code.
>>
>> Still this all looks very generic, even across architectures. =A0I say
>> don't export the functions for now, and change it later if a use case
>> shows up that requires it. =A0I'd really rather not let platform code
>> muck about with it directly if there isn't a use case for it.
>
> I have the use case for it in my platform. =A0There will two ways that the
> kernel can get the DTB.
> 1. The blob is linked in and I go find the one for my platform. This is t=
he
> path that uses the two new functions.
>
> 2. The a pointer blob passed in (physical address) from the bootloader. T=
he
> blob is relocated/copied to keep the bootloader from having to know the
> kernel memory layout.
>
> One method will be able to override the other. =A0I am not sure what the
> precedence between the methods will be ATM.

ATM, let's assume that all platforms will use the same precedence
rules.  I really don't want to see arbitrary differences between
platforms in this regard.  Encode the behaviour fully into fdt.c.  If
the precedence rules end up being wrong, then it can be changed.  If
it turns out that different platforms really do need to have different
rules, then it can be exported at that time.

g.

>> However, thinking about it further. =A0You also need to make sure this
>> code is excluded for the powerpc and microblaze architectures because
>> the kernel command line is passed via the device tree blob in those
>> cases. =A0By that time it gets called, it is too late to switch the
>> device tree pointer.
>>
> if a "wrapped" kernel is booted doesn't it know exactly which dtb it shou=
ld
> be using?

Yes.  All of the current powerpc dt-wrappers only carry 1 dtb image
per wrapper, so the question of which dtb is moot.  However, powerpc
wrappers are firmware-interface specific, and their entire purpose in
life is to translate data from the firmware-specific interface into
the dtb representation.  Powerpc history has a number of oddball
firmware interfaces with no way to detect which one is being used.
Therefore, the wrapper has to be hand chosen for each legacy platform.

> These platforms would never go looking for the command line value
> even it it was passed in.

Correct.  On PowerPC the vmlinux entry point *requires* passing in a
device tree, so the command line value isn't useful.

g.


-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
