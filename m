From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 26/31] mtd: nand: pxa3xx: Introduce multiple page I/O
 support
Date: Fri, 8 Nov 2013 00:21:33 -0300
Message-ID: <20131108032132.GA2425@localhost>
References: <1383837455-30721-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1383837455-30721-27-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131107234459.GB2467@localhost>
 <20131108004600.GZ20061@ld-irv-0074.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131108004600.GZ20061-bU/DPfM3abD4WzifrMjOTkcViWtcw2C0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Willy Tarreau <w@1wt.eu>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 07, 2013 at 04:46:00PM -0800, Brian Norris wrote:
> On Thu, Nov 07, 2013 at 08:45:00PM -0300, Ezequiel Garcia wrote:
> > Hello,
> >=20
> > I have a concern about the ECC mode and strength determination.
> >=20
> > On Thu, Nov 07, 2013 at 12:17:30PM -0300, Ezequiel Garcia wrote:
> > [..]
> > > @@ -1152,7 +1289,28 @@ static int armada370_ecc_init(struct pxa3x=
x_nand_info *info,
> > >  			      struct nand_ecc_ctrl *ecc,
> > >  			      int strength, int page_size)
> > >  {
> > > -	/* Unimplemented yet */
> > > +	if (strength =3D=3D 4 && page_size =3D=3D 4096) {
> > > +		info->ecc_bch =3D 1;
> > > +		info->chunk_size =3D 2048;
> > > +		info->spare_size =3D 32;
> > > +		info->ecc_size =3D 32;
> > > +		ecc->mode =3D NAND_ECC_HW;
> > > +		ecc->size =3D info->chunk_size;
> > > +		ecc->layout =3D &ecc_layout_4KB_bch4bit;
> > > +		ecc->strength =3D 16;
> > > +		return 1;
> > > +
> > > +	} else if (strength =3D=3D 8 && page_size =3D=3D 4096) {
> > > +		info->ecc_bch =3D 1;
> > > +		info->chunk_size =3D 1024;
> > > +		info->spare_size =3D 0;
> > > +		info->ecc_size =3D 32;
> > > +		ecc->mode =3D NAND_ECC_HW;
> > > +		ecc->size =3D info->chunk_size;
> > > +		ecc->layout =3D &ecc_layout_4KB_bch8bit;
> > > +		ecc->strength =3D 16;
> > > +		return 1;
> > > +	}
> > >  	return 0;
> > >  }
> > > =20
> >=20
> > The above shows I tried to be very careful (aka paranoid) in the EC=
C
> > mode determination. Please note that what I call "ECC mode", is
> > determined by the chunk->size value only.
> >=20
> > As the included documentation explains this controller supports two
> > different BCH ECC strength: 16-over-1024, or 16-over-2048. Setting =
the chunk
> > size to either 1024 or 2048 is what determines which of the above w=
ill
> > actually take effect.
> >=20
> > In past mails, we've refered to these two as BCH4 or BCH8, but this=
 is not
> > really accurate (as Brian has pointed out) so I droped that terms i=
n
> > favor of the real thing: 16 correctable bits over 1024 data bytes, =
or
> > 16 correctable bits over 2048 data bytes.
> >=20
> > In turn, such BCH mode setting affects heavily the page layout, bec=
ause
> > after each transfered chunk (which is either 1024+spare or 2048+spa=
re)
> > the controller reads and writes a 30B ECC region.
> >=20
> > In other words, the kernel cannot arbitrarily change this setting, =
or
> > the image won't be readable/writeable any longer.
> >=20
> > For this reason, I'm starting to think the above method of picking
> > the "ECC mode" based solely on the page size or the strength is sli=
ghtly
> > fragile (future developers might come and "improve" the driver brea=
king
> > images).
> >=20
> > Besides: what if a user wants the kernel to use a "higher" than
> > required strength?
> >=20
> > In conclusion: I'm starting to think a better (and long-term safer)
> > approach is to set the ECC mode in the DT. I know this sucks, but f=
rom
> > my point of view the flash device contains an image that "must" be
> > read/write with a given ECC mode, and this ECC mode is by no means
> > discoverable.
>=20
> I think that's the way to go, in general. We can get by with
> "implementation defined behavior" (i.e., make the driver do what make=
s
> sense) for now, but to avoid breakage in the future, the bootloader
> needs to specify what ECC configuration is required -- via DT. But yo=
ur
> current patch is still probably fine without it, since you're support=
ing
> new hardware.
>=20

That sounds good. The ECC mode is currently "selected" in the driver
to be the one that "makes sense". In follow up patches we'll add a
proper DT binding, so this ECC mode can be set by the user.

The latter is an improvement over the former (adding more flexibility),
so there won't be any regressions.

Just to confirm: I consider this patchset to be OK as it is, and I expe=
ct
it to either get merged or receive some request for changes.

Oh, and by the way: we __really__ need someone to test for regressions =
on PXA.
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
