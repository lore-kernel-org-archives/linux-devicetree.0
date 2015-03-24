From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for Innolux AT043TN24
Date: Tue, 24 Mar 2015 11:58:17 +0100
Message-ID: <20150324105816.GI18115@ulmo.nvidia.com>
References: <c661ab7f0d1829c7cac7875ce44eb3293a7515a9.1426772560.git.nicolas.ferre@atmel.com>
 <84ca8ea51cd7bd709729de927d60d8a2f47664c7.1426772560.git.nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1289250085=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <84ca8ea51cd7bd709729de927d60d8a2f47664c7.1426772560.git.nicolas.ferre@atmel.com>
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


--===============1289250085==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TA4f0niHM6tHt3xR"
Content-Disposition: inline


--TA4f0niHM6tHt3xR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2015 at 02:43:01PM +0100, Nicolas Ferre wrote:
> The Innolux AT043TN24 4.3" WQVGA TFT LCD panel.
> This panel with backlight is found in PDA 4.3" LCD screen (TM43xx series =
for
> instance).
>=20
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> ---
>  .../bindings/panel/innolux,at043tn24.txt           |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 28 ++++++++++++++++=
++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/innolux,at043=
tn24.txt

Applied, thanks.

Thierry

--TA4f0niHM6tHt3xR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVEUNHAAoJEN0jrNd/PrOhOdsP/istlmvdgqspMTF/p7yEzHty
NnJ4FyesLNCbcKzLP9YkvRXrwy54pNDzou8RDRbjuP1K1yxcbv4R+iKMo3E2v1zR
7USKfYK5BTbCFkCaXoavwg8QXD6RxH44uSTcflS1Hj4N2w6AWuI/hwruxocgYsQM
D/U7zTD52Tz+3qV6eli5PKeSAMWiizwRpJyNab0Ly31bzQ2qrMXIRyxA+KF5Uot6
0QjkN6XXbqaS+uU65O484pyayriEnOPPGOFiJKM7zMAjsK+AxmD0pdQLfrindgw+
HuO7I7O0ok5lfXmimrO/4rs+AB2l9xez9+aSguBhMCfFz6xiKgL+FVt4kOVV4l3S
ISGPDA3CfyWMpB1q9Qu1H+67dpfurqgvfrwE6n264Tba7U/VcuRLDIq0kdlLap7p
qQJAHGCuJ1XFTOcAVj1VVTJp3RIHCgzwxNmtfspB99rBadw1xwuh0wFcOfHVr7nw
gyhmGanl+86p2+QLI84D929Pdh7WIq8QNaefXTdqT+l6z0YVkNomwR02d7OjrTy8
u7rLduwqrl7I24G004DmeS93vpWcOPFebZDf4o/cBtzywSLz088U15q3xF+416xA
vjbE0ABg7jX6g7lU1Y1fqbBL+RCf7fNAroE93pib3UwMUmzE+OQYaLDXj0D6Q19u
1Ss2wUv9pC12VzN72C4S
=zvcy
-----END PGP SIGNATURE-----

--TA4f0niHM6tHt3xR--

--===============1289250085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1289250085==--
