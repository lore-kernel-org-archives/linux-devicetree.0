From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'"
 breaks console on tty0
Date: Tue, 17 Mar 2015 09:25:32 +0100
Message-ID: <5507E4FC.1060005@redhat.com>
References: <55070544.9010908@redhat.com>	<550717A0.3060603@hurleysoftware.com> <87r3sowk51.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <87r3sowk51.fsf@igel.home>
Sender: stable-owner@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>, Peter Hurley <peter@hurleysoftware.com>
Cc: Grant Likely <grant.likely@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 17-03-15 01:19, Andreas Schwab wrote:
> Peter Hurley <peter@hurleysoftware.com> writes:
>
>> I don't see this as a regression, but rather a misconfiguration.
>
> It breaks booting on PowerMac.

Actually that is more likely to be caused by:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/of?id=106937e8ccdcf0f4b95fbf0fe9abd42766cade33

Try reverting that one, also see:

http://www.spinics.net/lists/stable/msg82872.html

Note that if either if these patches are the culprit likely
your system is still booting you're just not getting any
messages on either video output (caused by the commit discussed
in this thread) nor on a serial console (caused by the 106937e8
commit). If you've a network interface which comes up automatically
try pinging it.

Regards,

Hans
