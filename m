From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for DataImage
 SCF0700C48GGU18
Date: Tue, 10 Jul 2018 12:40:54 +0200
Message-ID: <20180710104054.GI1504@ulmo>
References: <1529930490-11874-1-git-send-email-michal.vokac@ysoft.com>
 <1529930490-11874-2-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1998035329=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1529930490-11874-2-git-send-email-michal.vokac@ysoft.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org


--===============1998035329==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MFZs98Tklfu0WsCO"
Content-Disposition: inline


--MFZs98Tklfu0WsCO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 25, 2018 at 02:41:30PM +0200, Michal Vok=C3=A1=C4=8D wrote:
> This adds support for the DataImage SCF0700C48GGU18 7.0" WVGA (800x480)
> TFT LCD panel. The panel has 24-bit parallel interface and can be
> supported by the simple panel driver.
>=20
> Signed-off-by: Michal Vok=C3=A1=C4=8D <michal.vokac@ysoft.com>
> ---
>  .../display/panel/dataimage,scf0700c48ggu18.txt    |  8 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 29 ++++++++++++++++=
++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/datai=
mage,scf0700c48ggu18.txt

Applied, thanks.

Thierry

--MFZs98Tklfu0WsCO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltEjTYACgkQ3SOs138+
s6HT5hAAmihXkLqsEB8gSfrSbIcFkJHceU/B0I0gnc4TPuzV/qL4St6H4mpdYOzW
k3DYlC0O/l0Qep91UrYWc3qc8GdfYERhYMtLdGa2MFuLKl5eDPjaq1LzAMl9N73u
TjsSAahca+VbKoAZPPKYMVaUYf+pqxmpvkDqP/0aPhQbx2qVtXZig0KsEMqmmWSt
+lt8+GlmlvTThGuJPrsP5+h9r8/gIgf89nTjqBiWkCSogDccAkJ4ueBBmufDg7l0
d69V0hexSde6K+AXeY/0fWs1R2k0y5PV9Y0tWisWCp9gr9jWFiPz6l3AXztbCbd2
+A/a0gN0mx9BGkhTRWWuz7Rsf3q9NLBWThegaIYzx2ncMEzsEQcWF0734LZ1ckpH
8KrAITYUDSJzygyQ5e07Wwr/lz7P4arq0BeYti/l0MG7x+1dOPdTc8TTVjfaa6Gs
UmakjdigJa8e1goD9dlp5HnzbKXGKjVqucGutdRsEtrAY/wT1K2mH9kwXRzyjJwn
m3XnYC7fj09O3l4G/SN9aOCZQsJu6jeBrYhU+7pgROuikVkW9njl+MjxDyt3bmBP
7b+fqBOTm6RoilPDNyOPbbQDX3kjHsHSIwJmfddy762z0NdHMCyQN9Aj9qeRyNO5
Vg2vK9DyB6Y7HMGUvi1M/8/qqvsylo9S1DPzm35KJV4RrUDIgRk=
=xiZK
-----END PGP SIGNATURE-----

--MFZs98Tklfu0WsCO--

--===============1998035329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1998035329==--
