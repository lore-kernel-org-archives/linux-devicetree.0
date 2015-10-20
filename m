From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Using CONFIG_ARM_APPENDED_DTB with multiple device trees
Date: Tue, 20 Oct 2015 10:11:30 +0200
Message-ID: <15278051.o7VntWNuSM@wuerfel>
References: <fce90e91fe3c452b80bcd2113f267003@svr-chch-ex1.atlnz.lc> <20151020040445.GA4478@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151020040445.GA4478-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 20 October 2015 06:04:45 Andrew Lunn wrote:
> On Tue, Oct 20, 2015 at 03:27:15AM +0000, Chris Packham wrote:
> > Hi,
> > 
> > We currently have several boards based around the 88f6281 (kirkwood) ARM 
> > CPU.
> > 
> > The boards all share a kernel image (currently 3.16 based but we're in 
> > the process of moving to 4.3). We use the machine id (and some other 
> > eeprom type information) to distinguish the boards.
> > 
> > We'd like to move to a device tree based model but we're restricted in 
> > that updating the bootloaders to a DT-aware u-boot is impractical. 
> > CONFIG_ARM_APPENDED_DTB allows us to append a device tree but we still 
> > need to account for the differences between the boards.
> 
> Hi Chris
> 
> You might want to look at what Debian does. When installing the
> kernel, it appends the correct DT blob depending on what the current
> running kernel is, to the new kernel image before writing it to the
> boot medium.
> 
> Another option is the pxa-impedance-matcher.
> 

Right, pxa-impedance-matcher is indeed meant to solve this. We intentionally
do not support CONFIG_ARM_APPENDED_DTB with multiple DT files so we get
people to eventually update their boot loaders to a version that
understands DT.

For modern systems, the part of the boot loader that knows about the
machine ID also knows about the DT.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
