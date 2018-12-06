From: Tom Rini <trini@konsulko.com>
Subject: Re: Moving ARM dts files
Date: Thu, 6 Dec 2018 15:14:27 -0500
Message-ID: <20181206201427.GF32109@bill-the-cat>
References: <20181204183649.GA5716@bogus>
 <9c2b5528-679a-928e-3150-aa383a4f0405@suse.de>
 <CAL_JsqKO3v0pgVfNhVNOkpZ4sePrybDgZG0riN-tutvwOZ4zYg@mail.gmail.com>
 <2474284e-8a55-639f-2cfa-f811741099f3@suse.de>
 <CAL_JsqL4WoMqFCQ0vFd6z_i=9imnfVsQjeKOG8zxNwi5caneRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2574854137044547195=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqL4WoMqFCQ0vFd6z_i=9imnfVsQjeKOG8zxNwi5caneRQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Michal Simek <michal.simek@xilinx.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thierry Reding <thierry.reding@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Alexander Graf <agraf@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>, ARM-SoC Maintainers <arm@kernel.org>, Joel Stanley <joel@jms.id.au>, Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, Architecture Mailman List <boot-architecture@lists.linaro.org>, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============2574854137044547195==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qsoMWdMv/ifdm7CC"
Content-Disposition: inline


--qsoMWdMv/ifdm7CC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 06, 2018 at 01:06:43PM -0600, Rob Herring wrote:
> On Thu, Dec 6, 2018 at 7:32 AM Andreas F=E4rber <afaerber@suse.de> wrote:
> >
> > Am 05.12.18 um 05:17 schrieb Rob Herring:
> > > On Tue, Dec 4, 2018 at 7:22 PM Andreas F=E4rber <afaerber@suse.de> wr=
ote:
> > >>
> > >> Rob,
> > >>
> > >> Am 04.12.18 um 19:36 schrieb Rob Herring:
> > >>> I've put together a script to move the dts files and update the
> > >>> makefiles. It doesn't handle files not following a common prefix wh=
ich
> > >>> isn't many and some includes within the dts files will need some fi=
xups
> > >>> by hand.
> > >>>
> > >>> MAINTAINERS will also need updating.
> > >>>
> > >>> A few questions:
> > >>>
> > >>> Do we want to move absolutely everything to subdirs?
> > >>
> > >> This refactoring is a terrible idea!
> > >
> > > How do you really feel?
> > >
> > >> While it would've been nice to have more structure from the start,
> > >> bootloaders like U-Boot expect a flat structure for arm .dtb files n=
ow.
> > >> If you start installing them into subdirs instead, they won't find t=
he
> > >> files anymore under the hardcoded name.
> > >>
> > >> Doing this only for new platforms would be much less invasive and al=
low
> > >> to prepare bootloaders accordingly.
> > >
> > > That was my suggestion where this started for the new RDA platform.
> > > Olof preferred to move everything and that's my desire too.
> > >
> > >> Alternatively, white-list which ones
> > >> are safe to move around.
> > >
> > > I'd prefer to know which ones the distros don't want moved. That
> > > should be easier to figure out. We also need that anyways in context
> > > of what platforms we care about compatibility.
> > >
> > > Another option is dtbs_install target could flatten the installed
> > > dtbs. That is the only part the distros should depend on.
> >
> > I'd be okay with distinguishing source vs. install location. Due to the
> > issue I mention below (and more) we can't use install_dtbs for openSUSE
> > and had to reimplement it, which we'd need to (and can) adjust.
>=20
> What would be needed for dtbs_install to work? arm64 needs to support
> a flat install? If it doesn't work for Debian or openSUSE, I'm not
> sure why we have it. So I'd like to make it work.
>=20
> > >> But don't just script a refactoring because it
> > >> looks nicer in the source tree, without testing what side effects th=
is
> > >> can have for board/distro users of the compiled files in practice.
> > >> We already had that discussion for arm64 because Debian chose to ign=
ore
> > >> the kernel-installed subdirectories and installed .dtb files into a =
flat
> > >> directory, which collided with openSUSE sticking to the kernel choic=
e.
> > >
> > > So everyone already deals with subdirs or not with arm and arm64
> > > already, seems like they can deal with this. I will raise the topic on
> > > the cross-distro list though.
> >
> > Sounds like you're twisting words... The keyword was "hardcoded" paths -
> > one way or another (not "and") depending on the kernel choices being
> > flat for arm, vendor subdir for arm64.
> >
> > >> This topic becomes even more important with EBBR: There is neither a
> > >> mechanism in place to sync .dts files into U-Boot or EDK2 source tre=
es,
> > >> nor are capsule updates implemented in U-Boot for easily deploying s=
uch
> > >> bootloaders with new .dts sources or paths yet.
> > >
> > > EBBR actually says firmware (including dtbs) goes in directories named
> > > by vendor.
> >
> > Fine, but unrelated.
>=20
> If the distros want dtbs in a flat dir and EBBR says otherwise, then
> it is related.
>=20
> > >> And I can assure you
> > >> that just getting users to dd the right bootloader can be difficult.=
=2E.
> > >> Since DT forward and backward compatibility is often being neglected,
> > >> for example with optional properties or renamed compatibles that bre=
ak
> > >> booting with previous drivers, new kernel versions often need updated
> > >> Device Trees to make use of new/enhanced drivers. Therefore it is
> > >> unfortunately often enough a necessity to load newer kernel-based .d=
tb
> > >> files matching the kernel (as opposed to the dream of kernel-indepen=
dent
> > >> hardware descriptions) when working with the latest -rc or -next ker=
nels
> > >> at least. For examples of DTs needing updates, look no further than
> > >> Linaro's 96boards - in case of hikey960/EDK2 GRUB is another layer w=
here
> > >> .dtb paths may be hardcoded, ditto for arm; and Armada was an example
> > >> where the upstream bindings for the network IP changed incompatibly.
> > >
> > > Compatibility is an issue, yes, but that really has nothing to do wit=
h this.
> > >
> > >> DT overlays are another topic that is not making any progress upstre=
am
> > >> according to the ELCE BoF, so beyond the Raspberry Pi the only known
> > >> working way to apply them is to write a U-Boot boot.scr script, which
> > >> can either reuse $fdtcontroladdr DT or use the filename $fdtfile or
> > >> hardcode one, the latter two of which would break with your renaming.
> > >
> > > DT overlays also have nothing to do with this as there aren't any in
> > > the kernel. I'm not inclined to take any either with a flat tree.
> > > We're already at 1800+ files.
> >
> > Read again: a) Breaking DT changes and b) the desire to use Overlays
> > instead of replacing the bootloaders for each change are _reasons_ why
> > people depend on .dtb filenames from the kernel source tree for their
> > boot flow today. Nothing to do with downstream .dtbo files.
> >
> > For example, remember when I reported that the kernel didn't compile DTs
> > with -@? No reaction except for Frank asking to be CC'ed - was it ever
> > fixed??? Do EDK2's or U-Boot's built-in DTs compile with -@ today?
>=20
> IIRC, Frank objected to changing this globally because it will bloat
> all dtbs. And then no one did the work to make it a per dtb option.
> Maybe that was the same issue in another thread.

Being the author of one of the patches to pass in -@ so we could have
overlays work out of the box, no, there was some other problem with
making it only happen for some sub-set of DTBs.  AFAIK the current
answer is the one of a few years ago that no, if you want symbols for
overlays to work you pass in ..whatever it is.. so that -@ is passed in.
In the end it felt like there was more concern over the core concept
than anything else and I moved along due to other pressing concerns.

--=20
Tom

--qsoMWdMv/ifdm7CC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcCYMjAAoJEIf59jXTHXZSAlMP+wQRa528Lnj8yKqRVJCmsFIW
okoqhYa/rYA6tuE8wqpnhdkkUJzOmNL5big6N9lmTddyloz2/B5iFX43BahR8l4m
j4lw09VOR0xJ9+Z7SNzSAveJIMPUhNnUjq6B6FDU2vxbfBCpepuOeloVVcJ2Bq4+
N9rIhUg/P/4Y7T0ySLDp8UbzZR+DaUru/p0R1KDnR+dKstTguBYRXUUCzHdv2hIc
AZXDo7UfxRlJ9maQp+w/E8Uu13blybZ5AOJzkMdRmNz183Yypr3tmk5P96znRqkG
f8KI2FzdOb957TmbstAfRP1MWPOdbfR24EjuhjI9aTB1Z9wbuseFQBazzL3fQpk3
NnphH4KGfmKUny9gVfueVmb2gl3qhaJdxrTwOmLDRwju18rz4L7GK+02XRgfLY7L
CZVhaNZNAkyx3p0BD8WCwEnIhjqrlGBhsLVDPLoiozhkAK9QWqxYtD2u7aceOThP
6dut24HMPS0A3XzzWFAjA1bonKHArqH3NracsRMeHtOVqOvfyCe+KCRfdHXbdlaX
MW8sEpcu7pVcZjaIgi9XUGA+8nr0MAFbWwR7zfdWywJxzjQBRRSxzCOCS1egrxU0
kKtz2sgSYnS/95d4HlTa7NEl0xKE84pWeqM2tTyVmLxqfZH0ziyQ5YmdvuMxG1Dx
UsGzl5dEhDXFxCCFEu+z
=G9eu
-----END PGP SIGNATURE-----

--qsoMWdMv/ifdm7CC--


--===============2574854137044547195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2574854137044547195==--
