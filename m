From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mtd: nand: stm_nand_bch: add new driver
Date: Tue, 5 Aug 2014 15:23:24 +0100
Message-ID: <20140805142324.GA10136@lee--X1>
References: <1401268805-26043-1-git-send-email-lee.jones@linaro.org>
 <20140703002237.GM3599@ld-irv-0074>
 <20980858CB6D3A4BAE95CA194937D5E73EAFAFF1@DBDE04.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAFAFF1-yXqyApvAXouIQmiDNMet8wC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Gupta, Pekon" <pekon-l0cyMroinI0@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org" <kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 03 Jul 2014, Gupta, Pekon wrote:
> >From: Brian Norris [mailto:computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> >On Wed, May 28, 2014 at 10:20:05AM +0100, Lee Jones wrote:

[...]

> >> +/*
> >> + * NANDi Interrupts (shared by Hamming and BCH controllers)
> >> + */
> >> +static irqreturn_t nandi_irq_handler(int irq, void *dev)
> >> +{
> >> +	struct nandi_controller *nandi =3D dev;
> >> +	unsigned int status;
> >> +
> >> +	status =3D readl(nandi->base + NANDBCH_INT_STA);
> >> +
> >> +	if (status & NANDBCH_INT_SEQNODESOVER) {
> >> +		/* BCH */
> >> +		writel(NANDBCH_INT_CLR_SEQNODESOVER,
> >> +		       nandi->base + NANDBCH_INT_CLR);
> >> +		complete(&nandi->seq_completed);
> >> +	}
> >> +	if (status & NAND_INT_RBN) {
> >> +		/* Hamming */
> >> +		writel(NAND_INT_CLR_RBN, nandi->base + NANDHAM_INT_CLR);
> >> +		complete(&nandi->rbn_completed);
> >> +	}
> >> +
> >> +	return IRQ_HANDLED;
>=20
> Did you miss following comments ?
> [RFC 05/47] mtd: nand: stm_nand_bch: IRQ support for ST's BCH NAND Co=
ntroller driver
> http://lists.infradead.org/pipermail/linux-mtd/2014-March/052916.html
>=20
> Shouldn't IRQ_NONE be returned if no valid irq_status was found ?

I don't recall seeing these comments, so yes, I think they were
missed.  Will fix.

> >> +/*
> >> + * BCH Operations
> >> + */
> >> +static inline void bch_load_prog_cpu(struct nandi_controller *nan=
di,
> >> +				     struct bch_prog *prog)
> >> +{
> >> +	uint32_t *src =3D (uint32_t *)prog;
> >> +	uint32_t *dst =3D (uint32_t *)(nandi->base + NANDBCH_ADDRESS_REG=
_1);
> >> +	int i;
> >> +
> >> +	for (i =3D 0; i < 16; i++) {
> >> +		/* Skip registers marked as "reserved" */
> >> +		if (i !=3D 11 && i !=3D 14)
>=20
> Using macros for 11, 14, and 16 would make it more readable.

I think with the comment there, it's perfectly clear what's happening.

> >> +			writel(*src, dst);
> >> +		dst++;
> >> +		src++;
> >> +	}
> >> +}
> >> +
> >> +static void bch_wait_seq(struct nandi_controller *nandi)
> >> +{
> >> +	int ret;
> >> +
> >> +	ret =3D wait_for_completion_timeout(&nandi->seq_completed, HZ/2)=
;
>=20
> Are you sure you want to use same timeout value for all operations
> like ERASE, READ, WRITE ? because
> (1) There is wide variance between:
> - BLOCK_ERASE:  max(tBER) =3D 10ms) for MT29F4G08 Micron NAND
> - PAGE_ERASE: max(tPROG) =3D 600usec for same Micron part.
>=20
> (2) The value of HZ varies across kernel versions and hardware platfo=
rms.
>=20
> I suggest you pass the timeout value in call to bch_wait_seq().
> And this timeout value should be like 2x of typical value of which yo=
u found
> during ONFI parsing, or from DT

How do you obtain these timings?  I don't see tBER or tPROG being used
anywhere in MTD.

[...]

> >> +{
> >> +	uint8_t *b =3D data;
> >> +	int zeros =3D 0;
> >> +	int i;
> >> +
> >> +	for (i =3D 0; i < page_size; i++) {
> >> +		zeros +=3D hweight8(~*b++);
> Are you sure you want to use hweight8 ?
> hweight32 or something should give better performance, plz check.
> because this piece of code (check_xx_bitflips) sometimes becomes
> bottle neck for READ path.

I'm not sure, no.  If I change it, how will I know if it's still doing
the correct thing or otherwise?

[...]

> >> +	/* Load last page of block */
> >> +	offs =3D (loff_t)block << chip->phys_erase_shift;
> >> +	offs +=3D mtd->erasesize - mtd->writesize;
> >> +	if (bch_read_page(nandi, offs, buf) < 0) {
>=20
> *Important*: You shouldn't call internal functions directly here..
> Instead use chip->_read() OR mtd-read() that will:
> - keep this code independent of ECC modes added in your driver in fut=
ure.
> - implicitly handle updating mtd->ecc_stat (like ecc_failed, bits_cor=
rected).
> - implicitly take care of address alignments checks and offset calcul=
ations.
>=20
> <Same applies to other places where you have directly used bch_read_p=
age())

Yourself and Brian seem to disagree on this point.  Which is correct?

> >> +	/* Is block already considered bad? (will also catch invalid off=
sets) */
> >> +	ret =3D mtd_block_isbad(mtd, offs);
> >
> >You're violating some of the layering here; the low-level driver
> >probably shouldn't be calling the high-level mtd_*() APIs. On a simi=
lar
> >note, I'm not 100% confident that the nand_base/nand_bbt separation =
is
> >written cleanly enough for easy maintenance of your nand_base + ST B=
BT
> >code in parallel. I might need a second look at that, and I think
> >modularizing your BBT code to a separate file could help ease this a
> >little.

=2E.. here is the converse argument.

[...]

> >Are you actually looking for driver data, not platform data? (e.g.,
> >dev_set_drvdata() / platform_get_drvdata()) The two are a little
> >different, but your usage sounds like this more of a driver-private
> >description.

On closer inspection it appears that drvdata was already in use.  I've
not encompassed the NANDi information and the old pdata into one ddata
container.

[...]

> Sorry, this review got delayed from my part..
> But I hope I have covered most of the review in this and earlier resp=
onses.
> if you are able to clean most of these then should be ready for 3.17+=
=2E

It's a bit late for v3.17 now, but let's see what we can do about
getting it in for v3.18.  Fingers crossed!

> Please re-send the next version in similar squashed format, as its ea=
sy for review.
> And once Brian is okay, may be then you can re-send individual patche=
s.

Right.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
