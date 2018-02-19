From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: Add panel-timing subnode to
 simple-panel
Date: Mon, 19 Feb 2018 16:09:30 +0100
Message-ID: <20180219150930.GM11455@ulmo>
References: <20180208174855.55620-1-seanpaul@chromium.org>
 <20180208174855.55620-4-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0865176954=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180208174855.55620-4-seanpaul@chromium.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, Jeffy Chen <jeffy.chen@rock-chips.com>, Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>
List-Id: devicetree@vger.kernel.org


--===============0865176954==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hdhkc9EpVJoq6PQ6"
Content-Disposition: inline


--hdhkc9EpVJoq6PQ6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 08, 2018 at 12:48:50PM -0500, Sean Paul wrote:
> This patch adds a new subnode to simple-panel allowing us to override
> the typical timing expressed in the panel's display_timing.
>=20
> Changes in v2:
>  - Split out the binding into a new patch (Rob)
>  - display-timings is a new section (Rob)
>  - Use the full display-timings subnode instead of picking the timing
>    out (Rob/Thierry)
> Changes in v3:
>  - Go back to using the timing subnode directly, but rename to
>    panel-timing (Rob)
>=20
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: St=C3=A9phane Marchesin <marcheu@chromium.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  .../bindings/display/panel/simple-panel.txt        | 30 ++++++++++++++++=
++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/simple-panel=
=2Etxt b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> index 45a457ad38f0..7788b9ce160b 100644
> --- a/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> +++ b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> @@ -12,6 +12,24 @@ Optional properties:
>  - enable-gpios: GPIO pin to enable or disable the panel
>  - backlight: phandle of the backlight device attached to the panel
> =20
> +panel-timing subnode
> +--------------------
> +
> +This optional subnode is for devices which require a mode differing from=
 the
> +panel's "typical" display timing as programmed in the simple-panel drive=
r.
> +Overriding the driver mode must only be done in the following scenario:
> + - The restrictions motivating the override cannot be applied to the pla=
tform's
> +   display driver (ie: it must be specific to the device not the platfor=
m)
> + - The panel must not have a fixed mode attributed to it in the driver

I think this is somewhat ambiguous. One could argue that panels only
have a fixed mode. What you means if obviously the fixed DRM display
mode, but that's not something that should go into the binding. I'd
simply drop this requirement.

> + - The panel must provide at list one display_timing range by which the =
override
> +   mode can be validated against

This is the important bit and kind of obsoletes the above anyway. Oh,
and you probably meant "... provide at _least_ one..."

> + - The override mode will use the 'typ' values from the panel-timings su=
bnode

The properties for display timings in DT don't list anything other than
the 'typ' values, right? I'm not sure I understand this requirement.

> + - You must provide all required properties for the panel-timing subnode

Isn't this redundant? required properties are always required.

Other than the unclarities, the above does reflect what we had discussed
on IRC. I wonder, though, how much of this really belongs in the device
tree bindings. The above are almost all restrictions that apply to the
driver, and are very specific to Linux. Perhaps this is something that
belongs in the GPU documentation rather than DT bindings. They are more
like guidelines for what panel drivers should look like rather than what
the DT should look like.

Thierry

--hdhkc9EpVJoq6PQ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqK6KoACgkQ3SOs138+
s6EasQ//TXaKOcEATrKdv49bi0O4g5yl44ADHE+++3Q0Ussc2J+HSk/4nyUV9s9p
qTirUqihhxMcH0g7llm2PBB7yr25oJzDzJ8yQiW2oIbE6B3GhNwTpJNi8mIVRDt0
wn1IN0l/69ZGS429FdG6CqHQJwRRDiI9Ks7ARUAHb2U0bp5SqSeXZ55Zgiat21k0
3KCF2NMZd9mSNz/sR1m4vpkNTuRi4BFVoUC78ebTknGNnjrqzJjUYzCrpXJOjJlY
7AjWKRYAcATfJ0AIn7acQjSCywh0yk+4iAb0quZ+bg1DUo4/doeV/JgNezhTXSYq
jpM1PqpUo/eXGswOzCMzRazjjvkdRUd+23K+PCj4k5muG0xlSIS3dDbBv2Z+wB3L
Zxxdr6XpoXwkHfN9uOQKA6rWtHDgO9HEUjUMQGh/bzXv9yd7YRJgEwOKK7zBbFF1
KHYsAASpu+ezFd5J7jmnkiafn1kBgOn3Ugvx/Q2KsyjflE+IYC8PzQ1qWmupLLIi
Ut2WjE1vo6ulYH0iJYgWUfF5ge3uvdO/4uhgrdDBShBmhOfh3esCXjSufJvLME29
QfqtxNmSQN5kP88mlLy4qaEoxtiBzeY7INca3KEggvpsaSpf4mgPZMCb0Uj7MP8U
iGHRMAqhSzS1SjocDx2vJxonIKrSJcIvNqG2IPkwvVbIAlnmuMY=
=/lNv
-----END PGP SIGNATURE-----

--hdhkc9EpVJoq6PQ6--

--===============0865176954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0865176954==--
