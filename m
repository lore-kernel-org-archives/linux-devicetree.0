From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] drm: support gpu aliases defined in DT data
Date: Thu, 17 Jan 2019 13:38:15 -0800
Message-ID: <87tvi73qyg.fsf@anholt.net>
References: <20190117111918.31759-1-tomi.valkeinen@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1885300872=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190117111918.31759-1-tomi.valkeinen@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
List-Id: devicetree@vger.kernel.org

--===============1885300872==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Tomi Valkeinen <tomi.valkeinen@ti.com> writes:

> The DRM device minor numbers are allocated according to the registration
> order. This causes confusion in cases where the registration order can
> change, or when, say, a modesetting capable device is preferred to be
> card0, and a rendering device is preferred to be card1.
>
> This patch adds similar functionality that is used in some other
> subsystems, where device minor numbers can be defined in DT bindings'
> aliases node.
>
> For example, this sets the DRM device minor number to 1 for the 'dss'
> device.
>
> aliases {
> 	gpu1 = &dss;
> };

This would be really nice to have.  Given that there's plenty of
userspace code that opens the first available DRM node (whether or not
that is Correct Behavior), making their behavior not dependent on the
random probe order is a good thing.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlxA9ccACgkQtdYpNtH8
nuicAw/9EJ29WILMWp0TzOcR8EfB/RGp9Til9PM+4yiUPPtbV1DWte4EINtITX9P
bPYBs7DChsH3D1bQS8C9bGKu0tw+IhR6FsLhcrnL/84TcYhz7RHatg9D+7bySBAP
BxGIxvlo80s4qUIHgwpc4MlSW8cP1+8eqp15W7Nh2lg4FVO0UkdjWVD2YmHNcLmk
qA0IMUNDl2LZw9X8hYHesYrWefRdT2y/xorBIdTmd2g9fxSAXPHjnnuc+PRehY83
i4cxal4AIEiDbKQPJDmX8xJ9b8vzhQLLNl16cZCYeJC4O0zRcNlk6S+Aj7etrSYT
1Fpe8yIbh6Kmb3XPtizbvT7ARt16bKQimD3ouJw3bC6AGkFt/1KyY6iwNjs+BdGC
0kimvjCEYFG/h7R7ZJyzJ/BsalIXUEwtRK3Ma/gvUxHycHZ3WBiTI9jFos+ksOAZ
phqwXRIEi6PMJDZr9I4AN9rmNAnZd2IRLgw22civVqCEULrSPFLqW1JlK3iuoWT2
Cd4hy7q/4IU5Lic3YMbWbVapd8VwMqy9vfzpROzLht22fLsnuqzKTWOnYXFEQIMO
3OpC/NsgHuVT5+kgGLBEyALE4j9z3ieVYxckSEU3Vc6gHuUNbWJq/HsUFtc5Bt1X
UIfNHcTFV26vKIVdb4BfV0LGpglbsn1fgL4XCFW5saZsGkZLkxc=
=cfVV
-----END PGP SIGNATURE-----
--=-=-=--

--===============1885300872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1885300872==--
