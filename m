From: Ricard Wanderlof <ricard.wanderlof-VrBV9hrLPhE@public.gmane.org>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix
 NANDFLASH-CTRL
Date: Thu, 9 Jun 2016 10:19:51 +0200
Message-ID: <alpine.DEB.2.02.1606071702220.19416@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com> <20160603165909.09f27ee0@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160603165909.09f27ee0@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux mtd <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi Boris,

Again, thanks for reviewing this.

On Fri, 3 Jun 2016, Boris Brezillon wrote:

> >  drivers/mtd/nand/Kconfig          |    6 +
> >  drivers/mtd/nand/Makefile         |    1 +
> >  drivers/mtd/nand/evatronix_nand.c | 1909 +++++++++++++++++++++++++=
++++++++++++
> >  3 files changed, 1916 insertions(+)
> >  create mode 100644 drivers/mtd/nand/evatronix_nand.c
>=20
> Please run checkpatch.pl and fix all the ERRORS and WARNINGS.

I did run checkpatch.pl (at least the one in the mtd l2 tree), and ther=
e=20
should be no outstanding errors. Some of the warnings are related to li=
nes=20
that are more than 80 characters which contain printouts which I don't=20
want to split as it makes them hard to grep for.

There is a warning regarding the KConfig entry though, which seems to=20
indicate that the description is missing - perhaps it just means that t=
he=20
help text is too short (although it's not shorter than many other NAND=20
drivers in the same file)?

There are a couple of BUG()s though which are all of the type 'things t=
hat=20
shouldn't happen' (e.g.. an enum having a value outside its range), so=20
there's no real way to recover, however, one could always return early=20
from the function in question and hope for the best.

I see now that there's a comment on an overly long line in the commit=20
message that I've missed, as is a function call that's one character ov=
er=20
the 80 character limit.

I usually consider checkpatch.pl to be of guidence rather than a sentin=
el=20
when it comes to warnings, but if you want a '0 warnings' approach I ca=
n=20
certainly accomplish that.

> > +#include <asm/dma.h>
> > +#include <linux/bitops.h> /* for ffs() */
> > +#include <linux/io.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/err.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of.h>
> > +#include <linux/slab.h>
> > +#include <linux/mtd/mtd.h>
> > +#include <linux/mtd/nand.h>
> > +#include <linux/mtd/concat.h>
> > +#include <linux/mtd/partitions.h>
> > +#include <linux/version.h>
>=20
> You seem to include a lot of things, and even asm headers. Please mak=
e
> sure you really need them.

Ok, will do.

> > +/* Some of this could potentially be moved to DT, but it represent=
s stuff
> > + * that is either untested, only used for debugging, or things we =
really
> > + * don't want anyone to change, so we keep it here until a clear u=
se case
> > + * emerges.
> > + */
> > +
> > +#undef NFC_DMA64BIT /* NFC hardware support for 64-bit DMA transfe=
rs */
> > +
> > +#undef POLLED_XFERS /* Use polled rather than interrupt based tran=
sfers */
> > +
> > +#undef CLEAR_DMA_BUF_AFTER_WRITE /* Useful for debugging */
>=20
> Then simply drop the code in those sections and add it back when it's
> been tested.

NFC_DMA64BIT is untested so I'll take it out.

CLEAR_DMA_BUF_AFTER_WRITE is useful when debugging (and tested), and=20
POLLED_XFERS is also tested but normally only used for debugging (if fo=
r=20
instance there's a problem with interrupts). I don't really like to thr=
ow=20
out code that's useful because it's unnecessary work to have to put it =
in=20
again when the need arises. I could change the wording in the comment t=
o=20
make it clearer though (especially after having removed NFC_DMA64BIT) i=
f=20
that is enough?

The rationale for leaving this code in is that it can help bring up a n=
ew=20
unknown system with this IP, because I consider the most likely re-use =
of=20
this driver to be for someone who is developing a new SoC, as it seems=20
rather uncommon in commercially available chips.

> > +/* DMA buffer for page transfers. */
> > +#define DMA_BUF_SIZE (8192 + 640) /* main + spare for 8k page flas=
h */
>=20
> This should clearly be dynamic.

8k pages are the largest the controller can handle, and there's only a=20
single DMA buffer for the controller, so it's a very small amount of=20
memory, and I didn't feel it worth the complexity to reduce the size ju=
st=20
because a smaller paged flash was encountered. The driver uses the DMA=20
buffer to read the ID data so it needs a buffer anyway before the page=20
size has been determined. But if you feel it's important I can rework i=
t -=20
there would have to be two buffers, one smaller one for reading the ID =
and=20
a larger one subsequently allocated for page data.

> > +
> > +/* Debugging */
> > +
> > +#define MTD_TRACE(FORMAT, ...) pr_debug("%s: " FORMAT, __func__, #=
# __VA_ARGS__)
>=20
> Hm, I'm not a big fan of those custom pr_debug() macros, but if you
> really wan to keep it you shouldn't prefix it with MTD_.

Ok. I was thinking about replacing it with pr_debug straight off, but s=
aw=20
that there were other drivers with custom debug macros so I left it in.=
=20
I'll replace it with pr_debug then.

> Reading at the code I see a lot of MTD_TRACE() calls, while I'm not
> against debug traces, it seems to me that you've kept traces you used
> while developing/debugging your implementation. Can you clean it up a=
nd
> keep only the relevant ones.

It's true that the debug traces were initially created during driver=20
development, however I have gone through the debug printouts and consid=
er=20
the ones remaining to be relevant, especially if one is trying to debug=
 a=20
new previously untested system with this IP. Was there any particular=20
one(s) you were thinking of?

> > +	MAKE_COMMAND(_SEQ_14, INPUT_SEL_SIU, DATA_SEL_FIFO, \
> > +		NAND_BLOCK_ERASE, NAND_BLOCK_ERASE_END, _DONT_CARE)
> > +
> > +/* Assembled values for putting into GEN_SEQ_CTRL register */
> > +
> > +/* General command sequence specification for 4 cycle PAGE_READ co=
mmand */
> > +#define GEN_SEQ_CTRL_READ_PAGE_4CYCLE \
> > +	MAKE_GEN_CMD(1, 0, 1, 0,	/* enable command 0 and 2 phases */ \
> > +		     2, 2,		/* col A0 2 cycles, row A0 2 cycles */ \
> > +		     0, 0,		/* col A1, row A1 not used */ \
> > +		     1,			/* data phase enabled */ \
> > +		     _BUSY_0,		/* busy0 phase enabled */ \
> > +		     0,			/* immediate cmd execution disabled */ \
> > +		     _DONT_CARE)	/* command 3 code not needed */
> > +
> > +/* General command sequence specification for 4 cycle PAGE_PROGRAM=
 command */
> > +#define GEN_SEQ_CTRL_WRITE_PAGE_4CYCLE \
> > +	MAKE_GEN_CMD(1, 1, 0, 0,	/* enable command 0 and 1 phases */ \
> > +		     2, 2,		/* col A0 2 cycles, row A0 2 cycles */ \
> > +		     0, 0,		/* col A1, row A1 not used */ \
> > +		     1,			/* data phase enabled */ \
> > +		     _BUSY_1,		/* busy1 phase enabled */ \
> > +		     0,			/* immediate cmd execution disabled */ \
> > +		     _DONT_CARE)	/* command 3 code not needed */
>=20
> I think I already commented on that last time a driver for the same I=
P=20
> was submitted by Oleksij.

(Just to clarify: this doesn't have any bearing on this particular issu=
e,=20
but the SoC Oleksij submitted a driver for used a rather different=20
(probably older) version of the same IP. The only documentation I saw f=
or=20
that SoC was the IP register map, and there were several differences in=
=20
not only the register addresses but also the available registers and bi=
t=20
fields, and it did not look like one was a subset of the other. So it=20
looked more like the IP vendor had done an at least partial rewrite of =
the=20
internal logic between the two versions.)

> I'm pretty sure you can implement ->cmd_ctrl() and rely on the defaul=
t
> cmdfunc() logic instead of manually converting those high-level NAND
> commands into your own model (which seems to match pretty much the
> ->cmd_ctrl() model, where you can get the number of address and comma=
nd
> cycles).
>=20
> Maybe I'm wrong, but I think it's worth a try, and if it works, it
> would greatly simplify the driver.

It's not so much trying as reading the manual for the IP. :-)

The problem here is that the ->cmd_ctrl() logic assumes that you can pa=
ss=20
single bytes transparently via the IP and also directly control the sta=
te=20
of the ALE and CLE lines, as well as set up data transfers independentl=
y=20
of that, none of which is not possible with this IP. Instead, the IP=20
offers a number of fixed interface sequences, some more programmable th=
an=20
others, a subset of which are used in this driver, which do all the hea=
vy=20
lifting. There is for instance no sequence which just writes or reads d=
ata=20
to or from the flash, there's always at least a command write (CLE)=20
included.

(The command definitions in the macro sections are more or less direct=20
translations from a table and section in the IP manual describing how t=
o=20
accomplish various functions.)

If there had been a transparent mode I would certainly have gone that=20
route, at least initially, rather than mess about with all this control=
ler=20
specific stuff. I think that's why Oleksij arrived at a similar solutio=
n=20
(or possibly he used a non-Linux driver as a starting point).

The designers of this IP apparantly did not have Linux in mind when the=
y=20
designed the controller, since it does all the low level stuff=20
autonomously (in the right IP configuration it can even remap flash blo=
cks=20
transparently), with no way of intervening. For instance, when doing=20
hardware ECC, the OOB data is not available anywhere to the user, and i=
f=20
one wants to actually read it a separate OOB write needs to be done. I=20
think the target market for the IP is really a general real time OS whe=
re=20
there is no NAND driver available, and you just want to fire off a sing=
le=20
high level command, wait for an interrupt, and have your data waiting f=
or=20
you.

This latter property is actually advantageous in Linux too as the drive=
r=20
doesn't have to do bit- and byte-banging against the NAND flash. I'm no=
t=20
sure what the gain in overhead is in practice, but at any rate there's =
not=20
much of a choice.

> > +/* Information common to all chips, including the NANDFLASH-CTRL I=
P */
> > +struct nfc_info {
>=20
> Should inherit from nand_hw_ctrl (see the sunxi_nand driver)...
>=20
> > +	void __iomem *regbase;
> > +	struct device *dev;
> > +	struct nand_hw_control *controller;
>=20
> ... and not point to it.

Ok. I'm a bit unsure what you mean by 'inherit' though; in the sunxi=20
driver the struct nand_hw_controller is contained within the struct=20
sunxi_nfc, in my case there's a pointer to a single instance of a=20
nand_hw_control. I agree that my approach is wasteful on a dynamic=20
allocation and I have no problems changing it, but conceptually there's=
=20
not much of a difference.

> > +
> > +/* What we tell mtd is an mtd_info actually is a complete chip_inf=
o */
> > +#define TO_CHIP_INFO(mtd) ((struct chip_info *)(mtd_to_nand(mtd)))
>=20
> Ouch! Please, don't do that, container_of() is here for a good reason=
=2E
> And prefer static inline functions over macros for this kind of thing=
s.
>=20
> static inline struct chip_info *mtd_to_chip_info(struct mtd_info *mtd=
)
> {
> 	return container_of(mtd_to_nand(mtd), struct chip_info, chip);
> }

Ok. Will change.

> > +
> > +/* This is a global pointer, as we only support one single instanc=
e of the NFC.
> > + * For multiple instances, we would need to add nfc_info as a para=
meter to
> > + * several functions, as well as adding it as a member of the chip=
_info struct.
> > + * Since most likely a system would only have one NFC instance, we=
 don't
> > + * go all the way implementing that feature now.
> > + */
> > +static struct nfc_info *nfc_info;
>=20
> Come on! Don't be so lazy, do the right thing.

It's not a question of laziness, it was a conscious decision: why add=20
unnecessary bloat and complexity for a case that probably will never=20
occur? I can certainly change it if you think it's worth while of cours=
e.

> > +
> > +/* The timing setup is expected to come via DT. We keep some defau=
lt timings
> > + * here for reference, based on a 100 MHz reference clock.
> > + */
> > +
> > +static const struct nfc_timings default_mode0_pll_enabled =3D {
> > +	0x0d151533, 0x000b0515, 0x00000046,
> > +	0x00150000, 0x00000000, 0x00000005, 0x00000015 };
>=20
> Can you explain those magic values?

Not really, the problem is that the agreement we have with the IP vendo=
r=20
is that we may not disclose any documentation, outside of what is=20
absolutely necessary to write working code.

A rationale is that anyone else wanting to use the driver will either b=
e=20
designing their own SoC in which case they will have access to the=20
relevant documentation, or if they're using a SoC from someone else, th=
e=20
SoC vendor will have to provide that information in order for the chip =
to=20
be useful anyway.

> > +
> > +/**** Utility routines. */
>=20
> Please use regular comments: /* */

Ugh. Yes, sorry.

> > +
> > +/* Count the number of 0's in buff up to a max of max_bits */
> > +/* Used to determine how many bitflips there are in an allegedly e=
rased block */
> > +static int count_zero_bits(uint8_t *buff, int size, int max_bits)
> > +{
> > +	int k, zero_bits =3D 0;
> > +
> > +	for (k =3D 0; k < size; k++) {
> > +		zero_bits +=3D hweight8(~buff[k]);
> > +		if (zero_bits > max_bits)
> > +			break;
> > +	}
> > +
> > +	return zero_bits;
> > +}
>=20
> We have an helper for that [1].

Great, I'll use that. (I don't think it existed when the first version =
of=20
this driver was written).

> > +
> > +/* Read and write NFC SFR registers */
> > +
> > +static uint32_t nfc_read(uint reg_offset)
> > +{
> > +	return readl_relaxed(nfc_info->regbase + reg_offset);
> > +}
> > +
> > +static void nfc_write(uint32_t data, uint reg_offset)
> > +{
> > +	/* Note: According to NANDFLASH-CTRL Design Specification, rev 1.=
14,
> > +	 * p19, the NFC SFR's can only be written when STATUS.CTRL_STAT i=
s 0.
> > +	 * However, this doesn't seem to be an issue in practice.
> > +	 */
> > +	writel_relaxed(data, nfc_info->regbase  + reg_offset);
> > +}
>=20
> Do you really want to use the _relaxed functions?

Yes, using _relaxed, together with explicit memory barriers in the DMA=20
routines has shown a 5% increase in flash read performance on an ARM=20
system, the reason being that on an ARM system the implicit memory barr=
ier=20
in the writel() call causes a fairly heavy penalty in terms of flushing=
=20
the L2 cache.

> > +	res =3D request_irq(irq, nfc_irq, 0, "evatronix-nand", nfc_info);
>=20
> devm_?

Yes, good catch, thanks!

> To be honest, your driver seems really complicated compared to what
> it's supposed to do, and I suspect it could be a lot simpler, but
> again, maybe I'm wrong.
>=20
> If you didn't try yet, please investigate the ->cmd_ctrl() approach,
> and if you did, could you explain why it didn't work out?

Given that the controller does not have the transparency that the=20
->cmd_ctrl() approach requires, as noted above, I can't see how it coul=
d=20
be simplified.

I basically need to grab everything needed for a given operation and=20
interpret it before handing it over to the controller. I considered usi=
ng=20
a higher level API, by replacing the default ->cmdfunc() (default=20
nand_command/nand_command_lp) with a specific version, which would have=
=20
avoided the need to interpret the NAND commands arriving via ->cmd_ctrl=
(),=20
but that meant duplicating some of the logic in nand_base.c which seeme=
d=20
like a bad idea.

> Can you please remove everything that is not strictly required and
> clean the things I pointed before submitting a new version.

Sure, but I would very much like some feedback on the points I've raise=
d=20
above before going on with that.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
