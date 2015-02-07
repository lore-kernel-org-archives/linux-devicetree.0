From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/1] arm: Fix unavailable MTD userland devices on Excito
 B3 boards
Date: Sat, 7 Feb 2015 18:36:42 +0100
Message-ID: <20150207173642.GI25985@lunn.ch>
References: <1423212311-10793-1-git-send-email-gordon@bosvangennip.nl>
 <54D484D8.8090801@free-electrons.com>
 <54D6299B.70707@bosvangennip.nl>
 <20150207160945.GA22306@lunn.ch>
 <54D64820.7020002@bosvangennip.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54D64820.7020002-PMRpws9CsXpfxmBXdGbrbQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gordon Bos <gordon-PMRpws9CsXpfxmBXdGbrbQ@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 07, 2015 at 06:15:12PM +0100, Gordon Bos wrote:
> Hi Andrew,
> 
> Unsure how it can work for you, but this is the corresponding entry
> from the Excito release:
> 
> ---
> |/*****************************************************************************
>  * 2048KB SPI Flash on Boot Device (Numonyx MP25P16)
>  ****************************************************************************/
> 
> static struct mtd_partition bubba3_flash_parts[] = {
>  {
>  .name = "u-boot",
>  .size = SZ_512K+SZ_256K,
>  .offset = 0,
>  },
>  {
>  .name = "env",
>  .size = SZ_128K,
>  .offset = MTDPART_OFS_NXTBLK,
>  },
>  {
>  .name = "data",
>  .size = MTDPART_SIZ_FULL,
>  .offset = MTDPART_OFS_NXTBLK,
>  },
> };
> 
> static const struct flash_platform_data bubba3_flash = {
>  .type = "m25p16",

So the device is a m25p16. 

>  .name = "spi_flash",
>  .parts = bubba3_flash_parts,
>  .nr_parts = ARRAY_SIZE(bubba3_flash_parts),
> };
> 
> static struct spi_board_info __initdata bubba3_spi_slave_info[] = {
>  {
>  .modalias = "m25p80",

And the driver is m25p80.

This is consistent with the current device tree description. 

So what actually happens when you use the mainline DT on your device?

I'm not going to accept any changes until we understand what problems
you have and why it works for me.

Thanks
    Andrew



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
