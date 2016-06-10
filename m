From: Ricard Wanderlof <ricard.wanderlof-VrBV9hrLPhE@public.gmane.org>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix
 NANDFLASH-CTRL
Date: Fri, 10 Jun 2016 16:40:39 +0200
Message-ID: <alpine.DEB.2.02.1606091313490.6751@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com> <20160603165909.09f27ee0@bbrezillon> <alpine.DEB.2.02.1606071702220.19416@lnxricardw1.se.axis.com> <20160609110814.78823ef3@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160609110814.78823ef3@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>, Linux mtd <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Thu, 9 Jun 2016, Boris Brezillon wrote:

> > > >  drivers/mtd/nand/Kconfig          |    6 +
> > > >  drivers/mtd/nand/Makefile         |    1 +
> > > >  drivers/mtd/nand/evatronix_nand.c | 1909 +++++++++++++++++++++=
++++++++++++++++
> > > >  3 files changed, 1916 insertions(+)
> > > >  create mode 100644 drivers/mtd/nand/evatronix_nand.c =20
> > >=20
> > > Please run checkpatch.pl and fix all the ERRORS and WARNINGS. =20
> >=20
> > I did run checkpatch.pl (at least the one in the mtd l2 tree), and =
there=20
> > should be no outstanding errors. Some of the warnings are related t=
o lines=20
> > ...
> >=20
>=20
> Well, I'm not asking to fix all 80 chars warnings, but I see a lot of
> warnings and errors in there [1], and I'm pretty sure most of them ca=
n
> be addressed in a sane way.

Whoa, something must have gone seriously wrong when I mailed out the=20
patch. When I run checkpatch.pl locally on the patch file, I have 0 err=
ors=20
and 10 warnings (not 128 errors and 65 warnings).

I tired mailing the patch to myself, extracting it from the incoming=20
email, and comparing with the original patch file and they were identic=
al.=20
I must check up if something has gone amiss with our external email her=
e,=20
as we haven't had problems before. I'll need to look into this. I would=
=20
certainly not submit a patch with any checkpatch.pl errors unless they=20
were really false positives.

> > > > +#undef POLLED_XFERS /* Use polled rather than interrupt based =
transfers */
> > > > +
> > > > +#undef CLEAR_DMA_BUF_AFTER_WRITE /* Useful for debugging */ =20
> > >=20
> > [ ... ]
> > The rationale for leaving this code in is that it can help bring up=
 a new=20
> > unknown system with this IP, because I consider the most likely re-=
use of=20
> > this driver to be for someone who is developing a new SoC, as it se=
ems=20
> > rather uncommon in commercially available chips.
>=20
> That's not how it works. Either you provide a sane way to activate
> these options (using Kconfig entries), or your drop dead-code section=
s.
>=20
> I understand that debugging is important to you, but adding hundreds
> lines of unused code is also hurting readability, so I keep thinking
> that these options should either be removed (with the associated code
> sections) or exposed as Kconfig options.

Ok, I'll give it some consideration and fix it either way.

> > > > +/* DMA buffer for page transfers. */
> > > > +#define DMA_BUF_SIZE (8192 + 640) /* main + spare for 8k page =
flash */ =20
> > >=20
> > > This should clearly be dynamic. =20
> >=20
> > 8k pages are the largest the controller can handle, and there's onl=
y a=20
> > [  ... ]
>=20
> If you reject all NAND above 8k + 640 oob bytes I'm fine with this
> fixed size.

Ok, I see what you're getting at. Yes, there needs to be a check for th=
at,=20
somewhere.

> > > I'm pretty sure you can implement ->cmd_ctrl() and rely on the de=
fault
> > > cmdfunc() logic instead of manually converting those high-level N=
AND
> > > commands into your own model (which seems to match pretty much th=
e =20
> > > ->cmd_ctrl() model, where you can get the number of address and c=
ommand =20
> > > cycles).
> > > [ ... ]
>=20
> Just to be clear, you don't have to toggle the pins each time
> ->cmd_ctrl() is called, you can cache the operations and launch it on=
ce
> it says it's dones (don't remember the flag).
>

I've omitted comments to this here as the discussion has been carried o=
n=20
in the sub thread started by Mychaela.

> > > > +/* Information common to all chips, including the NANDFLASH-CT=
RL IP */
> > > > +struct nfc_info { =20
> > >=20
> > > Should inherit from nand_hw_ctrl (see the sunxi_nand driver)...
> > >  =20
> > > > +	void __iomem *regbase;
> > > > +	struct device *dev;
> > > > +	struct nand_hw_control *controller; =20
> > >=20
> > > ... and not point to it. =20
> >=20
> > Ok. I'm a bit unsure what you mean by 'inherit' though; in the sunx=
i=20
> > driver the struct nand_hw_controller is contained within the struct=
=20
> > sunxi_nfc, in my case there's a pointer to a single instance of a=20
> > nand_hw_control. I agree that my approach is wasteful on a dynamic=20
> > allocation and I have no problems changing it, but conceptually the=
re's=20
> > not much of a difference.
>=20
> There's a huge different. By embedding the nand_hw_control struct int=
o
> your nfc_info object you allow things like:
>=20
> static int get_nfc(struct nand_chip *chip)
> {
> 	return container_of(chip->controller, struct nfc_info,
> 			    controller);
> }
>=20
> This way you can retrieve the nfc_info object attached to the nand_ch=
ip.

Yes, of course ... or rather,

static int get_nfc(struct nand_hw_control *controller)

I see new what you mean by inherit. It all comes down to if struct=20
nfc_info is a specialized type of struct nand_hw_control, or if it just=
=20
refers to it. I had assumed it was the latter that was the paradigm.

In the driver in question it makes no practical difference as there is =
no=20
need to go from a nand_hw_control to an nfc_info (in fact, the=20
nand_hw_control is nevery really used explicitly, it tags along, only u=
sed=20
by the framework).

Still, I'm not trying to make an argument here, just trying to understa=
nd=20
what the underlying paradigm is. I'll move it inside as it clearly is=20
better in several respects.

> > > > +
> > > > +/* This is a global pointer, as we only support one single ins=
tance of the NFC.
> > > > + * For multiple instances, we would need to add nfc_info as a =
parameter to
> > > > + * several functions, as well as adding it as a member of the =
chip_info struct.
> > > > + * Since most likely a system would only have one NFC instance=
, we don't
> > > > + * go all the way implementing that feature now.
> > > > + */
> > > > +static struct nfc_info *nfc_info; =20
> > >=20
> > > Come on! Don't be so lazy, do the right thing. =20
> >=20
> > It's not a question of laziness, it was a conscious decision: why a=
dd=20
> > unnecessary bloat and complexity for a case that probably will neve=
r=20
> > occur? I can certainly change it if you think it's worth while of c=
ourse.
>=20
> It is. And you're okay bloating the code with dead-code, but not with
> implementing this in order to avoid singletons when it clearly
> shouldn't be?

I'm ok with bloating the code with something which I consider may be=20
useful, but I have reservations bloating it with something which I don'=
t=20
think will ever be used (and which could be added if the need arises=20
later) and furthermore is not possible to test and verify properly (as=20
there is in fact only one NAND controller on the platform on which I ca=
n=20
test this).

But I'm fine with adding it, I'm not really trying to knock it, just=20
explaining why it wasn't done in the first place. (I think I'm actually=
=20
reacting to the word 'lazy' here...).

> > > > +
> > > > +/* The timing setup is expected to come via DT. We keep some d=
efault timings
> > > > + * here for reference, based on a 100 MHz reference clock.
> > > > + */
> > > > +
> > > > +static const struct nfc_timings default_mode0_pll_enabled =3D =
{
> > > > +	0x0d151533, 0x000b0515, 0x00000046,
> > > > +	0x00150000, 0x00000000, 0x00000005, 0x00000015 }; =20
> > >=20
> > > Can you explain those magic values? =20
> >=20
> > Not really, the problem is that the agreement we have with the IP v=
endor=20
> > is that we may not disclose any documentation, outside of what is=20
> > absolutely necessary to write working code.
> >=20
> > A rationale is that anyone else wanting to use the driver will eith=
er be=20
> > designing their own SoC in which case they will have access to the=20
> > relevant documentation, or if they're using a SoC from someone else=
, the=20
> > SoC vendor will have to provide that information in order for the c=
hip to=20
> > be useful anyway.
>=20
> Hm, so I'll have a new table like that for each new SoC using this IP=
?

Yes, I would say that would be the case.

> I must say I don't like the idea, but let's address the other aspects
> first.

Ok.

> As said above, I'm planning to rework the NAND framework to
> support things like:
>=20
> struct nand_operation {
> 	u8 cmds[2];
> 	u8 addrs[5];
> 	int ncmds;
> 	int naddrs;
> 	union {
> 		void *out;
> 		const void *in;
> 	};
> 	enum nand_op_direction dir;
> }
>=20
> ->exec_op(struct nand_operation *op);
>=20
> This way the NAND controller would have all the necessary information
> to trigger the whole operation (omitted the ECC info on purpose, to
> make it clearer).
>=20
> But this is not there yet, and in the meantime, if possible, I'd pref=
er
> seeing drivers implementing the ->cmd_ctrl() function instead of
> overloading the default ->cmdfunc() implementation.

I see, I suppose that's because during the course of this the ->cmdfunc=
()=20
logic will be significantly changed, requiring corresponding changes in=
=20
drivers that do overload that function? Fair enough, that's a pretty go=
od=20
reason, probably more so than the alleged simplicity of the ->cmd_ctrl(=
)=20
interface.

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
