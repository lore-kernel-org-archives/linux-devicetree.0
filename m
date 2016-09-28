From: Albert ARIBAUD <albert.aribaud-iEu9NFBzPZE@public.gmane.org>
Subject: Re: [PATCH 1/2] fsl-quadspi: fix QUAD read, add NORMAL, DUAL and
 FAST reads
Date: Wed, 28 Sep 2016 23:45:46 +0200
Message-ID: <20160928234546.6df9c893.albert.aribaud@3adev.fr>
References: <20160927055957.427-1-albert.aribaud@3adev.fr>
        <20160928200652.GA31901@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160928200652.GA31901@shlinux2>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Han Xu <xhnjupt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Han,

Le Thu, 29 Sep 2016 04:06:52 +0800, Han Xu <xhnjupt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> a écrit :

> Too much changes in one patch, need to split to several patches.

Will do.

> > +#define QUADSPI_SPTRCLR			0x15c
> > +#define QUADSPI_SPTRCLR_BFPTRC_SHIFT		0
> > +#define QUADSPI_SPTRCLR_BFPTRC_MASK		(0x1 << QUADSPI_SPTRCLR_BFPTRC_SHIFT)
> > +  
> 
> offset 0x15c is SR register for i.MX, not sure where does SPTRCLR come from

It's a typo -- should have been 0x16c, not 0x15c. It is the Vybrid's
Sequence Pointer Clear Register. Apparently, the bad register write did
not screw thing up enough to cause any visible issue. Thanks for
pointing it out.

> > +    /* use 24-bit addresses for up to 16MB, 32-bit above 16MB */
> > +	if (q->nor_size <= SZ_16M)
> > +		addrlen = ADDR24BIT;
> > +	else
> > +		addrlen = ADDR32BIT;  
> 
> A better patch fetch info from nor structure, refer to
> https://patchwork.ozlabs.org/patch/613429/

v3 (https://patchwork.kernel.org/patch/9287005/) seems poised to go in
at some point. I can base my patches above it. I will mention the
dependency in my series' cover letter.

> > + * When using two ports, the SEQID to use for one port might differ from
> > + * the one to use for the other (e.g., if one port can do 4-pad reads but
> > + * the other cannot). So we set up a basic mode here (SEQID_READ) and we
> > + * will set up the proper SEQID for the port right before doing the AHB
> > + * access(es).
> >   */  
> 
> It's rare to find this use case, considering the amount of lut is only 16,
> please don't add two many luts in this way. I will send a patch soon for
> dynamic lut change, please add these extra luts in dynamic lut list.

I'm fine with switching to a dynamic LUT list; this matches the "two
ports with different characteristics" well. Is the patch already
available somewhere so that I can rebase over it in advance?

> >  	/* Read out the data directly from the AHB buffer.*/
> > -	memcpy(buf, q->ahb_addr + q->chip_base_addr + from - q->memmap_offs,
> > -		len);
> > +	memcpy(buf, q->ahb_addr + nor_ofs + from, len);  
> 
> No much diff from the previous implementation

Still, it simplifies the memcpy source address computation.

> > +		ret = spi_nor_scan(nor, NULL, readmode);  
> 
> Not necessary, can fetch info from nor structure
> https://patchwork.ozlabs.org/patch/613429/

Ditto.

Thanks for your review!

Cordialement,
Albert ARIBAUD
3ADEV
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
