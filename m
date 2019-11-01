Return-Path: <SRS0=9w3Z=YZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B895CA9ECF
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 14:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4DFEA20650
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 14:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I1/WHsVy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbfKAO6T (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 Nov 2019 10:58:19 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34807 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727334AbfKAO6S (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Nov 2019 10:58:18 -0400
Received: by mail-pg1-f194.google.com with SMTP id e4so6670813pgs.1
        for <devicetree@vger.kernel.org>; Fri, 01 Nov 2019 07:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o3PotZZzGd3n0vtfT41UhnCQaaRUmL4E0PRscYzEIDo=;
        b=I1/WHsVyWQVAH+7YIQ9FJxjw/3+UZ4eJ1j/SDFWtIEofNsreSoGawixnCPLXHfjS4I
         xlDwa3u66eEwoOJUAPlHK0dUeT0aet3AJF7Hh7vmKlsgkC0XBk6UfewUnoYtCFXoeX5g
         7fSank49zBRoLLYkoib3osby1hKIjugYLT3XialA5XwBx2NicKvLZ0AL8HaA0MYN2gGJ
         6I7li89dPySlSyjub59Y1gl2eGkUAndynwIHLXQ4f01kEq7g1XzQ0k9tdlQaGRx6v+Xw
         shsJV6s6wDw/l6GpKrmsUj23FJcOIaobHKjzfOKXCDKJMXhdUTkbzBcGYz4z5yGtH0e+
         thcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=o3PotZZzGd3n0vtfT41UhnCQaaRUmL4E0PRscYzEIDo=;
        b=DHNA0mTbAz/chgtAG6nMRwxOkZydBqftx7REjM2PJaJ4d79ExhIrRIM2xEM9e06C5u
         IMUfzgjBNSuR2s+A81Jat25KbGOmTNgwWQMYjaRPONvOJ1G1bjjj+80PMnb0v3l6Q0fQ
         atTr3TiXHgmkJgr7ufy+EGRQJgsIx64DpVbG+8wf60ZnkTmGd9KqYhjXK3oxSNmUfpRZ
         wOGfeg/LS5JE/hkOX0ngMgiq3/U1ztl5kxeTeUNzv3RCr6z9xlFAMudZYDKJoRBnxTIE
         4g06s2vYFMY7KsKTQOlV9Se2Cua3qn6pW4L4ui8ki8Vf55DqaDOkF02MuYAcTvVUGR1S
         pmpw==
X-Gm-Message-State: APjAAAVx7fVXEHW5a6ON9fSVRDfdoD7jEdb9bfpEjtsoL9ydNixpU8EO
        3cU0+N6YhTDIDTlFPAySx8V8
X-Google-Smtp-Source: APXvYqyyHMBHWz8vbhnckMVAipVVWfbs6zJpy+GNzFBfp8NvRJbt08PIocOSMFo+vTjHOv8EaNNmig==
X-Received: by 2002:a05:6a00:51:: with SMTP id i17mr14214665pfk.8.1572620297826;
        Fri, 01 Nov 2019 07:58:17 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6413:fc8c:9538:d2ea:eab:d2c0])
        by smtp.gmail.com with ESMTPSA id z21sm6644869pfa.119.2019.11.01.07.58.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2019 07:58:17 -0700 (PDT)
Date:   Fri, 1 Nov 2019 20:28:06 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Tudor.Ambarus@microchip.com
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        darshak.patel@einfochips.com, prajose.john@einfochips.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
        dwmw2@infradead.org, computersforpeace@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 4/4] mtd: spi-nor: Add support for w25q256jw
Message-ID: <20191101145806.GB13101@Mani-XPS-13-9360>
References: <20191030090124.24900-1-manivannan.sadhasivam@linaro.org>
 <20191030090124.24900-5-manivannan.sadhasivam@linaro.org>
 <87e0b459-8dbf-26cc-611f-1b1b5266aa55@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87e0b459-8dbf-26cc-611f-1b1b5266aa55@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Tudor,

On Fri, Nov 01, 2019 at 01:48:17PM +0000, Tudor.Ambarus@microchip.com wrote:
> 
> 
> On 10/30/2019 11:01 AM, Manivannan Sadhasivam wrote:
> > External E-Mail
> > 
> > 
> > Add MTD support for w25q256jw SPI NOR chip from Winbond. This chip
> > supports dual/quad I/O mode with 512 blocks of memory organized in
> > 64KB sectors. In addition to this, there is also small 4KB sectors
> > available for flexibility. The device has been validated using Thor96
> > board.
> > 
> > Cc: Marek Vasut <marek.vasut@gmail.com>
> > Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Brian Norris <computersforpeace@gmail.com>
> > Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> > Cc: Richard Weinberger <richard@nod.at>
> > Cc: Vignesh Raghavendra <vigneshr@ti.com>
> > Cc: linux-mtd@lists.infradead.org
> > Signed-off-by: Darshak Patel <darshak.patel@einfochips.com>
> > [Mani: cleaned up for upstream]
> 
> Can we keep Darshak's authorship? We usually change the author if we feel that
> we made a significant change to what was originally published.
> 
> If it's just about cosmetics, cleaning or rebase, you can specify what you did
> after the author's S-o-b tag and then add your S-o-b, as you did above.
> 

I'd suggest to keep Darshak's authorship since he did the actual change in
the bsp. I have to clean it up before submitting upstream and I mentioned
the same above.

> The patch looks good.
> 

Thanks,
Mani

> Cheers,
> ta
> 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 1d8621d43160..2c25b371d9f0 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -2482,6 +2482,8 @@ static const struct flash_info spi_nor_ids[] = {
> >  	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> >  	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512,
> >  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> > +	{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512,
> > +			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> >  	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
> >  			SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
> >  
> > 
