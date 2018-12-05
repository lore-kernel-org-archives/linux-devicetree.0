From: Tom Rini <trini@konsulko.com>
Subject: Re: Moving ARM dts files
Date: Wed, 5 Dec 2018 12:33:21 -0500
Message-ID: <20181205173321.GL32109@bill-the-cat>
References: <20181204183649.GA5716@bogus>
 <9c2b5528-679a-928e-3150-aa383a4f0405@suse.de>
 <CAL_JsqKO3v0pgVfNhVNOkpZ4sePrybDgZG0riN-tutvwOZ4zYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0754331019140123040=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqKO3v0pgVfNhVNOkpZ4sePrybDgZG0riN-tutvwOZ4zYg@mail.gmail.com>
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


--===============0754331019140123040==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SCOJXUq1iwCn05li"
Content-Disposition: inline


--SCOJXUq1iwCn05li
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 04, 2018 at 10:17:15PM -0600, Rob Herring wrote:
> On Tue, Dec 4, 2018 at 7:22 PM Andreas F=E4rber <afaerber@suse.de> wrote:
> >
> > Rob,
> >
> > Am 04.12.18 um 19:36 schrieb Rob Herring:
> > > I've put together a script to move the dts files and update the
> > > makefiles. It doesn't handle files not following a common prefix which
> > > isn't many and some includes within the dts files will need some fixu=
ps
> > > by hand.
> > >
> > > MAINTAINERS will also need updating.
> > >
> > > A few questions:
> > >
> > > Do we want to move absolutely everything to subdirs?
> >
> > This refactoring is a terrible idea!
>=20
> How do you really feel?
>=20
> > While it would've been nice to have more structure from the start,
> > bootloaders like U-Boot expect a flat structure for arm .dtb files now.
> > If you start installing them into subdirs instead, they won't find the
> > files anymore under the hardcoded name.
> >
> > Doing this only for new platforms would be much less invasive and allow
> > to prepare bootloaders accordingly.
>=20
> That was my suggestion where this started for the new RDA platform.
> Olof preferred to move everything and that's my desire too.

I think we might really be stuck with "new stuff only in subdirs".
There's a whole huge world out there that depends on these layouts and
it's almost but not quite like the API vs ABI thing.  You can change the
kernel API at whim but this is something with a lot of external users,
and those folks aren't supposed to get broken.

> > Alternatively, white-list which ones
> > are safe to move around.
>=20
> I'd prefer to know which ones the distros don't want moved. That
> should be easier to figure out. We also need that anyways in context
> of what platforms we care about compatibility.
>=20
> Another option is dtbs_install target could flatten the installed
> dtbs. That is the only part the distros should depend on.

But it's not just "the distros" that'll get bit by this too.  Or rather,
it's the "big distros" and all the OpenEmbedded/buildroot/etc ones too
that follow off the built-in logic to find the DTB that'll get bit too
with a rename.

[snip]
> > DT overlays are another topic that is not making any progress upstream
> > according to the ELCE BoF, so beyond the Raspberry Pi the only known
> > working way to apply them is to write a U-Boot boot.scr script, which
> > can either reuse $fdtcontroladdr DT or use the filename $fdtfile or
> > hardcode one, the latter two of which would break with your renaming.
>=20
> DT overlays also have nothing to do with this as there aren't any in
> the kernel. I'm not inclined to take any either with a flat tree.
> We're already at 1800+ files.

I'm going to do my best to not hijack the thread to be about overlays
but that's a whole chicken and egg type problem too.  But yes, it's not
exactly related to moving or not existing dts/dtb files but something
about where / how those are to be stored and maintained really does need
to be done.

--=20
Tom

--SCOJXUq1iwCn05li
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcCAvhAAoJEIf59jXTHXZSBDkQALPsGn2VgmtrjhQ3YBThdwnC
2UBQNGp7KNhYXT65ENfzLCbTsS8BG7ADszYJaeb98idjG0DijRTIVPLEE7tsKW3v
MjWMOn77VHQtYmI03zrb+u79/OFCIO0SyeAlLuXUgzdptAPawZ4HFebrx3EYLb5O
XLduIttU1faQ4Y1gUjlkgrY8BC7VQRSGT83NlZhVSs6LKU3O1eTcips72IQEKwTU
wyhCHyZN8P/qnSHa9+rPO0cOS8MYcxZteHgTbRVPArml+Lu9pMishKGJ5QbMdL7+
Sn3gOb5Cu5/0x0aoe07LdAiGCOksHfUL21IXwvYwSaUepM9OG24Qv6VT54PZVbwa
YRHyFNpPbF2SBYZm0vkWyvhtW4jKISmF5HKXm3caacsmcDP4jqBTzeGCsp5MBlVK
lYlyYcs3OW/tHpr1/kVCXoRftU7xXRgu4MPwwur/LVUlLkuwJiqvKgyXdFIesneK
yqZotyLzQnWzp7WpzY8sLSN1vGmsurTTHlTO3kMHvl198A9TDkXxO4u87e3uHlRo
R2V6AQbEKZRpxTJOfJ9+vtVNPipzQ0Fd57oFnBp8OaGpAM5klkH49JD6IlZpm4Lw
WRH/+bowLv4u4rmtbJMkW4yINONFwaHM/zzFQDdq+j0nxuQZHKYZXwofbSOR33af
cj8w5aF8D2kKSo0Nki3+
=+3KH
-----END PGP SIGNATURE-----

--SCOJXUq1iwCn05li--


--===============0754331019140123040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0754331019140123040==--
