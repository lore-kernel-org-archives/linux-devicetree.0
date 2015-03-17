From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'" breaks console on tty0
Date: Tue, 17 Mar 2015 20:06:20 +0100
Message-ID: <877fufsatv.fsf@igel.home>
References: <55070544.9010908@redhat.com>
	<550717A0.3060603@hurleysoftware.com> <87r3sowk51.fsf@igel.home>
	<5507E4FC.1060005@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <5507E4FC.1060005@redhat.com> (Hans de Goede's message of "Tue,
	17 Mar 2015 09:25:32 +0100")
Sender: stable-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Peter Hurley <peter@hurleysoftware.com>, Grant Likely <grant.likely@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hans de Goede <hdegoede@redhat.com> writes:

> Actually that is more likely to be caused by:
>
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/of?id=106937e8ccdcf0f4b95fbf0fe9abd42766cade33
>
> Try reverting that one, also see:

That doesn't help.

> Note that if either if these patches are the culprit likely
> your system is still booting you're just not getting any
> messages on either video output

No, it is panicking.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
