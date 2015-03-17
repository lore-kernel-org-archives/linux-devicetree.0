From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'"
 breaks console on tty0
Date: Tue, 17 Mar 2015 15:44:47 -0400
Message-ID: <5508842F.5090209@hurleysoftware.com>
References: <55070544.9010908@redhat.com>	<550717A0.3060603@hurleysoftware.com> <87r3sowk51.fsf@igel.home>	<5507758B.2060000@hurleysoftware.com> <87zj7bquwk.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <87zj7bquwk.fsf@igel.home>
Sender: stable-owner@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Grant Likely <grant.likely@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/17/2015 03:35 PM, Andreas Schwab wrote:
> Peter Hurley <peter@hurleysoftware.com> writes:
> 
>> It doesn't boot?
> 
> It boots right into user space, but the initrd doesn't like something
> (perhaps the missing console) and exits.  Note that the framebuffer
> console does work, but all I see are the penguins.
> 
> [    6.235604] Warning: unable to open an initial console.

Thanks, Andreas. I had figured out from your earlier email that your
specific breakage was the absence of any console.

Regards,
Peter Hurley
