Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADDDC54E4B
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:43:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEEF2208CA
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:43:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbgEGLnh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 07:43:37 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37298 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgEGLnh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 07:43:37 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0E1192A0C07;
        Thu,  7 May 2020 12:43:33 +0100 (BST)
Date:   Thu, 7 May 2020 13:43:30 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Michal Simek <monstr@monstr.eu>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: [PATCH v3 2/8] lib/bch: Allow easy bit swapping
Message-ID: <20200507134330.6e8a9f80@collabora.com>
In-Reply-To: <20200507110034.14736-3-miquel.raynal@bootlin.com>
References: <20200507110034.14736-1-miquel.raynal@bootlin.com>
        <20200507110034.14736-3-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu,  7 May 2020 13:00:28 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> From: Boris Brezillon <boris.brezillon@collabora.com>

Hehe. I sent a raw diff and now there's my name on this patch :-).
Given you debugged/polished it, I'd rather have you take the ownership
here.

> 
> It seems that several hardware ECC engine use a swapped representation
> of bytes compared to software.

Some more details here. I think it has to do with how the ECC engine
is wired to the NAND controller or the order the bits are passed to the
HW BCH logic. Given the sunxi NAND controller driver has the same
bit-swapping, I suspect it's actually pretty common.

> It means that when the software BCH
> engine is working in conjunction with data generated with hardware, we
> must swap the bits inside bytes, eg:
> 
>     0x0A = b0000_1010 -> b0101_0000 = 0x50
> 
> Make it possible just by flipping a boolean in the BCH control

		   ^ by adding a swap_bits boolen to the ...

> structure.

Regarding the implementation itself, I came up with something simple
because I didn't want to spend too much time looking at how things
could be changed to avoid those swap_bits(). I suspect we can prepare
the ->a_{mod,pow}_tab tables to avoid that. Ivan, any opinion?

Note that we can also optimize that in a second step, so Miquel can get
the rest of the series merged.

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Ivan Djelic <ivan.djelic@parrot.com>
> ---
>  include/linux/bch.h |  1 +
>  lib/bch.c           | 84 ++++++++++++++++++++++++++++++++++++++-------
>  2 files changed, 72 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/bch.h b/include/linux/bch.h
> index 9c35e7cd5890..c42f50cacfdc 100644
> --- a/include/linux/bch.h
> +++ b/include/linux/bch.h
> @@ -51,6 +51,7 @@ struct bch_control {
>  	int            *cache;
>  	struct gf_poly *elp;
>  	struct gf_poly *poly_2t[4];
> +	bool		swap_bits;

This new field should be documented.

>  };
>  
>  struct bch_control *bch_init(int m, int t, unsigned int prim_poly);
> diff --git a/lib/bch.c b/lib/bch.c
> index 1091841ac716..81bf8b426eea 100644
> --- a/lib/bch.c
> +++ b/lib/bch.c
> @@ -114,6 +114,49 @@ struct gf_poly_deg1 {
>  	unsigned int   c[2];
>  };
>  
> +static u8 swap_bits_table[] = {
> +	0x00, 0x80, 0x40, 0xc0, 0x20, 0xa0, 0x60, 0xe0,
> +	0x10, 0x90, 0x50, 0xd0, 0x30, 0xb0, 0x70, 0xf0,
> +	0x08, 0x88, 0x48, 0xc8, 0x28, 0xa8, 0x68, 0xe8,
> +	0x18, 0x98, 0x58, 0xd8, 0x38, 0xb8, 0x78, 0xf8,
> +	0x04, 0x84, 0x44, 0xc4, 0x24, 0xa4, 0x64, 0xe4,
> +	0x14, 0x94, 0x54, 0xd4, 0x34, 0xb4, 0x74, 0xf4,
> +	0x0c, 0x8c, 0x4c, 0xcc, 0x2c, 0xac, 0x6c, 0xec,
> +	0x1c, 0x9c, 0x5c, 0xdc, 0x3c, 0xbc, 0x7c, 0xfc,
> +	0x02, 0x82, 0x42, 0xc2, 0x22, 0xa2, 0x62, 0xe2,
> +	0x12, 0x92, 0x52, 0xd2, 0x32, 0xb2, 0x72, 0xf2,
> +	0x0a, 0x8a, 0x4a, 0xca, 0x2a, 0xaa, 0x6a, 0xea,
> +	0x1a, 0x9a, 0x5a, 0xda, 0x3a, 0xba, 0x7a, 0xfa,
> +	0x06, 0x86, 0x46, 0xc6, 0x26, 0xa6, 0x66, 0xe6,
> +	0x16, 0x96, 0x56, 0xd6, 0x36, 0xb6, 0x76, 0xf6,
> +	0x0e, 0x8e, 0x4e, 0xce, 0x2e, 0xae, 0x6e, 0xee,
> +	0x1e, 0x9e, 0x5e, 0xde, 0x3e, 0xbe, 0x7e, 0xfe,
> +	0x01, 0x81, 0x41, 0xc1, 0x21, 0xa1, 0x61, 0xe1,
> +	0x11, 0x91, 0x51, 0xd1, 0x31, 0xb1, 0x71, 0xf1,
> +	0x09, 0x89, 0x49, 0xc9, 0x29, 0xa9, 0x69, 0xe9,
> +	0x19, 0x99, 0x59, 0xd9, 0x39, 0xb9, 0x79, 0xf9,
> +	0x05, 0x85, 0x45, 0xc5, 0x25, 0xa5, 0x65, 0xe5,
> +	0x15, 0x95, 0x55, 0xd5, 0x35, 0xb5, 0x75, 0xf5,
> +	0x0d, 0x8d, 0x4d, 0xcd, 0x2d, 0xad, 0x6d, 0xed,
> +	0x1d, 0x9d, 0x5d, 0xdd, 0x3d, 0xbd, 0x7d, 0xfd,
> +	0x03, 0x83, 0x43, 0xc3, 0x23, 0xa3, 0x63, 0xe3,
> +	0x13, 0x93, 0x53, 0xd3, 0x33, 0xb3, 0x73, 0xf3,
> +	0x0b, 0x8b, 0x4b, 0xcb, 0x2b, 0xab, 0x6b, 0xeb,
> +	0x1b, 0x9b, 0x5b, 0xdb, 0x3b, 0xbb, 0x7b, 0xfb,
> +	0x07, 0x87, 0x47, 0xc7, 0x27, 0xa7, 0x67, 0xe7,
> +	0x17, 0x97, 0x57, 0xd7, 0x37, 0xb7, 0x77, 0xf7,
> +	0x0f, 0x8f, 0x4f, 0xcf, 0x2f, 0xaf, 0x6f, 0xef,
> +	0x1f, 0x9f, 0x5f, 0xdf, 0x3f, 0xbf, 0x7f, 0xff,
> +};
> +
> +static u8 swap_bits(struct bch_control *bch, u8 in)
> +{
> +	if (!bch->swap_bits)
> +		return in;
> +
> +	return swap_bits_table[in];
> +}
> +
>  /*
>   * same as bch_encode(), but process input data one byte at a time
>   */
> @@ -126,7 +169,9 @@ static void bch_encode_unaligned(struct bch_control *bch,
>  	const int l = BCH_ECC_WORDS(bch)-1;
>  
>  	while (len--) {
> -		p = bch->mod8_tab + (l+1)*(((ecc[0] >> 24)^(*data++)) & 0xff);
> +		u8 tmp = swap_bits(bch, *data++);
> +
> +		p = bch->mod8_tab + (l+1)*(((ecc[0] >> 24)^(tmp)) & 0xff);
>  
>  		for (i = 0; i < l; i++)
>  			ecc[i] = ((ecc[i] << 8)|(ecc[i+1] >> 24))^(*p++);
> @@ -145,10 +190,16 @@ static void load_ecc8(struct bch_control *bch, uint32_t *dst,
>  	unsigned int i, nwords = BCH_ECC_WORDS(bch)-1;
>  
>  	for (i = 0; i < nwords; i++, src += 4)
> -		dst[i] = (src[0] << 24)|(src[1] << 16)|(src[2] << 8)|src[3];
> +		dst[i] = ((u32)swap_bits(bch, src[0]) << 24) |
> +			 ((u32)swap_bits(bch, src[1]) << 16) |
> +			 ((u32)swap_bits(bch, src[2]) << 8) |
> +			 swap_bits(bch, src[3]);
>  
>  	memcpy(pad, src, BCH_ECC_BYTES(bch)-4*nwords);
> -	dst[nwords] = (pad[0] << 24)|(pad[1] << 16)|(pad[2] << 8)|pad[3];
> +	dst[nwords] = ((u32)swap_bits(bch, pad[0]) << 24) |
> +		      ((u32)swap_bits(bch, pad[1]) << 16) |
> +		      ((u32)swap_bits(bch, pad[2]) << 8) |
> +		      swap_bits(bch, pad[3]);
>  }
>  
>  /*
> @@ -161,15 +212,15 @@ static void store_ecc8(struct bch_control *bch, uint8_t *dst,
>  	unsigned int i, nwords = BCH_ECC_WORDS(bch)-1;
>  
>  	for (i = 0; i < nwords; i++) {
> -		*dst++ = (src[i] >> 24);
> -		*dst++ = (src[i] >> 16) & 0xff;
> -		*dst++ = (src[i] >>  8) & 0xff;
> -		*dst++ = (src[i] >>  0) & 0xff;
> +		*dst++ = swap_bits(bch, src[i] >> 24);
> +		*dst++ = swap_bits(bch, src[i] >> 16);
> +		*dst++ = swap_bits(bch, src[i] >> 8);
> +		*dst++ = swap_bits(bch, src[i]);
>  	}
> -	pad[0] = (src[nwords] >> 24);
> -	pad[1] = (src[nwords] >> 16) & 0xff;
> -	pad[2] = (src[nwords] >>  8) & 0xff;
> -	pad[3] = (src[nwords] >>  0) & 0xff;
> +	pad[0] = swap_bits(bch, src[nwords] >> 24);
> +	pad[1] = swap_bits(bch, src[nwords] >> 16);
> +	pad[2] = swap_bits(bch, src[nwords] >> 8);
> +	pad[3] = swap_bits(bch, src[nwords]);
>  	memcpy(dst, pad, BCH_ECC_BYTES(bch)-4*nwords);
>  }
>  
> @@ -240,7 +291,12 @@ void bch_encode(struct bch_control *bch, const uint8_t *data,
>  	 */
>  	while (mlen--) {
>  		/* input data is read in big-endian format */
> -		w = r[0]^cpu_to_be32(*pdata++);
> +		w = cpu_to_be32(*pdata++);
> +		w = (u32)swap_bits(bch, w) |
> +		    ((u32)swap_bits(bch, w >> 8) << 8) |
> +		    ((u32)swap_bits(bch, w >> 16) << 16) |
> +		    ((u32)swap_bits(bch, w >> 24) << 24);

We should make the bit swapping conditional (only do it if
bch->swap_bit is true) to not penalize the !swap_bits case.

> +		w ^= r[0];
>  		p0 = tab0 + (l+1)*((w >>  0) & 0xff);
>  		p1 = tab1 + (l+1)*((w >>  8) & 0xff);
>  		p2 = tab2 + (l+1)*((w >> 16) & 0xff);
> @@ -1048,7 +1104,9 @@ int bch_decode(struct bch_control *bch, const uint8_t *data, unsigned int len,
>  				break;
>  			}
>  			errloc[i] = nbits-1-errloc[i];
> -			errloc[i] = (errloc[i] & ~7)|(7-(errloc[i] & 7));
> +			if (!bch->swap_bits)
> +				errloc[i] = (errloc[i] & ~7) |
> +					    (7-(errloc[i] & 7));
>  		}
>  	}
>  	return (err >= 0) ? err : -EBADMSG;

Oh, and we should patch bch_init() to take a bool swap_bits. I'm not
comfortable having users set bch_control fields on their own,
especially one that's marked 'private'.
