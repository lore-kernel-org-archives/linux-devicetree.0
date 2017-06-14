From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: Add INNOLUX P079ZCA panel bindings
Date: Wed, 14 Jun 2017 19:34:11 +0200
Message-ID: <20170614173411.GA14971@ulmo>
References: <1490316692-20506-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0644227200=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1490316692-20506-1-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chris Zhong <zyw@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============0644227200==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2017 at 08:51:31AM +0800, Chris Zhong wrote:
> The Innolux P079ZCA is a 7.85" panel with a 768X1024 resolution and
> connected to DSI using four lanes.
>=20
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> ---
>=20
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>=20
>  .../bindings/display/panel/innolux,p079zca.txt     | 23 ++++++++++++++++=
++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/innol=
ux,p079zca.txt

Both patches applied to drm-misc-next, thanks.

Thierry

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAllBc5AACgkQ3SOs138+
s6Go1Q/+Jsbt7lYP4omNJIAu7+0zx2F6Y7TuAlP6vl3ROS8HEC2EcIEhm5gs/4Ew
t+CqjzXOmszol+RJPRluZCkyKmNaEQYghSygDC57/2W5x6BKtfklKMmV/snbdN5I
LyS5GNqqp6fuhT1MMPDqKqDixzMmALjXD9bdI6LVxcaT/HHQVTYVzu93+xAo7wTt
74YxiUVF1dPzfDSbxvUkPyxEfiC7c8Oq85Iwz2X8WkE1gAPtBjaZtcy1XXgmbNGC
ivOGUndTTLHIhWOVzdSwoKpifz6O2vvE+mzGkWQ6VjnBN5Efi0pncAe8qFJ8IlJ2
ebDVaXWiWEOF0s4WJEqLXg17pAPgG4T4r1b9Muov0iH0xrmX1vh9rN3LQ7UKXtjA
zHJnbtQjS0ukEGclHlJ9xA2I9RIHgkY7Tx7d57weVG3sCzV+XgXN9QiB3LS7nsut
brxYgXUMsViRkGlpv8xwCP2La3kIfxnbJa9Kc4nXUuKUa7NucXBMXo+pwsWuZTzh
uTe4cPa0E/L+QRrZVBkijXlphBQU8G76/rlcFBqaWQ6IoVrNZjbkFvUWumZnRwGO
vf2Mgu2O+52vt1jDr55zucgixJGwcNwaBsyusMUwN6+KKZa0halqWx47IxYFt9SU
0SSF206QrMVOMYKJpVh/G5M+Ehty/AcV4s9uPC7Coq3TqwTjVWs=
=/w3A
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--

--===============0644227200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0644227200==--
