From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'"
 breaks console on tty0
Date: Mon, 16 Mar 2015 20:46:20 -0400
Message-ID: <5507795C.2020009@hurleysoftware.com>
References: <55070544.9010908@redhat.com>	<550717A0.3060603@hurleysoftware.com> <87r3sowk51.fsf@igel.home>	<5507758B.2060000@hurleysoftware.com> <87ioe0wje7.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <87ioe0wje7.fsf@igel.home>
Sender: stable-owner@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Grant Likely <grant.likely@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/16/2015 08:35 PM, Andreas Schwab wrote:
> Peter Hurley <peter@hurleysoftware.com> writes:
> 
>> On 03/16/2015 08:19 PM, Andreas Schwab wrote:
>>> Peter Hurley <peter@hurleysoftware.com> writes:
>>>
>>>> I don't see this as a regression, but rather a misconfiguration.
>>>
>>> It breaks booting on PowerMac.
>>
>> It doesn't boot?
> 
> Yes.

Ok, thanks for the report.

Can you attach
1) your .dts
2) your .config
3) complete dmesg from 4.0-rc4 boot with that patch reverted?

Do you have a serial console hooked up?

Regards,
Peter Hurley
 
