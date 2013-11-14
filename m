From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 15/31] mtd: nand: pxa3xx: Use a completion to signal
 device ready
Date: Thu, 14 Nov 2013 15:53:57 -0300
Message-ID: <20131114185356.GA9912@localhost>
References: <1383837455-30721-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1383837455-30721-16-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131114183923.GO9468@ld-irv-0074.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131114183923.GO9468-bU/DPfM3abD4WzifrMjOTkcViWtcw2C0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Willy Tarreau <w@1wt.eu>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Brian,

On Thu, Nov 14, 2013 at 10:39:23AM -0800, Brian Norris wrote:
> On Thu, Nov 07, 2013 at 12:17:19PM -0300, Ezequiel Garcia wrote:
> > --- a/drivers/mtd/nand/pxa3xx_nand.c
> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> > @@ -863,21 +867,28 @@ static int pxa3xx_nand_waitfunc(struct mtd_in=
fo *mtd, struct nand_chip *this)
> >  {
> >  	struct pxa3xx_nand_host *host =3D mtd->priv;
> >  	struct pxa3xx_nand_info *info =3D host->info_data;
> > +	int ret;
> > +
> > +	/* Need to wait? */
> > +	if (!info->is_ready) {
> > +		ret =3D wait_for_completion_timeout(&info->dev_ready,
> > +				CHIP_DELAY_TIMEOUT);
> > +		if (!ret) {
> > +			dev_err(&info->pdev->dev, "Ready time out!!!\n");
> > +			return NAND_STATUS_FAIL;
> > +		}
> > +		info->is_ready =3D 1;
>=20
> Shouldn't the is_ready=3D1 line to be above the if (!ret) condition? =
I
> think you want to set is_ready=3D1 in either case (success or timeout=
).
> With this code, any timeout will cause subsequent waitfunc()'s to blo=
ck,
> even if they are never going to catch an interrupt.
>=20

Yes, good catch!

> I think this kind of mistake is easier to make now, since the 'is_rea=
dy'
> field isn't properly descriptive any more. It doesn't represent "is t=
he
> device ready"; it represents "is there a pending command on which I n=
eed
> to wait". (I don't care if you change the name; I'm just pointing thi=
s
> out.)
>=20

Yes, I agree. Maybe, "need_wait" or something like that would fit
better. Let me submit a new patch for this one.

> > +	}
> > =20
>=20
> I think all the other patches up to this one are good. I may push the=
m
> to l2-mtd.git now, unless you object.
>=20

Great, thanks a lot for reviewing and for all the feedback!
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
