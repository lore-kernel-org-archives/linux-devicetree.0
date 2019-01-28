From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: drm/panel: simple: add support for
 PDA 91-00156-A0
Date: Mon, 28 Jan 2019 17:17:45 +0100
Message-ID: <20190128161745.GH26200@ulmo>
References: <1547458584-29548-1-git-send-email-eugen.hristev@microchip.com>
 <1547458584-29548-3-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1153394786=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1547458584-29548-3-git-send-email-eugen.hristev@microchip.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Eugen.Hristev@microchip.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Nicolas.Ferre@microchip.com, robh+dt@kernel.org, Cristian.Birsan@microchip.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1153394786==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FUaywKC54iCcLzqT"
Content-Disposition: inline


--FUaywKC54iCcLzqT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 14, 2019 at 09:43:28AM +0000, Eugen.Hristev@microchip.com wrote:
> From: Cristian Birsan <cristian.birsan@microchip.com>
>=20
> PDA 91-00156-A0 5.0 is a 5.0" WVGA TFT LCD panel.
> This panel with backlight is found in PDA 5" LCD screen (TM5000 series or
> AC320005-5).
> Adding Device Tree bindings for this panel.
>=20
> Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
> [eugen.hristev@microchip.com]: specified backlight and supply bindings
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v2:
> - added binding explanations for required properties from simple-panel:
> backlight and power supply which are mandatory
>=20
>  .../devicetree/bindings/display/panel/pda,91-00156-a0.txt  | 14 ++++++++=
++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/pda,9=
1-00156-a0.txt

Applied to drm-misc-next, thanks.

Thierry

--FUaywKC54iCcLzqT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxPKykACgkQ3SOs138+
s6HlEQ//fZonuiZIonlMiwGhVPmzmd+XQNGGtRXIuqmjSUUoK++wYhFu8Ys0R/1+
eT0l6pdVmETBUIp+XIWWWhUqSUqBrG+DLQhDFtCxEFDWkV+qodcE0C4Ms+lz9GVf
RVE0v1efNCZXEsS5/YqoxTse91FXlm71MIpzmRf+NTh6zeSCM2hR0fdrRfLMvmCS
GiJn0MFqbvMPuZvG2sClOrAt7vrkoLsyAAY4DrYHvHksqPCQGnwizyeTo8flFOla
alT9hnrRbplwmIQ5yTFDhSQZQ1rsBlyuLVHwOOHabLCiwJYs/XoyVsAwEQ4617DP
W/mmHL6fTLkqWU8EcJ2mZVRPG10fqHkc//iKez6lta/uPy0ckKNEarS5x7Jd9SzC
UTLAGdBI4CMXQ1sfRY2CTj5IFZe+MiZ5ay66/jXbMob/fuloYBmDFtwECkKQZwzx
NG9iJo8plIISX2r+pKfLPAKGPKlIlzDUNFd9mZJNG+CnzMhwxudYJ9M2s4T+AZWu
7J80Xcka48F07VCiBHNfnRG/r8Z9r6zDpKVAPAcJMwo2Qi26nLaU35UTCosSLVrY
WYtS8YoEsnc7nMrJm6stpwEahNAE5vsXKeeMU22ziGkpRpgpnRA0049yhmU8V1jj
qItsaF2QrihE63oDhuJnOD+16Zje9ALV6ecum07EI8N0CPJ4YQM=
=rNwQ
-----END PGP SIGNATURE-----

--FUaywKC54iCcLzqT--

--===============1153394786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1153394786==--
