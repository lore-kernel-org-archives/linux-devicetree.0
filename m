From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] dt-bindings: at24/eeprom: add an undocumented compatible string
Date: Fri, 8 Dec 2017 14:54:20 +0100
Message-ID: <CABxcv=kreuQNZdpzTYoR902+V9g8yQnk4VBVExqrC62=mkcGxA@mail.gmail.com>
References: <20171206101219.14011-1-brgl@bgdev.pl> <20171207225045.tm3rnyjaylx46nxy@rob-hp-laptop>
 <CABxcv=mRfYTs0YPvFg5_T+PVdjnK2BgXe-_b6MVQ=UkSWrV6xw@mail.gmail.com> <CAMRc=Mfr0DxNnCd=XycxNk647QX9bUODRY37bFdWrRSZQ_Ap3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMRc=Mfr0DxNnCd=XycxNk647QX9bUODRY37bFdWrRSZQ_Ap3A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa@the-dreams.de>, Divagar Mohandass <divagar.mohandass@intel.com>, David Lechner <david@lechnology.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 8, 2017 at 2:10 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 2017-12-08 1:03 GMT+01:00 Javier Martinez Canillas <javier@dowhile0.org>:
>> Hello Rob and Bartosz,
>>
>> On Thu, Dec 7, 2017 at 11:50 PM, Rob Herring <robh@kernel.org> wrote:
>>> On Wed, Dec 06, 2017 at 11:12:19AM +0100, Bartosz Golaszewski wrote:
>>>> The "atmel,sdp" compatible is reported by checkpatch as undocumented.
>>>>
>>>> Add it to the device tree bindings document for at24.
>>>>
>>>> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>>>> ---
>>>>  Documentation/devicetree/bindings/eeprom/eeprom.txt | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
>> My understanding is that DT bindings not necessarily have to list all
>> the possible compatible strings but can also document a set
>> comprehension of the possible values. If that's the case, then I
>> disagree with this patch and I think that this is caused by a
>> checkpatch limitation.
>>
>> In the case of the Atmel EEPROM DT binding, it was quite lax at
>> describing the possible compatible strings. It just used to say:
>>
>> - compatible : should be "<manufacturer>,<type>", like these:
>>
>> Followed by a list of _possible_ compatible strings. So these were
>> just examples, it was by no means a comprehensive list.
>>
>
> I couldn't find any info on that policy, but I would prefer as the
> maintainer that this change and that we list all the compatibles in
> the bindings explicitly.
>
>> And then it used to say:
>>
>> If there is no specific driver for <manufacturer>, a generic driver
>> based on <type> is selected. Possible types are:
>> "24c00", "24c01", "24c02", "24c04", "24c08", "24c16", "24c32",
>> "24c64", "24c128", "24c256", "24c512", "24c1024", "spd"
>>
>> Which basically said that it was valid to only match using the device
>> model but not the vendor part of the compatible string. This is
>> obviously incorrect and only worked due a implementation detail in the
>> I2C core.
>>
>
> Indeed.
>
>> After some discussions, the DT binding was changed to say the following:
>>
>> If there is no specific driver for <manufacturer>, a generic device
>> with <type> and manufacturer "atmel" should be used. Possible types
>> are:
>> "24c00", "24c01", "24c02", "24c04", "24c08", "24c16", "24c32",
>> "24c64", "24c128", "24c256", "24c512", "24c1024", "spd"
>>
>
> This basically says the same as the first part of the list of compatibles above.
>

Not the same, but I understand your point. I'm OK to kill the first
part of the DT binding that mentions the per-manufacturer compatible
strings.

>> And the driver changed accordingly to honor these. Old DTBs just using
>> "24c08" or "microchip,24c08" should still work, but the correct thing
>> to do now is to use "atmel,24c08".
>>
>
> Maybe we could start converting all the incorrect compatibles? I only
> found 19 occurrences in the tree.
>

I posted patches for all of the mainline occurrences (I believe only 2
DTS patches weren't merged). But instead of just replacing, I kept the
old DTB and added a generic one, i.e:

-               compatible = "microchip,24c02";
+               compatible = "microchip,24c02", "atmel,24c02";

I was told to do that way so it matches using the generic one but the
more specific compatible could still be used if there's need to handle
per manufacturer differences in the future (although I believe it
never will).

>> The "spd" <type> is in the list mentioned above, so the "atmel,spd"
>> isn't documented as the $SUBJECT commit message says. In any case,
>> what could be done is to instead reword the DT binding to list all the
>> valid "atmel,<type>" combinations.
>>
>
> Yes, I believe this is correct. I'd like to just list all the accepted
> compatibles and possibly mention the fact that old, incorrect
> compatible strings still work, but will not be accepted anymore in the
> tree.
>

Sounds good to me.

>> I didn't do that in my patch since it originally said "Possibles types
>> are", not "all the possible types are" so it wasn't clear to me if
>> there were other undocumented <types> that were still valid.
>>
>
> I'll send a new patch.
>
> Thanks,
> Bartosz

Best regards,
Javier
