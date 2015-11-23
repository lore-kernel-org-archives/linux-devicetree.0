From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/3] panel/panasonic-vvx10f034n00: Add DT bindings
Date: Mon, 23 Nov 2015 12:32:00 +0100
Message-ID: <20151123113200.GB8911@ulmo.nvidia.com>
References: <1446251908-2603-1-git-send-email-bjorn@kryo.se>
 <1446251908-2603-2-git-send-email-bjorn@kryo.se>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0588557155=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1446251908-2603-2-git-send-email-bjorn@kryo.se>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: bjorn@kryo.se
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============0588557155==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 05:38:27PM -0700, bjorn@kryo.se wrote:
> From: Werner Johansson <werner.johansson@sonymobile.com>
>=20
> This patch adds bindings for the Panasonic VVX10F034N00
> WUXGA panel.
>=20
> Signed-off-by: Werner Johansson <werner.johansson@sonymobile.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>  .../bindings/panel/panasonic,vvx10f034n00.txt        | 20 ++++++++++++++=
++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/panasonic,vvx=
10f034n00.txt

Applied, thanks.

Thierry

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWUvkwAAoJEN0jrNd/PrOho2IP/iXTARoH5LK8Jfi0ofOFDmu1
1oOtOt+VzkZxbxEsh5JuK1azhPUSPB9SCpl5Z22BoBral6VwirnX2ZLT49oXSbZ6
y5mg6nHq2JNhNirfOKjujujcN3uSYV2jUM8Qg4dRr61PKef41vuqO13zVG+HKcGo
TcXhJ+fyNfXjD4tNnA1QsGIjzOafhvzbXRNtnEZd+dAAVIjLgd/z3nH/mvzBswXI
dX4ZXmLP/UZkwOD35WAJVBq6qKiuhtCdk4FbJ4ByHN/jQwe9klFjGNG5xQVUr8r4
eYM4qFYl0FmvaGC1i0Psavi7LAbu6UbrCYfQDr7KLN2TWT2lsKSLs+RKhIVgDg0V
Qbsx9/tbeCxlJLbNWYRFw1R5i0bgNxnztMiUt/1SdR8RycNqd8IZwZZ+dqFhPLwg
lyvdWMQLD/vMPTjC4llIyotIiwAspRCK1oRznA4GKImJpUR2TH+gmosv1HTn7N+z
WnfEt/2JzqODzavE0fA5+8Qcn0lW+XnZiUZAVNfSl9zhicw2+EqYUCpfFpsgxDvK
DomliX99X4g6lB1hiUr+9n4/SckmQN407eFWkuRfgeF6dMJrn1xSwzp3fYuJGUX6
KU/UsxCx2pvZV8RVuwVD2uSyiap2mDHp1zjil1OhdGIrtC+ppMkwKz/XqeQle1wp
dkLYbZF3ABDaUDh6ZBBc
=XAqV
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--

--===============0588557155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0588557155==--
