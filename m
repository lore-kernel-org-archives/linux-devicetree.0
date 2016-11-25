From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sunxi: Add num-cs for A20 spi nodes
Date: Fri, 25 Nov 2016 16:20:47 +0100
Message-ID: <20161125152047.oadxi2xbgm4kdd7q@lukather>
References: <20161122170616.29557-1-manu@bidouilliste.com>
 <20161124195517.qrq7briu3pwjnp4n@lukather>
 <20161124210509.be743aae84c26c6c2e666c6e@bidouilliste.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5415685063065624589=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161124210509.be743aae84c26c6c2e666c6e@bidouilliste.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Emmanuel Vadot <manu@bidouilliste.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============5415685063065624589==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pc55j3vdb4tvo6q5"
Content-Disposition: inline


--pc55j3vdb4tvo6q5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2016 at 09:05:09PM +0100, Emmanuel Vadot wrote:
> On Thu, 24 Nov 2016 20:55:17 +0100
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > On Tue, Nov 22, 2016 at 06:06:16PM +0100, Emmanuel Vadot wrote:
> > > The spi0 controller on the A20 have up to 4 CS (Chip Select) while the
> > > others three only have 1.
> > > Add the num-cs property to each node.
> > >=20
> > > Signed-off-by: Emmanuel Vadot <manu@bidouilliste.com>
> >=20
> > I don't think we have any code that uses it at the moment. What is the
> > rationale behind this patch?
> >=20
> > Thanks!
> > Maxime
> >=20
> > --=20
> > Maxime Ripard, Free Electrons
> > Embedded Linux and Kernel engineering
> > http://free-electrons.com
>=20
>  Hi Maxime,
>=20
>  If num-cs isn't present nothing prevent to start a transfer with a
> non-valid CS pin, resulting in an error.
>  num-cs are default property especially made for this and a SPI driver
> should try to get the property at probe/attach time.

Yes, but as far as I know, our driver doesn't. I'm all in for having
support for that in our driver, but without it, that patch is kind of
useless.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--pc55j3vdb4tvo6q5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYOFbPAAoJEBx+YmzsjxAgaP8P/28+ESng7Bz3M088iP09TH++
XvIcDpcQcirOJ6Rex8RggUFZUPG70iQ3PHNFR2csoSqWgVSVvNatLASxfZ0C7jqj
yaR4cnfavOSJgmS+9lv7C+Dqkn6lxkcadrF28UyiP2+AwiHQQG4S564IdSh02QNV
V9UeJ4fGt33mYiPMsnieSGnmTiBtd54lvn/3WHbkA9myFNNkgt7qGNt0fase5Kog
7MgUbuSK++oRTiIaSSUo2pV9tZEBBeClErSB4Pnlb036bBFh9+LON1W3ZUFnPoEJ
kahntu0HHRVhS8VOj8HkwKKttydPzWN7tjTaKV5ad6eVewKCChgPb3YeWjPy1sZd
6N/vq4+3wt8d/DHWWK68qVjzNLu12ioiHDdrj1JJAdTXwQevuVoBv16FQH62/T0c
CnZ980isrHeWOxEM2pSEvfErjUInnZdwUX03EbeMNuaXJqjmsPkizN/tjGbHj/sV
blicGqRbE8yctbzvqKQ1LkyC3XmfCOToBBjrZfsjehAFEygltPkYY8+LYTls2E96
4SSt4OpV298CjGPxFJ+U/L9eoPgRwT47L8Bosre622GTsjX7PTy8eQG1usJTf98z
yyTpCKcu1nqlhCUmmM0SqHssOUSeugQWqyCKoW3qgP89lDTUppbtxrvrGmv4fVs2
g5wjjiZnOd115d6Kg6ho
=7PZw
-----END PGP SIGNATURE-----

--pc55j3vdb4tvo6q5--


--===============5415685063065624589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5415685063065624589==--
