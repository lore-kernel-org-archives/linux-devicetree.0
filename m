From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] display: panel: Add Mitsubishi aa070mc01 display
 support (800x480)
Date: Fri, 17 Nov 2017 12:45:05 +0100
Message-ID: <20171117114505.GC1062@ulmo>
References: <1508537169-402-1-git-send-email-lukma@denx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0093132346=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1508537169-402-1-git-send-email-lukma@denx.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============0093132346==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5QAgd0e35j3NYeGe"
Content-Disposition: inline


--5QAgd0e35j3NYeGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 21, 2017 at 12:06:09AM +0200, Lukasz Majewski wrote:
> This commit adds support for Mitsubishi aa070mc01 TFT panel working
> with 8 bit ISP mode (pin 19 "mode" HIGH for 20 pin TFT connector).
>=20
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
> Changes for v2:
> - Place the code sorted alphabetically
> - Add missing ./Documentation/devicetree/binding/display properties
>   description
> ---
>  .../display/panel/mitsubishi,aa070mc01.txt         |  7 +++++
>  drivers/gpu/drm/panel/panel-simple.c               | 35 ++++++++++++++++=
++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/mitsu=
bishi,aa070mc01.txt

Applied to drm-misc-next, thanks.

Thierry

--5QAgd0e35j3NYeGe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloOy8EACgkQ3SOs138+
s6EpkA//aDvr3hrBlRhfsaKQhJNQvU4Qo7ceF+0ElozvvsTs+TNPdLX3GeQIFfHc
PFD3o5YrU0y/qz8CyeIsVz/ZO1e5vE5Lxg/fDa3l55m9qXevWJxtWGw7QVeOc1u3
sq95U/knCbAQ47wyxhGJEfKZMi5tsZ8R2vFqCSinv7BUgSJ36p2O7HOohrsF0FAp
ftjL3LkyB1Y0XJM30hrVv1oW650lmZ+laCYNAnSNkpu9lmZu5EsJx7+kv+E8QSXn
+9asWH1lhuOaW1xdz2WKnMMEHJ/GJmRP0ZqeJAkpv0vBWXXJ5WC8HcVAO9IrJxAN
RnkES2d0AZ9GyDmyioT3y7knoejXHUp3Aq5FuvLywyezcQIQSY40KCOSdOVsSaDT
y+K9uSZCHIDLa72+eazjE+PF0j5dxOAYGCM6+rcl9aiE4uWu3qgHIj80UAcl4Ee8
WHMk4u3a0zvkoE2xFxz9QQLS9J270XmyJJstTy7AtrY9gZmz1W0g+gVfXrhdjD8D
Lqn8B49kU49g3dhHW4/HuehGrsXEBnvTSQOq8Kv8kI0K9ndNCDMJQvdpwYxpPgrX
iRQk4QFDFJGWAgR6sq7ZrGpI+/0JIKTV2V+ynA4R9NRPFNRkUWm542gcAsy8Z1zH
7gLNseoZeTKigxckmScfPOQ/n/Et4+Bu093r7fXeDVhoobtplEA=
=/AX8
-----END PGP SIGNATURE-----

--5QAgd0e35j3NYeGe--

--===============0093132346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0093132346==--
