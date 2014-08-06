From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mtd: nand: stm_nand_bch: add new driver
Date: Wed, 6 Aug 2014 11:26:41 +0100
Message-ID: <20140806102641.GB10136@lee--X1>
References: <1401268805-26043-1-git-send-email-lee.jones@linaro.org>
 <20140703002237.GM3599@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140703002237.GM3599@ld-irv-0074>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, "Gupta, Pekon\"" <pekon@ti.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Boris BREZILLON <b.brezillon.dev@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, 02 Jul 2014, Brian Norris wrote:
> On Wed, May 28, 2014 at 10:20:05AM +0100, Lee Jones wrote:

[...]

> > +	if (((unsigned int)buf & (NANDI_BCH_DMA_ALIGNMENT - 1)) ||
> > +	    (!virt_addr_valid(buf))) /* vmalloc'd buffer! */
> > +		bounce =3D true;
> > +
> > +	p =3D bounce ? nandi->page_buf : buf;
>=20
> It looks like you're reimplementing NAND_USE_BOUNCE_BUFFER. Can you t=
ry
> using that flag? (You may need to extend it to account for your DMA
> alignment, too.)

NAND_USE_BOUNCE_BUFFER won't work for us unless we can guarantee that
the bounce buffer will always be 64 Byte aligned, which I don't think
we can.  Another way to do it would be to assign all of our own
buffers, but I'm really not comfortable fiddling with those as there
are a lot of controller specific intricacies which a) I'm not familiar
with and b) no longer have Angus to fire questions off to and/or
review.

So if you don't mind, I'd really rather use Angus' implementation.
It's only an extra couple of lines and Angus has already tested it to
a high level.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
