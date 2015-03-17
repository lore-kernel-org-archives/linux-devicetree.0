From: Leif Lindholm <leif.lindholm@linaro.org>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with
 'stdout-path'" breaks console on tty0
Date: Tue, 17 Mar 2015 10:09:17 +0000
Message-ID: <20150317100917.GM4278@bivouac.eciton.net>
References: <55070544.9010908@redhat.com>
 <550717A0.3060603@hurleysoftware.com>
 <87r3sowk51.fsf@igel.home>
 <5507E4FC.1060005@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5507E4FC.1060005@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Andreas Schwab <schwab@linux-m68k.org>
Cc: Peter Hurley <peter@hurleysoftware.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 17, 2015 at 09:25:32AM +0100, Hans de Goede wrote:
> On 17-03-15 01:19, Andreas Schwab wrote:
> >Peter Hurley <peter@hurleysoftware.com> writes:
> >
> >>I don't see this as a regression, but rather a misconfiguration.
> >
> >It breaks booting on PowerMac.
> 
> Actually that is more likely to be caused by:
> 
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/of?id=106937e8ccdcf0f4b95fbf0fe9abd42766cade33

If so, I would appreciate a test of my proposed fix:
http://www.spinics.net/lists/stable/msg82878.html

Regards,

Leif
