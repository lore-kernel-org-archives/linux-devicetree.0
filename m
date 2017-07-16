From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt: chosen property for kaslr-seed
Date: Sun, 16 Jul 2017 17:42:25 +0100
Message-ID: <CAKv+Gu82xiv0Yy79Hb=JCqmJNYoxxSt5HRu5j4TeSeznCvg_+w@mail.gmail.com>
References: <20170715003836.GA113132@beast> <CAKv+Gu9n0cpznPxiQPYj0_+DALXTdevbvoYgM87A7ej2kdcizA@mail.gmail.com>
 <CAGXu5j+fX-E9ngW3MBhRFgpKBLzpyhR0TCx=ovosXOAqogzMMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGXu5j+fX-E9ngW3MBhRFgpKBLzpyhR0TCx=ovosXOAqogzMMA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matt Redfearn <matt.redfearn-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 16 July 2017 at 03:13, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> On Sat, Jul 15, 2017 at 5:42 AM, Ard Biesheuvel
> <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> (+ Mark, Will, Catalin)
>>
>> On 15 July 2017 at 01:38, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>> Document then /chosen/kaslr-seed property (and its interaction with the
>>> EFI_RNG_PROTOCOL API).
>>>
>>> Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>> ---
>>>  Documentation/devicetree/bindings/chosen.txt | 22 ++++++++++++++++++++--
>>>  1 file changed, 20 insertions(+), 2 deletions(-)
>>>
>>
>> For the textual changes:
>>
>> Acked-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> *However*, documenting the /chosen/kaslr-seed property promotes it
>> from a stub<->kernel private interface to an external ABI between the
>> kernel and the bootloader, and we need to reach agreement on whether
>> doing so is desirable first IMHO.
>>
>
> Oh! I thought that was the point (having a bootloader provide kaslr
> entropy). And that in the EFI case, it was the stub doing it.
>

It was the opposite, actually,  The /chosen node is the most
appropriate way for the EFI stub to communicate a seed value to the
kernel proper, given how it is needed extremely early in the boot.
(Using UEFI config tables like we do for the /dev/random seed is not
possible for this)

So as a side effect, other bootloaders can use the same mechanism. I'm
fine with that, but it needs to be an explicit decision by the
maintainers imo.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
