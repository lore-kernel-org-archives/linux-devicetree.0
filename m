From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sun7i: lamobo-r1: Fix CPU port RGMII settings
Date: Mon, 20 Mar 2017 09:29:56 +0100
Message-ID: <20170320082956.sa2bwsoapp23srto@lukather>
References: <20170319045321.6454-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0803538413528808136=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170319045321.6454-1-f.fainelli@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, mo.ucina@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0803538413528808136==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ewlppstrga6fzugu"
Content-Disposition: inline


--ewlppstrga6fzugu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Florian,

On Sat, Mar 18, 2017 at 09:53:20PM -0700, Florian Fainelli wrote:
> The CPU port of the BCM53125 is configured with RGMII (no delays) but
> this should actually be RGMII with transmit delay (rgmii-txid) because
> STMMAC takes care of inserting the transmitter delay. This fixes
> occasional packet loss encountered.
>=20
> Fixes: d7b9eaff5f0c ("ARM: dts: sun7i: Add BCM53125 switch nodes to the l=
amobo-r1 board")
> Reported-by: Hartmut Knaack <knaack.h@gmx.de>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ewlppstrga6fzugu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYz5MAAAoJEBx+YmzsjxAg9tUQALMpv6LsSdN2R/bbFENnly5Y
SJLSdW08pOCD8mevgc7UfrWVGxPs1c4dPZrOxewAsAVf1kxTmN7KeXAxJEVIDIzW
z+Lp9q16+ingmz49Uuxjt83hB0518WL1vY+w8Y139GuehMIREAL/lAjYYkTcEP97
0SxTHOnkF3AUFp7YvxjEa/VMy4XTxcp7yg+DBxDW3KOfvG+6tPD1MqQRGYjDyWfH
IKgTtU9PjCl0eIqPoC9uJwu8nfBYbpNlDe8BpcGxe34X0r/sTnp4oX9hkb/UVSCs
IhH+dol8saK/zR9OW14xaJdOYg3hkbYDsvdmY6ts+0+PD+7GCsksqfmMLp5BBu23
Qn1U3Fzk6mXvtofLizOl9151I8OvZMH/kW1ANSuddTq8X8vnvZF6h9bM5rnIzrFV
/M7K7+LKUjrfMNajELoOJ27x9o+EXeNM5LVk6c8TJGR0PpnXPWUhFWUOYTJae2aA
aqKapfFmYpRCBKXL+asf+cn6NA04WIEe4yanJV/qIq6typpRJxYlwVvjhjwKpQ5p
GB94EJU2Pi2DBw4bJ3qsa6Bh+scMbk+aNoIbGG6NU8nJsLldwFsMhWz2gy3a+b36
ioG6GbZSGC9LfAlehTKp1FN+rb8gl//G0sIuHlpr5/DyC5Mmaj9YlDG2ug3eUGTv
QuZWSAAiozDxfK4wIzJR
=R31h
-----END PGP SIGNATURE-----

--ewlppstrga6fzugu--


--===============0803538413528808136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0803538413528808136==--
