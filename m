From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/7] mtd: brcmnand: add bcma driver
Date: Wed, 20 May 2015 08:39:06 +0200
Message-ID: <CACna6rzBn3yzzER56aAmk+VPNiMh9ikA3B1YZmMesF=3DWdq+A@mail.gmail.com>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
	<1431877266-28566-6-git-send-email-hauke@hauke-m.de>
	<20150520003402.GC11598@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150520003402.GC11598@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 20 May 2015 at 02:34, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sun, May 17, 2015 at 05:41:04PM +0200, Hauke Mehrtens wrote:
>> This driver registers at the bcma bus and drives the NAND core if it
>> was found on this bus. The bcma bus with this NAND core is used on the
>> bcm53xx and bcm47xx Northstar SoC with ARM CPU cores. The memory ranges
>> are automatically detected by bcma and the irq numbers read from device
>> tree by bcma bus driver.
>
> If you're going to use device tree for part of it (IRQs) why not the
> whole thing?
>
>> This is based on the iproc driver.
>
> This looks like you could probably get by with just using iproc_nand.c
> as-is. The main NAND core is apparently MMIO-accessible on your chips,
> so aren't the BCMA bits you're touching also?

That's right, in case of SoCs cores are MMIO-accessible, however I see
few reasons for writing this driver as bcma based:
1) MMIO access isn't available for bcma bus /hosted/ on PCIe devices.
By using bcma layer we write generic drivers.
2) bcma detects cores and their MMIO addresses automatically, if we
are a bit lazy, it's easier to use it rather than keep hardcoding all
addresses
3) There are some dependencies in cores initialization, e.g.
ChipCommon core usually has to be initialized first
4) bcma provides some helpers like bcma_core_enable so we don't have
to duplicate it in driver code

That said, I'm for using bcma layer, even if there is some small DT
involvement already.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
