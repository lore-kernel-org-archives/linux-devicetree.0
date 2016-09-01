From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 3/7] dts: sun8i-h3: add i2c0/i2c1 SoC peripherals
Date: Thu, 1 Sep 2016 14:42:41 +0800
Message-ID: <CAGb2v66tW+F_aitXUkxTtwzfkijAwAP+OqC1gGQi6JgZN0w-2A@mail.gmail.com>
References: <1472671858-29220-1-git-send-email-jorik@kippendief.biz>
 <1472671858-29220-4-git-send-email-jorik@kippendief.biz> <CAGb2v66c8uFHUtVtHOZCfxDEEgG7CzZgBRKWMUQS7NTizF6jyQ@mail.gmail.com>
 <CAKqGPHwBqWn05SQqEPUQiwxi=WyBJ2LFto2Ucbh8w=Eqe49eTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKqGPHwBqWn05SQqEPUQiwxi=WyBJ2LFto2Ucbh8w=Eqe49eTA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 1, 2016 at 2:31 PM, Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org> wrote:
> Hi,
>
> A bit tricky to reply to two mails in one, as I think my reply relates to
> both, but here it goes.
>
> On 1 September 2016 at 04:42, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>>
>> On Thu, Sep 1, 2016 at 3:30 AM,  <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org> wrote:
>> > From: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
>> >
>> > This enables the i2c0/i2c1 peripherals of the SoC. There is actually a
>> > third
>> > controller, but I do not have a board on hands on which i2c2 is exposed
>> > in such
>> > a way that I can verify that it works.
>>
>> If they are listed in the manual, and the interrupts, clocks, resets, pins
>> all exist, that is good enough for me.
>
>
> That sounds sensible, I will do that in v3.
>
>> These pinmuxes are the only ones possible for each peripheral.
>> Please drop the _a suffix and the @0 address for both of them.
>
> Agreed. But: I think the same goes for UARTs 0-3, of which 0-1 have a pinmux
> following the _a / @0 syntax in current kernel. There are not really options
> here, except leaving out RTS/CTS on uarts1-3, which one could do in a
> board-specific pinmux.

That would work. You could also do the RTS/CTS pins and call them
"uartX_rts_cts_pins: uartX-rts-cts { ... }". Of course doing all these
is dependent on some board actually using them. Let's see what Maxime
has to say about your other patches. :)

> Moreover, I could put all the pinmux-peripheral associations for H3 in the
> DTSI, removing them from the DTS files (including already existing), as the
> associations themselves are not really board specific, right?

I've done so for a few peripherals, such as RSB and IR, where there are
only 1 set of pins that make sense. For 2/4/8 pin UARTs, MMC, LCDs, etc,
I wouldn't do it.

ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
