From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'" breaks console on tty0
Date: Tue, 17 Mar 2015 19:27:17 +0100
Message-ID: <87bnjrscmy.fsf@igel.home>
References: <55070544.9010908@redhat.com>
	<550717A0.3060603@hurleysoftware.com> <87r3sowk51.fsf@igel.home>
	<5507758B.2060000@hurleysoftware.com> <87ioe0wje7.fsf@igel.home>
	<5507795C.2020009@hurleysoftware.com>
	<CAMuHMdXNXJnz8ONH7t1ctSpQ-SNQNJrp+VSpR2yPEG2FKk8qMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXNXJnz8ONH7t1ctSpQ-SNQNJrp+VSpR2yPEG2FKk8qMw@mail.gmail.com>
	(Geert Uytterhoeven's message of "Tue, 17 Mar 2015 07:49:23 +0100")
Sender: stable-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Peter Hurley <peter@hurleysoftware.com>, Hans de Goede <hdegoede@redhat.com>, Grant Likely <grant.likely@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Most probably, the chosen/stdout-path is provided automatically by the
> firmware, even if no serial console is present. Andreas, is that correct?

There is only chosen/linux,stdout-path, pointing to the display device.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
