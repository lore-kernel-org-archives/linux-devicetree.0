From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 03/10] mtd: nand: add NAND driver for Broadcom STB NAND controller
Date: Fri, 08 May 2015 10:19:06 +0200
Message-ID: <5461819.J0QLFmC4Wg@wuerfel>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com> <2668469.V5VmYNtzFN@wuerfel> <20150508020113.GY32500@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150508020113.GY32500@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Dan Ehrenberg <dehrenberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 07 May 2015 19:01:13 Brian Norris wrote:
> 
> Would this satisfy you?
> 
> From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date: Tue, 5 May 2015 17:46:42 -0700
> Subject: [PATCH] mtd: brcmstb_nand: fixup endianness assumptions
> 
> All users of this controller (MIPS or ARM) have previously used native
> I/O (__raw{read,write}l()) to access registers. This is normal for the
> MIPS case, where BMIPS chips often have a boot-strap that configures not
> only the CPU, but also all the busing, to use a given endianness.
> However, newer ARM cores support switching to big endian mode at
> runtime, which would leave us with different bus and CPU endianness. For
> these cases, we should use the endian-switching accessors, so we
> continue to access the NAND core in little endian mode.
> 
> Suggested by Arnd.
> 
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> 

Yes, looks good, thanks!

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
