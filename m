From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: simple: Add support for Shelly
 SCA07010-BFN-LNN
Date: Tue, 24 Mar 2015 11:57:22 +0100
Message-ID: <20150324105721.GH18115@ulmo.nvidia.com>
References: <c661ab7f0d1829c7cac7875ce44eb3293a7515a9.1426772560.git.nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1999137889=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <c661ab7f0d1829c7cac7875ce44eb3293a7515a9.1426772560.git.nicolas.ferre@atmel.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============1999137889==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JI+G0+mN8WmwPnOn"
Content-Disposition: inline


--JI+G0+mN8WmwPnOn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2015 at 02:43:00PM +0100, Nicolas Ferre wrote:
> From: Boris BREZILLON <boris.brezillon@free-electrons.com>
>=20
> The Shelly SCA07010-BFN-LNN is a 7.0" WVGA TFT LCD panel.
> This panel with backlight is found in PDA 7" LCD screen (TM70xx series for
> instance).
>=20
> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> ---
>  .../bindings/panel/shelly,sca07010-bfn-lnn.txt     |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++=
++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/shelly,sca070=
10-bfn-lnn.txt

The vendor prefix "shelly" doesn't seem to be documented yet. Can you
submit a patch to fix that?

Thanks,
Thierry

--JI+G0+mN8WmwPnOn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVEUMPAAoJEN0jrNd/PrOhnl0QAKHow4YshmsH1ydRug2c5VZA
Ng2+breIPjjpOy35IMBV+M3muNa1XcEah11cjUDTjYvzv/qDXewmBiCSPxqyn4Aa
Evj8uJi7h84uEMfLSpSyEulT/A03dT2qQLf0oTnXh++Qn+GYovI94hCCBGiTz96U
xEXQH1lXlsGev1Azk3gy2mVcBFiRnYLZhqEGv3Kl79k6G8ycEPqwUjA8Xt11Eb/l
iKJ05Obdzcw8juqYyEeGMOHQ5yMFXOkgVaR4mlMotpMtQF5Hoa3Qu25rldMtGMRW
rShpXEU0odWoh0RfGbr8G4qVm9kxza5s0yrtzMumvDVT8uxiauu4rKqaGIyfvEGF
wT1R3WJy1VC4PrHkbIdE+XnwKkXtrwnUDQStFKmOCinFki351R9pXQqwKRIvkUgR
zqEvivCG8a6Os5rdYeQNEKd55HLtj/uXl3Qm1w+5ePg64FNslcMt0yl2iuBbiVZN
eUixuPYeCZYx64h4taKbs0ZsQRRN3a+xnDij8PAvS694tcCJ6HKyGqcU8IYM8mGM
giXgXvTl1u+n+G0c4VbpIGBc496yW0RS3s6iQZmVYCrYzK/aBbNEnAL2EcV3+rO+
RUo5l43FvldEPKtRbGfagiTHjpvodyz8gjJFXzsGcM2YF1qDcOQLf+bYgzhyJRd8
zKrlVueUywhpSVARbLf2
=mQBj
-----END PGP SIGNATURE-----

--JI+G0+mN8WmwPnOn--

--===============1999137889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1999137889==--
