From: Kamlakant Patel <kamlakant.patel@broadcom.com>
Subject: Re: [PATCH 0/4] mtd: nand: Add support for Evatronix NANDFLASH-CTRL
Date: Mon, 6 Jun 2016 16:32:06 +0530
Message-ID: <CAB=aS0OZ493Smov2E41G1iChi9gEOV5j0Gf8=SS_CbhXZjmw5g@mail.gmail.com>
References: <alpine.DEB.2.02.1606020944180.19416@lnxricardw1.se.axis.com>
	<20160602180059.11928d40@bbrezillon>
	<alpine.DEB.2.02.1606060742210.23377@lnxricardw1.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1606060742210.23377@lnxricardw1.se.axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, Linux mtd <linux-mtd@lists.infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 6, 2016 at 11:17 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> On Thu, 2 Jun 2016, Boris Brezillon wrote:
>
>> Hi Ricard,
>>
>> I was not in Cc of this series, so you're either developing an old
>> kernel version, or you didn't check the MAINTAINERS file (or didn't run
>> get_maintainer.pl on your series).
>
> The patch is intended to apply to the mtd l2 tree, and I did check
> MAINTAINERS, however, for whatever reason I failed to notice that the NAND
> flash subsystem has its own entry (going for the general MTD entry), so
> both you and Richard got left off the CC list. Sorry about that. I'll
> rectify it on subsequent patch submissions.
>
>> And please, next time make sure patches 1 to X are sent in replies to
>> your cover letter.
>
> Ok. Will do.
>
>> I'll to review the driver soon.
>
> Much appreciated.

Hi Ricard,

I am using the previous version of your patch on Netlogic XLP MIPS64
platform with some cleanups, some of them are mentioned by Borris.
I can send you the patch if you would like to integrate it.

Thanks,
 Kamlakant Patel
