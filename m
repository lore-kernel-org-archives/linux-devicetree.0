From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/1] arm: Fix unavailable MTD userland devices on Excito
 B3 boards
Date: Sat, 7 Feb 2015 21:25:51 +0100
Message-ID: <20150207202551.GA23581@lunn.ch>
References: <1423212311-10793-1-git-send-email-gordon@bosvangennip.nl>
 <54D484D8.8090801@free-electrons.com>
 <54D6299B.70707@bosvangennip.nl>
 <20150207160945.GA22306@lunn.ch>
 <54D64820.7020002@bosvangennip.nl>
 <20150207173642.GI25985@lunn.ch>
 <54D657D5.3010709@bosvangennip.nl>
 <20150207184024.GB22306@lunn.ch>
 <54D66EB2.2030006@bosvangennip.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54D66EB2.2030006-PMRpws9CsXpfxmBXdGbrbQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gordon Bos <gordon-PMRpws9CsXpfxmBXdGbrbQ@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 07, 2015 at 08:59:46PM +0100, Gordon Bos wrote:
> Hi Andrew,
> 
> There is a difference, and apparently it somewhere got solved:
> 
> From running kernel 3.17.1
> 
>      ~ # dmesg | grep spi
> 
> Running an upgraded kernel 3.18.5 with the same DT blob
> 
>      ~ # dmesg | grep spi
>    [    0.928832] m25p80 spi0.0: found m25p16, expected m25p80
>    [    0.934124] m25p80 spi0.0: m25p16 (2048 Kbytes)

So this is with your patch applied. You can see the driver is
complaining the DT says there should be a m25p80, but it actually
found a m25p16. If you remove your change, this warning will go away.

> You may therefore consider the MTD issue as solved.

Great.
 
 Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
