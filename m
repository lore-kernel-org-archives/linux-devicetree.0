From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH] usb: phy: msm: Add D+/D- lines route control
Date: Tue, 21 Jul 2015 13:39:59 -0500
Message-ID: <20150721183959.GK25385@saruman.tx.rr.com>
References: <1436348754-6728-1-git-send-email-ivan.ivanov@linaro.org>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g4MvFqI7wmANiPDo"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1436348754-6728-1-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: Felipe Balbi <balbi@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--g4MvFqI7wmANiPDo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2015 at 12:45:54PM +0300, Ivan T. Ivanov wrote:
> apq8016-sbc board is using Dual SPDT USB Switch (TC7USB40MU),
> witch is controlled by GPIO to de/multiplex D+/D- USB lines to
> USB2513B Hub and uB connector. Add support for this.
>=20
> Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>

doesn't apply:

checking file Documentation/devicetree/bindings/usb/msm-hsusb.txt
checking file drivers/usb/phy/phy-msm-usb.c
Hunk #5 succeeded at 1632 (offset 2 lines).
Hunk #6 succeeded at 1809 (offset 2 lines).
Hunk #7 FAILED at 1844.
1 out of 7 hunks FAILED
checking file include/linux/usb/msm_hsusb.h

Please rebase on my testing/next

--=20
balbi

--g4MvFqI7wmANiPDo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVrpH/AAoJEIaOsuA1yqREj0oP/3APuWxPbFvH6gwyoAkZ9kAl
JD/F1oJJpGLqerS2s6TWtByZmnCUn22Cuv4TKtP9/kGp1tINmGmBUclmL+3J82A0
U1Hp70WiOYNWhs5X2/d4QhGXxjYh5RcG/crXfKq/+uUuJLD7fBrya+OI/gwhh/Kb
Ir0UOgrdFrb1zb/TdFYpNzKtwfFVyh0ZNWApRGlmpObN2v2VS/YxvR0Xn/uIhDNl
mNv6eRehFbKUzfPMVdeJlZLPaegzheAQcSbd+E45hnP4BXlIEm0C0obImirLCkLx
ihiM8hwRxqH845QAWle4qIG48zR5Qfck9vqT83q9nweszINXvz9IvpVy7quSJjAz
as/LB781eH1LKgnBhNYVekghJNsiGiIpZAGsyErIT5YDW0WQhn6CYYeKHtnmdugA
PyQ51nr7mUX4oIrL/1TkcId7y8hqKMDZx92MRJrgHt58qA8DMrQK59FM9iEf5bMN
IctRFTQz9nlG6raDvMhrW6woBYK7jhLhbhHwnfWRKP1BEu4SFw79txyR1fThKx8F
mGOjUv00bo4GcbSlrMKou3KdQ5IEBXMc0fKlSL5BcmlwHyfdpIYvHQgN8XKOV8nG
qGD4ZeQlOhVjXasLbxhoQz5AgRlLQTD5ULnHR2xbC8J3/JceXDHIB+kqRl0XBksx
72IUOJHeqXDv8bnNMZ+C
=Ao67
-----END PGP SIGNATURE-----

--g4MvFqI7wmANiPDo--
