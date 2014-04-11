From: "ezequiel.garcia@free-electrons.com"
	<ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v2] axs_nand - add driver for NAND controller used on
 Synopsys AXS dev boards
Date: Fri, 11 Apr 2014 12:07:59 -0300
Message-ID: <20140411150759.GA19199@arch.cereza>
References: <1396597089-1081-1-git-send-email-abrodkin@synopsys.com>
 <20140404140933.GA25772@arch.cereza>
 <1396851239.4081.10.camel@abrodkin-8560l.internal.synopsys.com>
 <1397227889.3284.17.camel@abrodkin-8560l.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1397227889.3284.17.camel@abrodkin-8560l.internal.synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, "Francois.Bedard@synopsys.com" <Francois.Bedard@synopsys.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>
List-Id: devicetree@vger.kernel.org

On Apr 11, Alexey Brodkin wrote:
> Hi Ezequiel,
>=20
> On Mon, 2014-04-07 at 10:13 +0400, Alexey Brodkin wrote:
> > Hi Ezequiel,
> >=20
> > On Fri, 2014-04-04 at 11:09 -0300, Ezequiel Garcia wrote:
> > > On Apr 04, Alexey Brodkin wrote:
> > > > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > > >=20
> > >=20
> > > Maybe it would be nice adding some driver description here, so th=
e commit
> > > log actually says something useful about the commit.
> >=20
> > Well, I thought about it but frankly I'm not sure if there's anythi=
ng
> > else to add to commit title "driver for NAND controller used on Syn=
opsys
> > AXS dev boards".
> >=20
> > Do you think more info may make sense?
> >=20
> > > > +/**
> > > > + * axs_flag_wait_and_reset - Waits until requested flag in INT=
_STATUS register
> > > > + *              is set by HW and resets it by writing "1" in I=
NT_CLR_STATUS.
> > > > + * @host:	Pointer to private data structure.
> > > > + * @flag:	Bit/flag offset in INT_STATUS register
> > > > + */
> > > > +static void axs_flag_wait_and_reset(struct axs_nand_host *host=
, int flag)
> > > > +{
> > > > +	unsigned int i;
> > > > +
> > > > +	for (i =3D 0; i < AXS_FLAG_WAIT_DELAY * 100; i++) {
> > > > +		unsigned int status =3D reg_get(host, INT_STATUS);
> > > > +
> > > > +		if (status & (1 << flag)) {
> > > > +			reg_set(host, INT_CLR_STATUS, 1 << flag);
> > > > +			return;
> > > > +		}
> > > > +
> > > > +		udelay(10);
> > > > +	}
> > > > +
> > > > +	/*
> > > > +	 * Since we cannot report this problem any further than
> > > > +	 * axs_nand_{write|read}_buf() letting user know there's a pr=
oblem.
> > > > +	 */
> > > > +	dev_err(host->dev, "Waited too long (%d s.) for flag/bit %d\n=
",
> > > > +		AXS_FLAG_WAIT_DELAY, flag);
> > > > +}
> > >=20
> > > Hm... I'm not sure the above is really true.
> > >=20
> > > The NAND core uses the replaceable chip->waitfunc callback to che=
ck the
> > > status of issued commands. See for instance:
> > >=20
> > > static int nand_write_oob_std(struct mtd_info *mtd, struct nand_c=
hip *chip,
> > >                               int page)
> > > {
> > >         int status =3D 0;
> > >         const uint8_t *buf =3D chip->oob_poi;
> > >         int length =3D mtd->oobsize;
> > >=20
> > >         chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize, page);
> > >         chip->write_buf(mtd, buf, length);
> > >         /* Send command to program the OOB data */
> > >         chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> > >=20
> > >         status =3D chip->waitfunc(mtd, chip);
> > >=20
> > >         return status & NAND_STATUS_FAIL ? -EIO : 0;
> > > }
> > >=20
> > > On the other side, if you are clearing the flags in axs_flag_wait=
_and_reset()
> > > it might be a bit hard for you to get this right.
> > >=20
> > > IOW, I'm not saying you *must* do this, but instead suggesting th=
at you take
> > > a look at waitfunc() and see if it helps report a proper error in=
 the
> > > read/write path.
> >=20
> > As I may understand from generic implementation of "waitfunc" in
> > "nand_base.c" it checks status of NAND chip itself - which IMHO mak=
es
> > sense. And this is done via NAND_CMD_STATUS command sent to chip th=
rough
> > NAND controller.
> >=20
> > In AXS NAND driver you may see 2 types of wait checks:
> > 1. NAND_ISR_CMDDONE - this flag means that NAND controller has just
> > executed provided command (i.e. set proper signal on control lines =
of
> > NAND chip etc), but it doesn't mean NAND chip itself has completed
> > command execution. That's why "waitfunc" is not direct replacement =
here.
> >=20
> > 2. NAND_ISR_{RX|TX}DMACOMPLETE - this flag indicates completion of =
DMA
> > transfer to/from NAND chip to RAM. "waitfunc" won't work here as we=
ll.
> >=20
> > I hope this explanation makes sense.
>=20
> Please treat this message as a gentle reminder.
> I'm wondering if my explanation in the previous email makes any sense=
 or
> I still need to fix stuff.

Well, I was merely suggesting to look into using waitfunc(), so you def=
initely
don't need to fix anything (at least from my side).

Just as a comment, regarding your explanation above, I think you can ov=
erride
the waitfunc() and check the NAND_CMD_STATUS, together with the check f=
or your
ISR flags. However, you know more about your hardware than me, so this =
is
*just* a suggestion.

The driver looks fine broadly speaking. I guess it's up to Brian now to=
 provide
further feedback.
--=20
Ezequiel Garc=EDa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
