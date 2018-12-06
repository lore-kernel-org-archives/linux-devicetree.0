From: Mark Brown <broonie@kernel.org>
Subject: Re: Moving ARM dts files
Date: Thu, 6 Dec 2018 20:06:52 +0000
Message-ID: <20181206200652.GB3084@sirena.org.uk>
References: <20181204183649.GA5716@bogus>
 <9c2b5528-679a-928e-3150-aa383a4f0405@suse.de>
 <CAL_JsqKO3v0pgVfNhVNOkpZ4sePrybDgZG0riN-tutvwOZ4zYg@mail.gmail.com>
 <2474284e-8a55-639f-2cfa-f811741099f3@suse.de>
 <CAL_JsqL4WoMqFCQ0vFd6z_i=9imnfVsQjeKOG8zxNwi5caneRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3299395466157933977=="
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Michal Simek <michal.simek@xilinx.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thierry Reding <thierry.reding@gmail.com>, Tom Rini <trini@konsulko.com>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Alexander Graf <agraf@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>, ARM-SoC Maintainers <arm@kernel.org>, Joel Stanley <joel@jms.id.au>, Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, Architecture Mailman List <boot-architecture@lists.linaro.org>, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux>
List-Id: devicetree@vger.kernel.org


--===============3299395466157933977==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 06, 2018 at 01:06:43PM -0600, Rob Herring wrote:
> On Thu, Dec 6, 2018 at 7:32 AM Andreas F=E4rber <afaerber@suse.de> wrote:

> > I'd be okay with distinguishing source vs. install location. Due to the
> > issue I mention below (and more) we can't use install_dtbs for openSUSE
> > and had to reimplement it, which we'd need to (and can) adjust.

> What would be needed for dtbs_install to work? arm64 needs to support
> a flat install? If it doesn't work for Debian or openSUSE, I'm not
> sure why we have it. So I'd like to make it work.

Correct me if I'm wrong but as far as the flat vs directory thing goes
isn't the issue that this winds up being a rename for an existing 32 bit
system?  If you just install the dtbs in the default location then a
bootloader or whatever that is hard coded to look for foo-bar.dtb won't
see the new foo/foo-bar.dtb (or whatever) and will continue to use the
old binary.  It's not the fact that that it's in a directory, it's the
fact that the bootloader sees the name it needs to look for change (if
it's looking on a filesystem at all).  This isn't a problem for arm64 as
the location isn't changing, it's used directories from day one.

The issues with the existing install_dtbs sounded unrelated to this.

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlwJgVsACgkQJNaLcl1U
h9CqNwf9Gd73ZBcBjAwmF4saOk7WmzgGXQCXdhUUOnAY1Jo8QsooXGgxUqlWuzd8
TVYX6Cyd4QmOYYKZ/X50+s/JTKlKcR2NfAL003qLVxFCuxC2U4xN3O2qytr9PiQU
t+EA7r991KUdwehZKtovl4xahmZX+D+AkXPJJTFZ7cClXzgvTtskN9uECqUdqF+Z
0zwde297uq3FzgYgmLD3AXHqKMThXYM5gdF/D3ttL1tqRIESyJUGPsjVPPZz/pxm
nmHwWzUT5TAjSGCo1dDia+yrpAoeh6qpiWSYuW811jJBJrX1CcphlBYK6BHTZXc8
8q44jLd5ZlvOjJKxcAcyqTB1FhmW7w==
=3s4t
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--


--===============3299395466157933977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3299395466157933977==--
