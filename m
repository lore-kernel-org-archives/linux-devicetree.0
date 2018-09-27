From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/panel: simple: Add DLC1010GIG panel
Date: Thu, 27 Sep 2018 14:28:48 +0200
Message-ID: <20180927122848.GJ29102@ulmo>
References: <20180924152610.25939-1-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0242951914=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180924152610.25939-1-m.felsch@pengutronix.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, kernel@pengutronix.de, dri-devel@lists.freedesktop.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org


--===============0242951914==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CxDuMX1Cv2n9FQfo"
Content-Disposition: inline


--CxDuMX1Cv2n9FQfo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2018 at 05:26:10PM +0200, Marco Felsch wrote:
> Add support for the DLC DLC1010GIG 1280x800 10.1" LVDS panel to the
> simple-panel driver.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../bindings/display/panel/dlc,dlc1010gig.txt | 12 +++++++
>  drivers/gpu/drm/panel/panel-simple.c          | 33 +++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/dlc,d=
lc1010gig.txt

checkpatch complains about some minor issues. I've addressed most of
them while applying, but next time, please make sure to run checkpatch
and addressing the issues that it flags before sending.

Thanks,
Thierry

--CxDuMX1Cv2n9FQfo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAluszQAACgkQ3SOs138+
s6EzpA//cABgFo8FMwkp06piKd5Zx1LpTIcUdGQTo62sXS1JHUddxK+rk4MQpi72
VBwjlB9n7thbImfjaDEqsndzsf1wPLCH+/vMEtgP/q7bgpd3ZCltvgCevj0o8ANy
aXrkqW7PrTm+CRivBjdzO7ivA3RHEggC7sZoaKgvP1OGNx/etBd10H0LyX+a/9Vq
pS5bl3Bq85PMq9lNB+oc9xAT3nqV+orRlE3dRaDYUmkCdoe3uFNQWikBsDRBsj6f
PkmXZUbbZOnaq8VZJv8EZogHaxpMrsDaDE45HK102R0m2Nm4q2gZn14nfuYOhvVI
0UPws6cDkhQsLXB00KYxpMmeblXBJFbvwg2oajp/JEwKm4u/OfStdgny9dyF1EX5
M2bM3lsXe10YWjnjyhtpoqbmggoKuvnK67gGWpUpdG9qEFfUipN9ZKT/BGAqg5x0
wTnZQ5l9G32r7OWfJxnIXeUI/wmT5TXijKK5AEFbxrFgnnD8+BA2LyEoDeh2jGag
u2B32HablgZfPqO7eLMfmR3qDYcKF9oFLzxifdudxVPsPVg5Z/aXaYJrl3fPkKWv
Y+QOJutSVLkVRYx+V4X5SKOvrbdLquPT8HoGOLuOZt22amYbxOHw4XQRXd3ZbBDr
8Cw2AO6JFh/cI9CBWLl2nol4b8bqXjqVMqW867f37AGZtFpoLyc=
=2O/n
-----END PGP SIGNATURE-----

--CxDuMX1Cv2n9FQfo--

--===============0242951914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0242951914==--
