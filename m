From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 5/6] ARM: dts: sun8i: set cpu-supply in reference tablet
 DTSI
Date: Tue, 13 Dec 2016 20:13:50 +0100
Message-ID: <20161213191350.dsybyjfuocrvx4zj@lukather>
References: <20161213152252.53749-1-icenowy@aosc.xyz>
 <20161213152252.53749-6-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5755112281354732498=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161213152252.53749-6-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: devicetree@vger.kernel.org, Quentin Schulz <quentin.schulz@free-electrons.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jorik Jonker <jorik@kippendief.biz>
List-Id: devicetree@vger.kernel.org


--===============5755112281354732498==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uv2vtn7agm7c5d3p"
Content-Disposition: inline


--uv2vtn7agm7c5d3p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2016 at 11:22:51PM +0800, Icenowy Zheng wrote:
> All reference design A33 tablets uses DCDC2 of AXP223 as the power
> supply of the Cortex-A7 cores.
>=20
> Set the cpu-supply in the DTSI of sun8i reference tablets.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Applied, thanks

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--uv2vtn7agm7c5d3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYUEhuAAoJEBx+YmzsjxAgQ54QAIRKLQJFblVSZ6AfhLN8vSMI
DUzceHqS2McEFLpS/oseTIfugkHSqfgHA3Hn4RRHIanWQnh8oz/ldQfBPA3lj0sf
WoqFWJh1wnWftwP2kw8Rs4EjV4F5kOaszUsWEFPGH8QNDh9FpWu17xr9dLM+b9Ns
PVi0tzV0OttXznu6i2GpodiqSP9yCtAVJr3v6irZ3+pL8KwEwKQm4jcknEybMHbW
I9ewrK5r2kJwHTB5G76wPIEoQvuV3mDW7TQHWVRUbfMILr6h/NVSdp5hZqe4sL+v
FMhyp6iUnp90Xav3mkl1PpwD64/XMHkrYNqesYn6KJz8PM5EzroCAU1uC4nqBUV7
mNLg5LrKNcqOaUiSbC7HDBgvvvDDFLAvEc3mdJ3SbcRd7/XhNqqdGJ30myrX6Rla
EC8nnwgDY/jl6Et1zC6jG76juJ9KzOdLIrP2M++bespvG1t2vm+SBwO2QTVPPxB9
j0ryuLHhlCrojIOGfdqifLHX2DDr/7fmealMsDq9NprOKPrEMSr0KOWCKPmwJUb0
hkfV1IRYwU6+DiiOEIvGtNs3JocN+aPKBZ3MTBsOYAH+INgfT+arI9m0zONgOzdO
xszwBjuVHWZ4oiFJr3JaVszu2KktFjiY8yfhxj2NF28sGYgj5EToIHIKZevkjAGl
4khVMF+geLUSEJyq9kVq
=tilk
-----END PGP SIGNATURE-----

--uv2vtn7agm7c5d3p--


--===============5755112281354732498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5755112281354732498==--
