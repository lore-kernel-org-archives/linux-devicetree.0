From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v5 1/9] phy: add phy_get_bus_width()/phy_set_bus_width()
 calls
Date: Thu, 12 Dec 2013 12:18:18 -0600
Message-ID: <20131212181818.GI1939@saruman.home>
References: <1386854770-2173-1-git-send-email-mporter@linaro.org>
 <1386854770-2173-2-git-send-email-mporter@linaro.org>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3456944790820784746=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1386854770-2173-2-git-send-email-mporter@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matt Porter <mporter@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Kamil Debski <k.debski@samsung.com>, Linux USB List <linux-usb@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tomasz Figa <t.figa@samsung.com>, Christian Daudt <bcm@fixthebug.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Kishon Vijay Abraham I <kishon@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, Felipe Balbi <balbi@ti.com>, Linaro Patches <patches@linaro.org>, Kumar Gala <galak@codeaurora.org>, Paul Zimmerman <paulz@synopsys.com>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============3456944790820784746==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PMULwz+zIGJzpDN9"
Content-Disposition: inline

--PMULwz+zIGJzpDN9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 12, 2013 at 08:26:02AM -0500, Matt Porter wrote:
> This adds a pair of APIs that allows the generic PHY subsystem to
> provide information on the PHY bus width. The PHY provider driver may
> use phy_set_bus_width() to set the bus width that the PHY supports.
> The controller driver may then use phy_get_bus_width() to fetch the
> PHY bus width in order to properly configure the controller.
>=20
> Signed-off-by: Matt Porter <mporter@linaro.org>

Kishon, I need your Acked-by here, if you're ok with the change.

--=20
balbi

--PMULwz+zIGJzpDN9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSqf3qAAoJEIaOsuA1yqREIh8P/j7kXjr/8/nG/9VkH3Ob/SMx
v+/meeBDhloMdwJQPpfZtt2UuR5bOcNW2Nndk4NHBZY8rI9JyllyMYG1V9C3AOsP
B+fnADY8MTuP6wSogWcHb7e8aCRIqfRoFT++eQboQSIy7rYO4rBfsAzqf9nlgQ6h
9mmGoNZmFDVCFqfkBI6YiU3GJpxI9Z5w20y9+5Xf+0ukwRdA2CjdIt2s87MsROty
a84c9BWN0oO9xL6Jy7nZvftln0DtuKdxdQ9pFhw1Str8cLN+IZXvemRgRYrEmWA7
JgnVbrFgMqdRnmG5sZCcCgE5bGElihUvqpWcTF8BjR1S/ZwiqdGOh13phnL0BQYE
wlKSquVDERbjWtafNmds6C9dRnYBcMIRi0Xk2lkuc4eof2XFsthb3YNqpBysu6RI
Tg9hE3dg+nCHztdwdfbzCVFtJTas1i+fKXW9vRLIWDZgqtDMxv6BDpQct3hLouRI
kGWhmteB2veiUHCUaleNX1Amevwe18YcD1ByLNu9hPkDPjDE4Iejcrr3g7w3ZHu2
qbwRO8BOOsoZ5hIdyoQxpZN1etGpLFK/rS3p4fk/yKyliGGqlv+NGULjGuiRkO4i
IB7e5FSAPO90t5Htf6+D2odGiX5U55tV02K+pD4puU9LZnvXuJyca/3yOItUBpr8
rEx/jVopri0tii77zmNc
=SzAj
-----END PGP SIGNATURE-----

--PMULwz+zIGJzpDN9--


--===============3456944790820784746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3456944790820784746==--
