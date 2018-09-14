From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 03/16] dt-bindings: display: renesas: lvds: Add EXTAL and
 DU_DOTCLKIN clocks
Date: Fri, 14 Sep 2018 10:00:46 +0200
Message-ID: <20180914080046.GK11509@w540>
References: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180904121027.24031-4-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0596855526=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180904121027.24031-4-laurent.pinchart+renesas@ideasonboard.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============0596855526==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="64LDleNqNegJ4g97"
Content-Disposition: inline


--64LDleNqNegJ4g97
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Tue, Sep 04, 2018 at 03:10:14PM +0300, Laurent Pinchart wrote:
> On the D3 and E3 SoCs, the LVDS encoder can derive its internal pixel
> clock from an externally supplied clock, either through the EXTAL pin or
> through one of the DU_DOTCLKINx pins. Add corresponding clocks to the DT
> bindings.
>
> To retain backward compatibility with DT that don't specify the
> clock-names property, the functional clock must always be specified
> first, and the clock-names property is optional when only the functional
> clock is specified.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/bridge/renesas,lvds.txt      | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> index 13af7e2ac7e8..9e3913f6a643 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -19,7 +19,17 @@ Required properties:
>    - "renesas,r8a77995-lvds" for R8A77995 (R-Car D3) compatible LVDS encoders
>
>  - reg: Base address and length for the memory-mapped registers
> -- clocks: A phandle + clock-specifier pair for the functional clock
> +- clocks: A list of phandles + clock-specifier pairs, one for each entry in
> +  the clock-names property.
> +- clock-names: Name of the clocks. This property is model-dependent.
> +  - The functional clock is mandatory for all models, shall be listed first,

I would write

The functional clock, which is mandatory for all models, shall be listed
first and shall be named "fck".

> +    and shall be named "fck".
> +  - On R8A77990 and R8A77995, the LVDS encoder can use the EXTAL or
> +    DU_DOTCLKINx clocks. Those clocks are optional. When supplied they must be
> +    named "extal" and "dclkin.x" respectively, with "x" being the DU_DOTCLKIN
> +    numerical index.

Is it valid to list other clocks here for the other SoCs?

> +  - When the clocks property only contains the functional clock, the
> +    clock-names property may be omitted.
>  - resets: A phandle + reset specifier for the module reset

Thanks
   j
>
>  Required nodes:
> --
> Regards,
>
> Laurent Pinchart
>

--64LDleNqNegJ4g97
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbm2quAAoJEHI0Bo8WoVY8pZUP/0OLO1hxq0tAf1q1O2BAF4DR
zJxo7GR/o4pkYSqkO9yhDsbej5WZu15dq4Vp7/M/d+JxYyNbXpNzgXFxvVXvF4vH
b41v0+eJSjukrbqX+WnKG1VeeAIKXntia2uAGzNML+GTGlzHRMdsXk4NdvOFnpK5
ayGDiJwlbdqIa2B9YALMy6swEPF+QRow/+M9yapw2QuD/bvfti7aJGXzPV2AI5dC
y9r+RpO+J8YXFG3HyBSAakksWniJot3Rkvg/6Ekr8mZpVfxug5tokiO/G3/G865s
jKxXS2MLaNA5KZm/+Vs3fRAuFa+qtiJ4hlizrAA3/P/i5KKUvCsl8L9/zQJvyq9O
/U/lINHdYu5Cmd2FzZLn/ET7MIirpEslgLa+jmk49FbbFGsZevqTdx1wUD1rXDV5
w1AKBQ7q4Wrqi/Bg6HwEkkKOcHASzb4804rGNmLdN+I7VdWSLfM7EE6/iozhp2E9
KoDWD8C1f1KKzkb+hxnjPycLQNVfEfCn15FKc/eNJPiZP4cksytLKB55mdNRRhui
fXusxSZFcCtcnOGPPxdd4EWplWvRTc/Q3M6I4FHQj7zGkO1pmte2JRcBeBs+iXYM
Y6ZYc2rAwv/90z2ieiWplT6BA5xFIUxeQ++GV9W/O4uZWx5uMkX0ofTaYVx0klU0
M+yT0BhHxGnWjbyYq+OA
=HjT7
-----END PGP SIGNATURE-----

--64LDleNqNegJ4g97--

--===============0596855526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0596855526==--
