From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with
 'stdout-path'" breaks console on tty0
Date: Tue, 17 Mar 2015 07:49:23 +0100
Message-ID: <CAMuHMdXNXJnz8ONH7t1ctSpQ-SNQNJrp+VSpR2yPEG2FKk8qMw@mail.gmail.com>
References: <55070544.9010908@redhat.com>
	<550717A0.3060603@hurleysoftware.com>
	<87r3sowk51.fsf@igel.home>
	<5507758B.2060000@hurleysoftware.com>
	<87ioe0wje7.fsf@igel.home>
	<5507795C.2020009@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <5507795C.2020009@hurleysoftware.com>
Sender: stable-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Hans de Goede <hdegoede@redhat.com>, Grant Likely <grant.likely@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 17, 2015 at 1:46 AM, Peter Hurley <peter@hurleysoftware.com> wrote:
> On 03/16/2015 08:35 PM, Andreas Schwab wrote:
>> Peter Hurley <peter@hurleysoftware.com> writes:
>>> On 03/16/2015 08:19 PM, Andreas Schwab wrote:
>>>> Peter Hurley <peter@hurleysoftware.com> writes:
>>>>> I don't see this as a regression, but rather a misconfiguration.
>>>>
>>>> It breaks booting on PowerMac.
>>>
>>> It doesn't boot?
>>
>> Yes.
>
> Ok, thanks for the report.
>
> Can you attach
> 1) your .dts

Note that this is a PowerMac, so there's no DTS, only a real DT passed by
the Firmware.

> Do you have a serial console hooked up?

Most probably, the chosen/stdout-path is provided automatically by the
firmware, even if no serial console is present. Andreas, is that correct?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
