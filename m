From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'" breaks console on tty0
Date: Tue, 17 Mar 2015 23:26:52 +0100
Message-ID: <87vbhzqmz7.fsf@igel.home>
References: <55070544.9010908@redhat.com>
	<550717A0.3060603@hurleysoftware.com> <87r3sowk51.fsf@igel.home>
	<5507758B.2060000@hurleysoftware.com> <87zj7bquwk.fsf@igel.home>
	<5508842F.5090209@hurleysoftware.com>
	<55088B23.8030108@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <55088B23.8030108@hurleysoftware.com> (Peter Hurley's message of
	"Tue, 17 Mar 2015 16:14:27 -0400")
Sender: stable-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Grant Likely <grant.likely@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Peter Hurley <peter@hurleysoftware.com> writes:

> Would you share what the actual prom stdout string value is?
> (linux,stdout-path is equivalent)

You mean the contents of chosen/linux,stdout-path?

"/pci@0,f0000000/NVDA,Parent@10/NVDA,Display-B@1"

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
