From: Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH v3 01/11] dm: serial: Update binding for PL01x
 serial UART
Date: Thu, 13 Aug 2015 14:13:46 -0400
Message-ID: <20150813181346.GS25532@bill-the-cat>
References: <1438954951-13329-1-git-send-email-sjg@chromium.org>
 <1438954951-13329-2-git-send-email-sjg@chromium.org>
 <CACRpkdZa2O1MqCVT8q2P0u0ciXK+6HFbQQGXB_-chimg=FbzQg@mail.gmail.com>
 <CAPnjgZ3V1KS7POEhsvj63OSB29MUtyaZGBoFR8JGPnaN=-fXVw@mail.gmail.com>
 <55CCBFB2.7050301@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0779600303=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <55CCBFB2.7050301@wwwdotorg.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, U-Boot Mailing List <u-boot@lists.denx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joe Hershberger <joe.hershberger@ni.com>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org


--===============0779600303==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dBjx7dyGPdVN2luf"
Content-Disposition: inline


--dBjx7dyGPdVN2luf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2015 at 10:02:58AM -0600, Stephen Warren wrote:
> On 08/13/2015 09:59 AM, Simon Glass wrote:
> >Hi Linus,
> >
> >On 11 August 2015 at 07:00, Linus Walleij <linus.walleij@linaro.org> wro=
te:
> >>On Fri, Aug 7, 2015 at 3:42 PM, Simon Glass <sjg@chromium.org> wrote:
> >>
> >>>This binding differs from that of Linux. Update it and change existing
> >>>users.
> >>>
> >>>Signed-off-by: Simon Glass <sjg@chromium.org>
> >>(...)
> >>>  doc/device-tree-bindings/serial/pl01x.txt | 55 +++++++++++++++++++++=
+++++++---
> >>
> >>So why does U-Boot have its own copy of any bindings at all?
> >>
> >>This is forking the ontology of who gets to define bindings I fear.
> >>It's a bit like have two bibles both claiming to be the word of god.
> >>(OK maybe a hyperbolic statement, but you see what I mean.)
> >>
> >>Can't we just have the bindings in the Linux kernel tree please?
> >
> >Is there any plan to move them out of Linux and put them in a separate p=
lace?
> >
> >We should make an effort to sync the device tree files with Linux period=
ically.
> >
> >I quite like having the bindings in U-Boot since it makes people think
> >about what they are adding. Are you worried that the bindings in
> >U-Boot might evolve separately? Certainly there has been some of that.
> >
> >However I recently sent a series to add a few things for Raspberry Pi
> >("arm: rpi: Device tree modifications for U-Boot") and I don't yet see
> >a willingness to add what some see as 'U-Boot things' to the binding.
> >How do we address that?
>=20
> DT isn't supposed to contain "U-Boot things", but "an OS-agnostic
> description of the hardware". So, I imagine the solution is not to
> attempt to do that:-)

This always makes me ask if the FreeBSD folks or VxWorks folks have
adopted the "Linux" bindings or if the DT files continue to be
"OS-agnostic" and "only functional with Linux".  It was a while ago last
I looked but it made my head hurt a little doing a quick translation for
an SoC that I was familiar with.

--=20
Tom

--dBjx7dyGPdVN2luf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJVzN5ZAAoJEIRElH1W1v7NENgP/0Mgq0vI4su9mV3ittPDTY0O
z8bIM3wF6Q1YB7dSxJLfffxJhQ7NsucBiRahRKFQcBJDm/fIGYUIerp5spGvIW5i
rw5SvvddUvmv7xx172cK5hA3M10WE4EpmqtOgOTHFbXorJkFC8u5bMjvKoBoYEPx
QNain+2R9ShBZFZtMn6+qmhsR2hIRwgpkHpKCDrHfZ3I0mk+Saew4MrIqtV5kGDa
vMvwC2t2EOKzH85NS0XE2np9PKKlXPboIql+dUqRgUDcayAY+yADhKQWpcmuYNVA
MHoI1453rqocCdfCCGqirdCrx/zXl0tcf3FUsXVvWyOYha2sAtIKwNriWHP7Uuba
THBvGhoZHfhV5XZD6Tt/+fb6dZHI57oZAScFQpPE12p8BJ2xZ2oDxk0unUZWMdP1
DTMxgNpQoW3Hs2aqbKvPIFBceLmyV6KZolrdes/B0hfAl4VspwT0hExC4AApDg1F
AG3MMTzgXd3z4o1scSseEwGkL0U1B9+DVIOY9brZPe2nDISokeL/xuiRB3DiDpXi
ScBKglftmr3ilq9lCAa5FHgCp238/BzioxqXo7szxvjDkonXQNCR948/hVJAt3iG
NlymXxrRJ89Uq+C7Vd5GVuFQHCTGTkVsp6BYmQAFXuKEDFpZdNyV+mBywZAejrNl
C2pQe/TIFqY2j2jYEAad
=gtf9
-----END PGP SIGNATURE-----

--dBjx7dyGPdVN2luf--

--===============0779600303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============0779600303==--
