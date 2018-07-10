From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/panel: simple: Add support for Innolux G070Y2-L01
Date: Tue, 10 Jul 2018 12:16:35 +0200
Message-ID: <20180710101635.GF1504@ulmo>
References: <1528111008.2818.20.camel@googlemail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0348446602=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1528111008.2818.20.camel@googlemail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Christoph Fritz <chf.fritz@googlemail.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============0348446602==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AH+kv8CCoFf6qPuz"
Content-Disposition: inline


--AH+kv8CCoFf6qPuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 04, 2018 at 01:16:48PM +0200, Christoph Fritz wrote:
> This patch adds support for Innolux G070Y2-L01 7" WVGA (800x480) TFT LCD
> panel.
>=20
> Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
> ---
>  .../bindings/display/panel/innolux,g070y2-l01.txt  | 12 +++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 37 ++++++++++++++++=
++++--
>  2 files changed, 47 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/innol=
ux,g070y2-l01.txt

Applied, thanks.

Thierry

--AH+kv8CCoFf6qPuz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltEh4MACgkQ3SOs138+
s6HgqA//Raonwnfii7eveMucgOKr+WHemFYqVBx6bngVnSpFdZVgjtRG+nArYjnX
YbcLKxJ37W6wdwIJuiP4UgZwequ4mP7NQTcOoha9D52Wv17RJQRLUnHcjzFjuagi
emWMDY6pCpNDZbL8yPuprtFvhA61wc8VsdHHSKfP7C5mEx1uEFQg+zMzR6WvNkJD
XnugPdhyVu/diXSwCLPLM7iLsQvsdOtWvjFstp+MNbwUpih2nEaqgeriIw0cT6AF
/hczsdMooeWwaTj0r0Ig8xpP6aqxOodwvWSRw6uuOy31k3AhhMUOrDOMyT6FPKwl
UqIg7RV4UnkcN+13Z6c5VuWQSRq9A1Z1A/hd/YY0Y7nVTkCNu9rHMDD9qPXF0kPh
I256dv2PBbtE/zMrLEYaoewUhj9UsQ0Sk0lgmde22MRn6/4Vfu+viHjq/+ZBulkN
AgVWkesDCYm0fdhV6oRE+QJ7P46kGp3tugV2A48LxVAwaPwYHYOs/Zc1LnIR+VOL
0/BiTpcfvT3rQVWl68UMxZXj2Mu5pKf6JKndSdTsIZKgFKN96KaQccoZaSCIuu+F
NO6Ko7WJj3b4Wmut3iePWYQc7/KiMGc74aTSYvZzrzWZzEkXLUHZJK23hqL+nCqN
9Ji6g7zh2caGizYvAgIZHxwhgexIqdQ9yW/N9uPaxUfSc98brf4=
=YBBz
-----END PGP SIGNATURE-----

--AH+kv8CCoFf6qPuz--

--===============0348446602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0348446602==--
