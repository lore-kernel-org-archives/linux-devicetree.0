From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH] Documentation: dt: chosen property for kaslr-seed
Date: Mon, 17 Jul 2017 22:26:25 +0100
Message-ID: <CAKv+Gu96TFMhxXu4PG4EK=s3Y+uuGoWvGoA__WJjkhF1XR6q+g@mail.gmail.com>
References: <20170715003836.GA113132@beast> <20170717193258.zim7rjh2cfgb6t5e@rob-hp-laptop>
 <CAGXu5jJk7otP6VBde7cFdMBRgQQB_rQpCSi24tRmC9bMmfo5Jw@mail.gmail.com>
 <CAKv+Gu8X8d4HqVZOcusC2L9WzJNatBkAgtKONjzad9SgdsrFRA@mail.gmail.com> <CAL_JsqJ0d+DLYrpfNSXKhT=FZcWwxSSLPrUyT6N+D6RCFAcqOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJ0d+DLYrpfNSXKhT=FZcWwxSSLPrUyT6N+D6RCFAcqOQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Matt Redfearn <matt.redfearn@imgtec.com>
List-Id: devicetree@vger.kernel.org

On 17 July 2017 at 22:05, Rob Herring <robh@kernel.org> wrote:
> On Mon, Jul 17, 2017 at 3:22 PM, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>> On 17 July 2017 at 20:54, Kees Cook <keescook@chromium.org> wrote:
>>> On Mon, Jul 17, 2017 at 12:32 PM, Rob Herring <robh@kernel.org> wrote:
>>>> On Fri, Jul 14, 2017 at 05:38:36PM -0700, Kees Cook wrote:
>>>>> Document then /chosen/kaslr-seed property (and its interaction with the
>>>>
>>>> s/then/the/
>>>>
>>>>> EFI_RNG_PROTOCOL API).
>>>>
>>>> "dt-bindings: chosen: ..." for the subject.
>>>
>>> I'll send a v2 with these fixed and the Acks added.
>>>
>>>>> Signed-off-by: Kees Cook <keescook@chromium.org>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/chosen.txt | 22 ++++++++++++++++++++--
>>>>>  1 file changed, 20 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
>>>>> index dee3f5d9df26..0cdb43b268e5 100644
>>>>> --- a/Documentation/devicetree/bindings/chosen.txt
>>>>> +++ b/Documentation/devicetree/bindings/chosen.txt
>>>>> @@ -5,9 +5,27 @@ The chosen node does not represent a real device, but serves as a place
>>>>>  for passing data between firmware and the operating system, like boot
>>>>>  arguments. Data in the chosen node does not represent the hardware.
>>>>>
>>>>> +The following properties are recognized:
>>>>>
>>>>> -stdout-path property
>>>>> ---------------------
>>>>> +
>>>>> +kaslr-seed
>>>>> +-----------
>>>>
>>>> Is there some reason we would not feed this to other things needing
>>>> entropy and therefore should have a more generic name?
>>>
>>> I'll let Ard answer this better than me, but IIRC, he wanted a narrow use.
>>>
>>
>> The reason is that the seed is not used to feed a DRBG (because it is
>> way to early for that when we lay out the VA space), but different
>> slices of the u64 are used for randomizing different parts of the
>> address space, i.e., the top 16 bits are used to randomize the linear
>> region, bits 48 - 21 for the kernel itself, and the bits below that
>> for the module region. (The virtual kernel offset is randomized
>> further by the physical placement modulo 2 MB, but this is done by the
>> stub, which calls EFI_RNG_PROTOCOL itself so it does not use
>> /chosen/kaslr-seed)
>>
>> This means any use of this seed beyond its intended purpose may leak
>> information.
>
> Is having this value in /proc/device-tree/chosen/kaslr-seed a leak?

Yes

> Should the kernel remove it?
>

It already does.

>> For UEFI systems, we do pass a random seed via a UEFI configuration
>> table, but this is deliberately kept separate (and uses a UEFI
>> specific interface, which seemed more appropriate)
>
> So if we wanted a seed for non-UEFI systems, we should define a
> separate property?
>

Yes. This was being discussed a while ago, though, and IIRC the
preferred method was to pass a physical memory address containing the
seed instead, since it would be compatible with bootloaders that are
not capable of manipulating the DT

Some of the discussion here:
https://patchwork.kernel.org/patch/9197865/


>>>>> +This property is used when booting with CONFIG_RANDOMIZE_BASE to seed
>>>>> +the entropy used to randomize the kernel image base address location. It
>>>>> +is parsed as a u64 value, e.g.
>>>>
>>>> Why limit the size to 64-bit and why does it matter how the data is
>>>> interpretted?
>>>
>>> IIRC, u64 is sufficient. (And note I'm just documenting what exists...)
>>>
>>
>> See above. Seeding a DRBG typically requires more than that, but for
>> KASLR it is sufficient.
>>
>>>>> +
>>>>> +/ {
>>>>> +     chosen {
>>>>> +             kaslr-seed = <0xfeedbeef 0xc0def00d>;
>>>>> +     };
>>>>> +};
>>>>> +
>>>>> +Note that when booting through EFI when EFI_RNG_PROTOCOL is supported,
>>>>> +this value will be overwritten by the EFI stub.
>>>>
>>>> Isn't this always true? The bootloader will overwrite. Just in the EFI
>>>> case, the EFI stub is part of the bootloader from a functional (and not
>>>> packaging) standpoint.
>>>
>>> I thought it best to call this out so that no one could get confused
>>> if they wanted to understand how to use kaslr-seed with an EFI system.
>>> (i.e. just implement EFI_RNG_PROTOCOL instead.)
>>>
>>
>> Well, I guess the point being made is that setting this property from
>> UEFI (or u-boot in EFI mode) is pointless is EFI_RNG_PROTOCOL is
>> implemented as well.
>
> Okay.
>
> Rob
