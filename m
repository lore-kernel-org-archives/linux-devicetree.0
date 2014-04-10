From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/3] devcietree: bindings: add some MFD Keymile FPGAs
Date: Thu, 10 Apr 2014 10:06:29 -0500
Message-ID: <CAL_JsqLLD4fAuhDzdQPWNSbWj444kWESvsprMBFmStUF-QNTiQ@mail.gmail.com>
References: <1395754915-14534-1-git-send-email-valentin.longchamp@keymile.com>
	<1395754915-14534-3-git-send-email-valentin.longchamp@keymile.com>
	<1397004291.32034.327.camel@snotra.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397004291.32034.327.camel-88ow+0ZRuxG2UiBs7uKeOtHuzzzSOjJt@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 8, 2014 at 7:44 PM, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> On Tue, 2014-03-25 at 14:41 +0100, Valentin Longchamp wrote:
>> These are the bindings for 2 MFD devices used on some of the Keymile boards.
>> The first one is the chassis managmenet bfticu FPGA.
>> The second one is the board controller (reset, LEDs, GPIOs) QRIO CPDL.
>> These FPGAs are used in the kmcoge4 board.
>>
>> This patch also add KEYMILE to the vendor-prefixes.

You can drop the keymile addition. I have that queued up.

[snip]

>> +Required properties:
>> +- compatible: "keymile,bfticu"
>> +- interrupt-controller: the bfticu FPGA is an interrupt controller
>> +- interrupts: the main IRQ line to signal the collected IRQs
>> +- #interrupt-cells : is 2
>> +     - The 1st cell is the local IRQ number on the bfticu
>> +     - The 2nd cell is the type of the IRQ (IRQ_TYPE_xxx)
>
> Device tree bindings should not depend on the content of Linux headers.
> One is stable ABI, and the other isn't.
>
> If you want you can make the values the same for convenience, as is done
> by IPIC, CPM PIC, etc -- but the values need to be explicitly stated in
> the binding.  It'll still break if the Linux values change (so it may
> not be a good idea to try to keep the values the same), but at least the
> fix would be in Linux code rather than an ABI change.

You can simply refer to
Documentation/devicetree/bindings/interrupt-controller/interrupts.txt.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
