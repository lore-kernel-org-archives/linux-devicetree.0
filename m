From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Allwinner A64 MMC support
Date: Mon, 15 Feb 2016 22:58:08 +0800
Message-ID: <CAGb2v67apAN0H_Nz2kQ4oYjtRwRfaM0L3KTv6uXLfp7m7DpnbA@mail.gmail.com>
References: <1455300000-18723-1-git-send-email-andre.przywara@arm.com>
 <56BE29A1.3060107@redhat.com> <56C1A590.6030500@arm.com> <56C1C7BB.1040602@redhat.com>
 <56C1D9C0.6020601@arm.com> <CAGb2v65E54mnLEcPzLyycEBSHbvn6tp9JpS+S8gdbDg_e7qFyQ@mail.gmail.com>
 <56C1E250.9070301@arm.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBF6PQ63AKGQE6RCOL5Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <56C1E250.9070301-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 15, 2016 at 10:36 PM, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi Chen-Yu,
>
> On 15/02/16 14:23, Chen-Yu Tsai wrote:
>> On Mon, Feb 15, 2016 at 9:59 PM, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:
>>> Hi Hans,
>>>
>>> ....
>>>
>>>>
>>>> p.s.
>>>>
>>>> I love the work you've been doing on the A64, I've not had a chance
>>>> to try it out yet though. Have you made any progress with getting
>>>> the mmc slot to work ?  If not maybe I can make some time I've
>>>> prior experience in bringing up the mmc slot on other Allwinner SoCs
>>>
>>> Thanks for that!
>>>
>>> So we made some progress on the weekend (with the help of #linux-sunxi):
>>> 1) The regulator node was stupidly put by me into a separate child node
>>> without putting address and size cells into. So I just moved it into
>>> /soc directly now and that seems to fixed the missing regulator.
>>> 2) The reset node is a allwinner,sun6i-a31-ahb1-reset, which does not
>>> get registered automatically, but by an explicit call from mach-sunxi/.
>>> I wonder why we do this (yes, I saw that comment, but still...) and if
>>> it would work with a normal MODULE_DEVICE_TABLE() declaration.
>>> There is and will be no equivalent to the mach- directory on arm64.
>>
>> On sun6i, we supported the high resolution timer, which had a reset control.
>> Timers (or clocksources) are registered before device model kicks in, so the
>> reset had to be explicitly registered before the timer, or the system would
>> hang. I think we phased that out though. Maxime should know.
>
> Ah, thanks for that insight!
> So that sounds like we would get away with a normal registration for the
> A64 - and actually many other SoCs as well?
> Shall we guard the explicit sun6i_reset_init with MACH_SUN6I or
> something and do the normal registration otherwise?
> Or do I miss something here?

You'll notice 2 reset control compatibles, one is
"allwinner,sun6i-a31-ahb1-reset",
while the other is "allwinner,sun6i-a31-clock-reset". The latter is a
proper device
model driver. We also don't have the hstimer device node for later
SoCs. For A23, it
was because the hardware had only 1 timer, while the driver needed 2,
and I didn't
want to deal with it at the time.

As long as you use "allwinner,sun6i-a31-clock-reset", no special code is needed.

ChenYu

> Cheers,
> Andre
>
>>> 3) As Jens pointed out, the MMC IP block isn't really compatible.
>>> Changing the clocks is easy (done already), but we need to come up with
>>> code to cover the new phase setting registers in the A64 MMC register block.
>>>
>>> Interestingly somehow hacking this (pretending it is compatible) seems
>>> to work, though I got reports from people about mysterious kernel
>>> crashes, so I'm inclined to leave MMC out of the first patch series.
>>>
>>> So if you could take a look at the new registers (starting at offset
>>> 0x140) and work out what we actually need to do here, that would be
>>> great. I have no real clue about what they actually do and how they
>>> relate to the current output and sample clock phase.
>>> To me it looks like we might get away with just triggering the automatic
>>> calibration and the hardware does the rest for us - keep your fingers
>>> crossed ;-)
>>>
>>> Cheers,
>>> Andre.
>>>
>>> --
>>> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
>>> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>>> For more options, visit https://groups.google.com/d/optout.
>>
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
