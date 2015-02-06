From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: mvebu: add ethernet to the cm-a510 board
Date: Fri, 06 Feb 2015 11:00:30 +0100
Message-ID: <54D490BE.9040201@gmail.com>
References: <E1YH5bU-0005mG-3L@bombadil.infradead.org> <54CB5267.5060004@gmail.com> <20150130113118.5523ed68@armhf> <54CB6440.1010002@gmail.com> <20150130124144.501cf81d@armhf> <54CB732F.7010409@gmail.com> <20150130133913.083d1ade@armhf> <54CB7E33.3080909@gmail.com> <54CE354F.5090106@gmail.com> <54D3EB26.9020909@gmail.com> <54D48711.8060903@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54D48711.8060903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriel Dobato <dobatog-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06.02.2015 10:19, Gabriel Dobato wrote:
> On 05/02/15 23:13, Sebastian Hesselbarth wrote:
>> great you can boot a recent kernel. I guess you had to quite heavily
>> modify current dove-cm-a510.dts? Can you upload the one you use now
>> to any pastebin and send the link?
>
> Not, I only had to include eth (as Mr. Moine told me) and mdio because I
> mount rootfs via NFS.

Ok, I think we can work out the most obvious stuff (mmc, pcie), too.

>> You didn't mention if you really use the sb-a510, i.e. the Compulab
>> reference baseboard. Is it what you are using with your cm-a510?
>
> Yes, sorry for that, I am using SB-A510.

Ok. Then for the first some versions, I'll stick with the manual.
That should be sufficient to create a working sb-a510 dts.

FWIW, is there any Compulab kernel or u-boot source available online?
It would help to figure out the GPIO pins and undocumented connections.

> I wonder if it will there be driver support for the second ethernet
> (PCIE attached NIC), and the rest of features remained, for DT...

AFAIR it was some realtek PCIe NIC.. we have PCIe working on Dove, so
I guess it shouldn't be a real problem.

> Before using DT, I tried to boot a simple uImage (without DT), but it
> did not boot
>
> the last ouput in the kernel trade was:
> ...
> /uncompressing linux... done, booting the kernel./
>
> nothing else.... I wonder if there is a problem with the ID machine, I
> don't know...

Hard to tell. Could be anything.

> The U-Boot used was the one provided by Compulab (Maybe the problem is
> on Uboot...)

If you know how to append the dtb to the zImage it should work on any
u-boot. If it doesn't support bootz, you'll have to make a uImage of
the dtb-appended zImage or simply try to "go" to the zImage address.

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
