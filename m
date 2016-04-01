From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] mtd: spi-nor: add an alternative method to support
 memory >16MiB
Date: Fri, 1 Apr 2016 13:38:52 -0700
Message-ID: <20160401203852.GD3645@localhost>
References: <1458556429-11741-1-git-send-email-cyrille.pitchen@atmel.com>
 <20160321170107.GG2545@google.com>
 <56F02C70.6050106@atmel.com>
 <20160321175537.GH2545@google.com>
 <56F12C24.6040206@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56F12C24.6040206-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 22, 2016 at 12:27:32PM +0100, Cyrille Pitchen wrote:
> Le 21/03/2016 18:55, Brian Norris a =E9crit :
> > On Mon, Mar 21, 2016 at 06:16:32PM +0100, Cyrille Pitchen wrote:
> >> Le 21/03/2016 18:01, Brian Norris a =E9crit :
> >>> On Mon, Mar 21, 2016 at 11:33:49AM +0100, Cyrille Pitchen wrote:
> >>>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/K=
config
> >>>> index d42c98e1f581..7fae36fc8526 100644
> >>>> --- a/drivers/mtd/spi-nor/Kconfig
> >>>> +++ b/drivers/mtd/spi-nor/Kconfig
> >>>> @@ -29,6 +29,18 @@ config MTD_SPI_NOR_USE_4K_SECTORS
> >>>>  	  Please note that some tools/drivers/filesystems may not work=
 with
> >>>>  	  4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
> >>>> =20
> >>>> +config MTD_SPI_NOR_USE_4B_OPCODES
> >>>> +	bool "Use 4-byte address op codes"
> >>>> +	default n
> >>>> +	help
> >>>> +	  This is an alternative to the "Enter/Exit 4-byte mode" comma=
nds and
> >>>> +	  Base Address Register (BAR) updates to support flash size ab=
ove 16MiB.
> >>>> +	  Using dedicated 4-byte address op codes for (Fast) Read, Pag=
e Program
> >>>> +	  and Sector Erase operations avoids changing the internal sta=
te of the
> >>>> +	  SPI NOR memory. Hence if a CPU reset occurs, early bootloade=
rs can
> >>>> +	  still use regular 3-byte address op codes and read from the =
very first
> >>>> +	  16MiB of the flash memory.
> >>>> +
> >>>
> >>> Why does this need to be a Kconfig option? Can't it just as well =
be
> >>> supported by keeping entries in the ID table, to show which flash
> >>> support these opcodes and which don't? Kconfig is really a bad me=
chanism
> >>> for trying to configure your flash.
> >>
> >> Well, the only reason why I've chosen a Kconfig option is to be as=
 safe as
> >> possible, if for some reason someone still wants to use the former
> >> implementation. Honestly I don't know why one would do so but I'm =
cautious
> >> so I also set "default n". This way no regression is introduced.
> >=20
> > I think the main reason is that some manufacturers did not initiall=
y
> > support both methods. So we couldn't just say "all Micron" or "all
> > Macronix" should use these opcodes. Spansion was the only one to su=
pport
> > them consistently. See [1] for reference.
> >=20
> > And actually, your Kconfig option is not "cautious", because you ha=
ve no
> > guarantee that people will make intelligent choices here. So you're
> > making a Kconfig that if someone accidentally turns it on, their fl=
ash
> > might not work any more. That's much less safe than properly labell=
ing
> > which flash supports which feature.
> >=20
> >> If you think it's better to use a dedicated flag like SECT_4K or
> >> SPI_NOR_QUAD_READ in the spi_nor_ids[] table, I'm perfectly fine w=
ith it as
> >> well.
> >=20
> > I think that would be better. (Really, an opt-out would be the leas=
t
> > work in the long-run I think, since IIRC there were only a few
> > early-generation flash that were both large enough to need 4 byte
> > addressing and didn't support the dedicated opcodes. But it'll be h=
ard
> > to track those down now I think, so opt-in probably is most practic=
al.)
> >=20
> >> Just let me know your choice then I'll update my patch accordingly=
 if needed.
> >=20
> > Brian
> >=20
> > [1]
> > commit 87c9511fba2bd069a35e1312587a29e112fc0cd6
> > Author: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Date:   Thu Apr 11 01:34:57 2013 -0700
> >=20
> >     mtd: m25p80: utilize dedicated 4-byte addressing commands
> >=20
>=20
> Indeed, your commit message is very interesting since it points out s=
ome issue
> I already face: for my test I'm currently using a Macronix MX25L25673=
G
> (JEDEC ID C22019). This memory *does* support the dedicated 4byte add=
ress op
> codes.
>=20
> Then if I look at the datasheet for the Macronix MX25L25635E, this ol=
der memory
> shares the exact same JEDEC ID, C22019 but *doesn't* support the 4byt=
e address
> op codes.
>=20
> None of these two memory types use ext id: the JEDEC ID is only 3byte=
 long.
> Anyway, in QPI mode, the QPIID command (0xAF), which replaces the reg=
ular
> Read ID command (0x9f) only sends 3 bytes too.
>=20
> The memory table inside the spi-nor framework is indexed by JEDEC ID =
(+ ext id)
> but we've just pointed out a case where it is not possible to create =
two
> different entries in this table, one for the 35E without the "4byte" =
flag, the
> other for 73G with the "4byte" flag.
>=20
> So there is no mean for the software to discover at runtime what are =
the actual
> capabilities of the memory. Hence I think we should introduce a DT pr=
operty
> which would clearly tell the spi-nor framework that we want to use th=
e
> dedicated 4byte address op codes instead of entering the 4byte addres=
s mode
> (still the default behaviour since older memories only support this m=
ode).

We don't absolutely need a new property. You could just support
"mxic,mx25l25673g" in the compatible property, and make sure that name
matching will override the ID matching. (Although, maybe this won't wor=
k
so well, since plenty of DT's erroneously have used "m25p80" even thoug=
h
they are not "m25p80" flash...)

> So what about a new DT named "m25p,4byte-opcodes" so the naming is co=
nsistent
> with the existing "m25p,fast-read"?

(I never liked the fast-read property, FWIW. It wasn't necessary.)

If we're choosing new properties, let's not make them "m25p", since
that's neither a vendor prefix, nor does it reflect its driver use case=
=2E
(We would support it for non-m25p80-based drivers.)

"spi-nor," might be a better prefix.

> For DT guys, I just sum the initial issue up: entering the 4byte addr=
ess mode
> as currently done changes the internal state of the SPI memory. If a =
SoC reset
> occurs, some early bootloaders not supporting this 4byte address mode=
 expect
> to use only 3byte addresses for (Fast) Read operations =3D> the boot =
is broken.
> Then using the dedicated 4byte address op codes fixes the issue as th=
ey don't
> change the internal memory state so early bootloader can still use 3b=
yte
> address op codes.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
