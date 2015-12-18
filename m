From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH linux-next 0/5] mtd: spi-nor: add driver for Atmel QSPI
 controller
Date: Thu, 17 Dec 2015 16:29:01 -0800
Message-ID: <20151218002901.GE10460@google.com>
References: <cover.1449494420.git.cyrille.pitchen@atmel.com>
 <20151207193441.GO120110@google.com>
 <A765B125120D1346A63912DDE6D8B6310BF53437@NTXXIAMBX02.xacn.micron.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF53437-xjs9rfTec9KBtk7LW/CC8tTcztV8WXajQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo-AL4WhLSQfzjQT0dZR+AlfA@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "marex-ynQEQJNshbs@public.gmane.org" <marex-ynQEQJNshbs@public.gmane.org>, "vigneshr-l0cyMroinI0@public.gmane.org" <vigneshr-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Bean,

On Tue, Dec 08, 2015 at 06:21:00AM +0000, Bean Huo =E9=9C=8D=E6=96=8C=E6=
=96=8C wrote:
> > -----Original Message-----
> > From: Brian Norris [mailto:computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> >=20
> > I'll admit I'm a little fuzzy on the differences between dual and q=
uad modes on
> > various flash manufacturers. Can you help clear it up for me?
>=20
> For Micron SPI NOR spi quad mode, means that Qaud I/O prototocol, it =
follows I/O
> Bus width is command-address-Data 4-4-4, at this time, DQ0,DQ1,DQ2,DQ=
3
> are all used to transfer address/command/data. For this maybe not the=
 same between
> different flash manufactures. For example, for Spansion Qspi NOR, its=
 all instructions are
> transferred from host to memory as a single bit serial sequence on th=
e DQ0 signal, even under
> Quad mode.  Dual mode the same as Qaud mode scenario.
>=20
> for SPI NOR 1-1-4, means command and address are transferred on the D=
Q0,
> but for data, being transferred on DQ0,DQ1,DQ2,DQ3.For this, it is th=
e same
> between different flash manufacturers. Of course, at this moment, SPI=
 NOR
> should work under extended I/O mode.

OK, so to make these statements *much* shorter:

 * Micron "Quad Mode" means putting the flash in a 4/4/4 mode

 * Spansion (and all others?) are using 1/1/4 modes

Correct?

> > I think some of the comments on patch 2 help too, but I'll just com=
ment here
> > for now.
> > It looks like the current driver has problems regarding the non 1-x=
-y modes
> > (e.g., 4-4-4), right? But I see that spi-nor.c never tries to send =
a 4_4_4
> > command; it only sets read_opcode to SPINOR_OP_READ_1_1_{1,2,4}. So=
 is
> > this an oversight in patches like Bean's patch?
>=20
> For SPINOR_OP_READ_1_1_{1,2,4} commands, Spi NOR actually works under
> Extended I/O mode, not Quad mode. They just push Spi NOR output data =
by Quad mode,
> Command and address still following extended I/O mode.

The naming is confusing enough here... so in your words, "extended"
means 1/1/{1,2,4} (i.e., command, and maybe address, use 1 line, but
data goes on 4)? And "quad" means 4/4/4?

> For 4-4-4 I/O protocol, SPI NOR should change to Quad mode(just as my=
 patch),=20
> of course, SPI controller should support this. for Micron Qspi NOR, u=
nder quad mode,
> all commands/address/data are transferred on DQ0,DQ1,DQ2,DQ3 signals.=
 No matter what
> kind of command.=20

OK, so I think your patch is broken:

> >     commit 548cd3ab54da ("mtd: spi-nor: Add quad I/O support for Mi=
cron
> >     SPI NOR")

How did you test this? Specifically, this can't possibly have worked
with a regular drivers/spi/ controllers, since:

 (a) you're enabling 4/4/4 (i.e., "Quad mode") on the flash but
 (b) m25p80_read() only sets .rx_bits for the data; i.e., it's using
 1/1/4 (i.e., "Extended mode")

I'm tempted to essentially revert that, as it looks essentially
untested. It would be nice to have a cleaner baseline before trying to
extend it with Cyrille's work.

Cyrille, what do you think? Is my analysis at all correct here? (Sorry
if this is addressed elsewhere; there's a lot of text in this
conversation, but I'm getting hung up very early.) And if so, does it
hurt to just drop Micron "Quad mode" (4/4/4)?

(AIUI, this won't exactly be a panacea, since you mention bootloaders
that start us off in quad mode, so we can't use single I/O 0x9f READ
ID.)

> > Why would we even need to enable quad modes like that, if we're not=
 going
> > to send the 4-4-4 opcodes?
> I think, in order to high speed SPI NOR, after enable quad mode,=20
> SPINOR_OP_READ_1_1_{1,2,4} commands don't need any more, normal read =
command (0x03)
> Can implement as them.

OK. That's odd, but I guess it doesn't matter much. It just makes it a
little less obvious what's going on.

> > My next question (if my understanding is roughly correct) is, do we=
 need the
> > 4-4-4 modes, and what risks come with them? I understand we can sho=
rten
> > the command and address phases, but does that alone yield much
> > performance benefit? And I think the risk is that a given system mi=
ght not be
> > prepared for the flash to be in a 4-4-4 mode, if the boot code trie=
s to use 1-x-y
> > commands.
>=20
> As far as my current experience and knowledge, this still need to be =
enabled, especially for
> fast boot, and some IOT devices to store info into SPI NOR.

Do you have any data to about the speed? And you haven't addressed the
risks. There are definitely risks. Cyrille looks like he's trying to
address the risks (e.g., use volatile modes whenever possible), but it
doesn't seem that you are.

> For this patches, my current concern is that host side how to get dif=
ferent I/O protocol changes,
> and distinguish between different flash manufacturers I/O mode.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
