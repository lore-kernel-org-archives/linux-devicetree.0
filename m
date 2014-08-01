From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mtd: nand: stm_nand_bch: add new driver
Date: Fri, 1 Aug 2014 10:27:25 +0100
Message-ID: <20140801092725.GN9030@lee--X1>
References: <1401268805-26043-1-git-send-email-lee.jones@linaro.org>
 <20140703002237.GM3599@ld-irv-0074>
 <20140731164709.GK9030@lee--X1>
 <20140731175427.GO3711@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140731175427.GO3711@ld-irv-0074>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, "Gupta, Pekon\"" <pekon@ti.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Boris BREZILLON <b.brezillon.dev@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, 31 Jul 2014, Brian Norris wrote:
> On Thu, Jul 31, 2014 at 05:47:09PM +0100, Lee Jones wrote:
> > Finally getting round to this ...
>=20
> Sounds like me :)

:)

> > On Wed, 02 Jul 2014, Brian Norris wrote:
> > > On Wed, May 28, 2014 at 10:20:05AM +0100, Lee Jones wrote:
> > > > This is a squashed version of the submission to avoid re-sendin=
g the
> > > > entire set over and over, essentially clogging up the MLs.
> > >=20
> > > Thanks. I think I'd prefer to accept your driver in a form like t=
his
> > > too.
> >=20
> > You mean squashed?  I'd _really_ like _not_ to do that.
>=20
> Any particular reason? Just to bump your patch count? ;) A half-finis=
hed
> driver is not really bisectable.

I'd be lying if I said that it wasn't a consideration.  I have put
more hours into this one driver than I would have 10 others.  The
bumping of the patch count, as you call it would closer reflect the
effort put in.

But actually I initially split this patch-set up after a review
comment you provided during the upstreaming process of the FSM NOR
driver.  You mentioned that breaking up the driver made it easier to
review as I guess you could review a couple of patches, then take a
break without the fear of duplicated work.

Admittedly, I went a little overboard with this submission - it
appears that I underestimated the size of the driver and subsequently
misjudged the function split.

> > We've spoken
> > about this in reasonable depth before.  I agreed to squash it for t=
his
> > review to keep the submissions nice and light, but we did have an
> > agreement that once accepted the final delivery could be via
> > pull-request.  I'd really like it if you honoured that.
>=20
> I don't recall the part about final delivery, but that's what happens
> via informal and unlogged communication like IRC, I guess. As I recal=
l,
> I just mentioned that you could link people to your git history if yo=
u
> felt it was still useful.
>=20
> Anyway, as long as the review process is sane (1 new driver =3D small
> number of patches), then I don't particularly mind how the final
> delivery comes.
>=20
> > I can pull the vendor specific (rather than
> > legacy :) ) BBT handling out and protect it with a CONFIG option.
>=20
> A CONFIG option perhaps; but you also might need to specify what
> 'nand-on-flash-bbt' means in your DT. Personally, I'd prefer that
> 'nand-on-flash-bbt' refers only to one of the BBT's found in nand_bbt=
=2Ec.
> Maybe you could extend nand-on-flash-bbt to have a value, like:
>=20
> 	nand-on-flash-bbt =3D "ST";
>=20
> Just a thought. I don't know if this is overdesign, or proper DT safe=
ty
> (the whole "DT as ABI" thing is tricky, especially when dealing with
> softer things like this).

I'm not sure it means anything to us specifically.  I think we're only
specifying it to keep the framework quiet.  If using the vendor
specific BBT, then the factory set BBT is always scanned for and the
resultant BBT it's always stored in-band (i.e. in flash).  If using
the framework's version of BBT, then NAND_BBT_USE_FLASH will mean the
same thing as it does everywhere else.

> > > >  Documentation/devicetree/bindings/mtd/stm-nand.txt |   87 +
> > >=20
> > > See:
> > >=20
> > >   Documentation/devicetree/bindings/submitting-patches.txt
> >=20
> > This file doesn't exist.  What are you referencing?
>=20
> commit 2a9330010bea5982a5c6593824bc036bf62d67b7
> Author: Jason Cooper <jason@lakedaemon.net>
> Date:   Tue Dec 17 16:59:40 2013 +0000
>=20
>     dt/bindings: submitting patches and ABI documents

Ah, looks like I need to rebase this branch.  Jeez, this (NAND BCH)
patch-set has been around since forever!

> > > You're missing devicetree@vger.kernel.org on CC, and the binding =
doc
> > > needs a separate patch. (Sorry if I confused this one earlier.)
> >=20
> > The binding document will certainly be a separate patch.  This patc=
h
> > is the 'everything squashed' version which was requested.
>=20
> I was only referring to the driver. For the DT guys' sake, you should
> still follow their rules for patch review.

So yes, I am fully aware of the rules about submitting drivers
containing DT bindings.  As mentioned before, I have no intention of
sending this whole series as onebigpatch (TM).

> > > >  arch/arm/boot/dts/stih41x-b2020.dtsi               |   40 +
> > >=20
> > > This will need refreshed and sent as a separate patch, to go thro=
ugh the
> > > appropriate ARM tree.
> >=20
> > As above.
>=20
> OK, if you're really planning to send a final git pull request, you'l=
l
> need to have this in a separate branch for them to take, then.

Of course.  Same goes with the DTS(I) changes.

> > > > diff --git a/Documentation/devicetree/bindings/mtd/stm-nand.txt=
 b/Documentation/devicetree/bindings/mtd/stm-nand.txt
> > > > new file mode 100644
> > > > index 0000000..d957f49
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/mtd/stm-nand.txt
> > > > @@ -0,0 +1,87 @@
> > > > +STM BCH NAND Support
> > > > +--------------------
> > > > +
> > > > +Required properties:
> > > > +
> > > > +- compatible		: Should be "st,nand-bch"
> > > > +- reg			: Should contain register's location and length
> > > > +- reg-names		: "nand_mem" - NAND Controller register map
> > > > +			  "nand_dma" - BCH Controller DMA configuration map
> > > > +- interrupts		: Interrupt number
> > > > +- interrupt-names	: "nand_irq" - NAND Controller IRQ
> > > > +- st,nand-banks		: Subnode representing one or more "banks" of=
 NAND
> > > > +			  Flash, connected to an STM NAND Controller (see
> > > > +			  description below).
> > > > +- nand-ecc-strength	: Generic NAND property (See mtd/nand.txt)
> > > > +			  Options are; 0, 18, 30 or 0xFF (AUTO)
> > >=20
> > > What is 0xFF (AUTO)?
>=20
> Could you answer this one? IIRC, 0xff (AUTO) could easily be replaced=
 by
> language that "If nand-ecc-strength is not present", software is free=
 to
> auto-select the ECC strength. That removes this non-intuitive special
> value.

Yes, that's exactly what should happen.  Will fix.

> Also, nand-ecc-strength should probably be paired with
> nand-ecc-step-size, otherwise it doesn't really have any meaning.

Will look into it.

> ...
> > > > +Example:
> > > > +
> ...
> > > > +	nand_banks: nand-banks {
> > > > +		bank0 {
> ...
> > > > +			partitions {
> ...
> > > > +				partition@0{
> > > > +					label =3D "NAND Flash 1";
> > >=20
> > > Do you really want spaces in your partition names?
> >=20
> > No clue to be honest.  What are the known ramifications?
>=20
> I thought it might give issues with the /proc/mtd columns, but actual=
ly,
> the format there is quoted, so the columns will still be unambiguous.
>=20
> It also could make things a little more difficult with boot cmdline
> parameters, for instance if you want to specify a partition for UBI t=
o
> attach to:
>=20
>   ubi.mtd=3D"NAND Flash 1"
>=20
> This will probably work OK (haven't tested it), but I can imagine som=
e
> boot environments in which getting the quoting right is more difficul=
t.

I have no strong feelings either way, so i will rid the whitespace.

> > > > +					reg =3D <0x00000000 0x00800000>;
> > > > +				};
> > > > +				partition@800000{
> > > > +					label =3D "NAND Flash 2";
> > > > +					reg =3D <0x00800000 0x0F800000>;
> > > > +				};
> > > > +			};
> > > > +		};
> > > > +	};
> ...
>=20
> > > > diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand=
/stm_nand_bch.c
> > > > new file mode 100644
> > > > index 0000000..5ad78ce
> > > > --- /dev/null
> > > > +++ b/drivers/mtd/nand/stm_nand_bch.c
> > > > @@ -0,0 +1,2415 @@
> ...
> > > > +/*
> > > > + * ONFI NAND Timing Mode Specifications
> > > > + *
> > > > + * Note, 'tR' field (maximum page read time) is extracted from=
 the ONFI
> > > > + * parameter page during device probe.
> > > > + */
> > > > +const struct nand_sdr_timings st_nand_onfi_timing_specs[] =3D =
{
> > >=20
> > > Did you ever take a look at Boris Brezillon's timing patch series=
? He
> > > hasn't submitted an update recently, but it was looking good:
> > >=20
> > >   http://article.gmane.org/gmane.comp.hardware.netbook.arm.sunxi/=
7976
> > >=20
> > > Perhaps you could even modify/test/resubmit it (it's got a GPL Si=
gn-off,
> > > after all!). I'd prefer not to stick this stuff in your driver.
> >=20
> > Not yet.  Will do that now.
>=20
> FYI, some of the ONFI stubs are queued for 3.17, see l2-mtd.git
> drivers/mtd/nand/nand_timings.c. There's also some discussion of addi=
ng
> helpers that could reduce these to a more useful set of timings (e.g.=
,
> some timings used by a NAND controller may actually be a composite of
> two or more of the nand_sdr_timings fields).

Very well.  I will rebase onto l2-mtd.git (master?) and have a look.

> > > > +	/*
> > > > +	 * ONFI Timing Mode '0' (supported on all ONFI compliant devi=
ces)
> > > > +	 */
> > > > +	[0] =3D {
> > > > +		.tCLS_min	=3D 50,
> > > > +		.tCS_min	=3D 70,
> > > > +		.tALS_min	=3D 50,
> > > > +		.tDS_min	=3D 40,
> > > > +		.tWP_min	=3D 50,
> > > > +		.tCLH_min	=3D 20,
> > > > +		.tCH_min	=3D 20,
> > > > +		.tALH_min	=3D 20,
> > > > +		.tDH_min	=3D 20,
> > > > +		.tWB_max	=3D 200,
> > > > +		.tWH_min	=3D 30,
> > > > +		.tWC_min	=3D 100,
> > > > +		.tRP_min	=3D 50,
> > > > +		.tREH_min	=3D 30,
> > > > +		.tRC_min	=3D 100,
> > > > +		.tREA_max	=3D 40,
> > > > +		.tRHOH_min	=3D 0,
> > > > +		.tCEA_max	=3D 100,
> > > > +		.tCOH_min	=3D 0,
> > > > +		.tCHZ_max	=3D 100,
> > > > +	},
> ...
> > > (Related: Coverity caught a whole bunch of these type of bugs in =
the MTD
> > > test modules. I have fixes queued up that I meant to test and sub=
mit
> > > soon.)
> >=20
> > I will attempt to play around with Coverity.
>=20
> Good luck :) Coverity isn't always the easiest to get running
> individually. You might have better luck (once your stuff is merged)

Sorry merged where?

> checking out the free service offered for open source projects throug=
h
> github. There's a project instance set up for mainline:
>=20
>   https://scan.coverity.com/projects/128?tab=3Doverview

Thanks.  I'll have a play.

> > > > +/*
> > > > + * Detect an erased page, tolerating and correcting up to a sp=
ecified number of
> > > > + * bits at '0'.  (For many devices, it is now deemed within sp=
ec for an erased
> > > > + * page to include a number of bits at '0', either as a result=
 of read-disturb
> > > > + * behaviour or 'stuck-at-zero' failures.)  Returns the number=
 of corrected
> > > > + * bits, or a '-1' if we have exceeded the maximum number of b=
its at '0' (likely
> > > > + * to be a genuine uncorrectable ECC error).  In the latter ca=
se, the data must
> > > > + * be returned unmodified, in accordance with the MTD API.
> > > > + */
> > > > +static int check_erased_page(uint8_t *data, uint32_t page_size=
, int max_zeros)
> > >=20
> > > Another "check erased page" implementation? Sigh... it would be n=
ice if
> > > we could agree on a common implementation to share. My last attem=
pt was
> > > unsuccessful, since some drivers have some very odd requirements.
> > >=20
> > > > +{
> > > > +	uint8_t *b =3D data;
> > > > +	int zeros =3D 0;
> > > > +	int i;
> > > > +
> > > > +	for (i =3D 0; i < page_size; i++) {
> > > > +		zeros +=3D hweight8(~*b++);
> > > > +		if (zeros > max_zeros)
> > > > +			return -1;
> > > > +	}
> > > > +
> > > > +	if (zeros)
> > > > +		memset(data, 0xff, page_size);
> > >=20
> > > It seems like you're not considering the spare area at all. What =
if this
> > > is a mostly-blank page, with ECC data, but most of the bitflips a=
re in
> > > the spare area? Then you will "correct" this page to all 0xFF, no=
t
> > > noticing that this was really not a blank page at all.
> >=20
> > I could really use Angus' advice on this one.  Although, I fear he =
may
> > have disappeared into the cosmos.  If I remember correctly (I'm
> > getting rusty on this now), this controller doesn't allow access to
> > the spare area easily.  I think it's all handled automatically
> > i.e. without intervention.
>=20
> That's tough. It's pretty hard to support NAND without *any* access t=
o
> spare area.

I think we _can_ do it, via the second (Flex) interface, but it appears
to be readonly and we only do so when initially scanning/building the
BBTs.

I'm not sure I follow your example precisely.  When you say that most
of the bitflips are in the spare area, do you mean that there's usable
data in there?

> > > > +static int bch_block_markbad(struct mtd_info *mtd, loff_t offs=
)
> > > > +{
> > > > +	struct nand_chip *chip =3D mtd->priv;
> > > > +	struct nandi_controller *nandi =3D chip->priv;
> > > > +
> > > > +	uint32_t block;
> > > > +	int ret;
> > > > +
> > > > +	/* Is block already considered bad? (will also catch invalid =
offsets) */
> > > > +	ret =3D mtd_block_isbad(mtd, offs);
> > >=20
> > > You're violating some of the layering here; the low-level driver
> > > probably shouldn't be calling the high-level mtd_*() APIs.
> >=20
> > I'll try to figure out a way to keep the low-level code, low level.
>=20
> I was actually second-guessing my statement above after I wrote it.
> You'll notice that nand_bbt uses mtd_read() and mtd_read_oob().

Yes, I saw Pekon's comments, which completely countered your own.

> But then, this is all moot, because I'm pretty sure this check is
> redundant. Note in nand_block_markbad():
>=20
> 	ret =3D nand_block_isbad(mtd, ofs);
> 	if (ret) {
> 		/* If it was bad already, return success and do nothing */
> 		if (ret > 0)
> 			return 0;
>=20
> So I think you can drop any bad block check within bch_block_markbad(=
).

I'll look into this, thanks.

> > > > +#ifdef CONFIG_PM
> > >=20
> > > Should this be CONFIG_PM_SLEEP?
> > >=20
> > > > +static int stm_nand_bch_suspend(struct device *dev)
> > > > +{
> > > > +	struct nandi_controller *nandi =3D dev_get_drvdata(dev);
> > > > +
> > > > +	nandi_clk_disable(nandi);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +static int stm_nand_bch_resume(struct device *dev)
> > > > +{
> > > > +	struct nandi_controller *nandi =3D dev_get_drvdata(dev);
> > > > +
> > > > +	nandi_clk_enable(nandi);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int stm_nand_bch_restore(struct device *dev)
> > > > +{
> > > > +	struct nandi_controller *nandi =3D dev_get_drvdata(dev);
> > > > +	struct stm_plat_nand_bch_data *pdata =3D dev->platform_data;
> > > > +	struct stm_nand_bank_data *bank =3D pdata->bank;
> > > > +
> > > > +	nandi_init_controller(nandi, bank->csn);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static const struct dev_pm_ops stm_nand_bch_pm_ops =3D {
> > > > +	.suspend =3D stm_nand_bch_suspend,
> > > > +	.resume =3D stm_nand_bch_resume,
> > > > +	.restore =3D stm_nand_bch_restore,
> > > > +};
> > > > +#else
> > > > +static const struct dev_pm_ops stm_nand_bch_pm_ops;
> > >=20
> > > I think this might as well be:
> > >=20
> > > #define stm_nand_bch_pm_ops	NULL
> >=20
> > Actually, I think it's all better written with SET_SYSTEM_SLEEP_PM_=
OPS()
>=20
> Or even better, SIMPLE_DEV_PM_OPS().

SIMPLE_DEV_PM_OPS() doesn't support restore().

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
