From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH RFC RFT 0/2] ARM: Kirkwood: Synology DT files
Date: Fri, 10 Jan 2014 14:58:41 +0000
Message-ID: <20140110145841.GF15937@n2100.arm.linux.org.uk>
References: <1389052027-16819-1-git-send-email-andrew@lunn.ch> <52CE312B.3060108@killerwolves.net> <20140109165557.GB9681@lunn.ch> <52CF4652.3030207@killerwolves.net> <20140110112846.GG27432@n2100.arm.linux.org.uk> <52CFFF07.5080806@killerwolves.net> <20140110142548.GG9681@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140110142548.GG9681-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 10, 2014 at 03:25:48PM +0100, Andrew Lunn wrote:
> On Sat, Jan 11, 2014 at 12:09:11AM +1000, Ben Peddell wrote:
> > Bytes transferred = 1954736 (1dd3b0 hex)
> > Marvell>> setenv bootargs console=ttyS0,115200 ip=off initrd=0x00800040,0x0013FFC0 root=/dev/md0 rw syno_hw_version=DS211j ihd_num=2 netif_num=1 earlyprintk
> 
> I don't see you loading the initrd into RAM at 0x0080 0000.

However, the kernel _is_ being told that the initrd is at 0x00800040.

> > Uncompressing Linux... done, booting the kernel.
> > [    0.000000] Booting Linux on physical CPU 0x0
> > [    0.000000] Linux version 3.13.0-rc7-ds211j+ (root@lurch) (gcc version 4.8.2 (Gentoo 4.8.2 p1.3, pie-0.5.8) ) #2 Thu Jan 9 08:52:24 EST 2014
> > [    0.000000] CPU: Feroceon 88FR131 [56251311] revision 1 (ARMv5TE), cr=00053977
> > [    0.000000] CPU: VIVT data cache, VIVT instruction cache
> > [    0.000000] Machine model: Synology DS210 v10, v20, v30, DS211j
> > [    0.000000] bootconsole [earlycon0] enabled
> > [    0.000000] INITRD: 0xf8280040+0x000f993c is not a memory region - disabling initrd
> 
> The kernel is correct. There is no RAM here. That is in the IOMEM
> space.

But here the kernel has ignored the command line parameter and instead
used the one passed via DT.  That is not correct - command line parameters
must always override ATAGs or DT.

(That's irrespective of whether what's actually being asked of the kernel
is correct or not - the principle here applies that command line parameters
override, and in this case they aren't.)

-- 
FTTC broadband for 0.8mile line: 5.8Mbps down 500kbps up.  Estimation
in database were 13.1 to 19Mbit for a good line, about 7.5+ for a bad.
Estimate before purchase was "up to 13.2Mbit".
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
