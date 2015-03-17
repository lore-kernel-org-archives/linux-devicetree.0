From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'" breaks console on tty0
Date: Tue, 17 Mar 2015 01:35:28 +0100
Message-ID: <87ioe0wje7.fsf@igel.home>
References: <55070544.9010908@redhat.com>
	<550717A0.3060603@hurleysoftware.com> <87r3sowk51.fsf@igel.home>
	<5507758B.2060000@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <5507758B.2060000@hurleysoftware.com> (Peter Hurley's message of
	"Mon, 16 Mar 2015 20:30:03 -0400")
Sender: stable-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Grant Likely <grant.likely@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Peter Hurley <peter@hurleysoftware.com> writes:

> On 03/16/2015 08:19 PM, Andreas Schwab wrote:
>> Peter Hurley <peter@hurleysoftware.com> writes:
>> 
>>> I don't see this as a regression, but rather a misconfiguration.
>> 
>> It breaks booting on PowerMac.
>
> It doesn't boot?

Yes.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
