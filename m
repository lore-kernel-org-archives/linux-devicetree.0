From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] mtd: atmel_nand: make PMECC lookup table and offset
 property optional
Date: Wed, 5 Nov 2014 14:44:47 -0800
Message-ID: <20141105224447.GY23619@ld-irv-0074>
References: <1413021710-32264-1-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1413021710-32264-1-git-send-email-josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 11, 2014 at 06:01:50PM +0800, Josh Wu wrote:
> From: Josh Wu <Josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> 
> If there is no PMECC lookup table stored in ROM, or lookup table offset is
> not specified, PMECC driver should build it in DDR by itself.
> 
> That make the PMECC driver work for some board which doesn't has PMECC
> lookup table in ROM.
> 
> The PMECC use the BCH algorithm, so based on the build_gf_tables()
> function in lib/bch.c, we can build the Galois Field lookup table.
> 
> For more information can refer to section 5.4 of PMECC controller
> application note:
> 	http://www.atmel.com/images/doc11127.pdf
> 
> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Applied to l2-mtd.git.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
