From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 02/13] devicetree/bindings: display: Add bindings for
 LVDS panels
Date: Tue, 22 Nov 2016 12:02:41 +0100
Message-ID: <20161122110241.GA22735@ulmo.ba.sec>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1479526093-7014-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479526093-7014-3-git-send-email-laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2016 at 05:28:02AM +0200, Laurent Pinchart wrote:
> LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A.
> Multiple incompatible data link layers have been used over time to
> transmit image data to LVDS panels. This binding supports display panels
> compatible with the JEIDA-59-1999, Open-LDI and VESA SWPG
> specifications.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnhk3lzF8UVTdg@public.gmane.org=
m>
> ---
>  .../bindings/display/panel/panel-lvds.txt          | 120 +++++++++++++++=
++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel=
-lvds.txt
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.t=
xt b/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> new file mode 100644
> index 000000000000..b938269f841e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> @@ -0,0 +1,120 @@
> +LVDS Display Panel
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Mu=
ltiple
> +incompatible data link layers have been used over time to transmit image=
 data
> +to LVDS panels. This bindings supports display panels compatible with the
> +following specifications.
> +
> +[JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, Februa=
ry
> +1999 (Version 1.0), Japan Electronic Industry Development Association (J=
EIDA)
> +[LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
> +Semiconductor
> +[VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Video
> +Electronics Standards Association (VESA)
> +
> +Device compatible with those specifications have been marketed under the
> +FPD-Link and FlatLink brands.
> +
> +
> +Required properties:
> +
> +- compatible: Shall contain "panel-lvds" in addition to a mandatory
> +  panel-specific compatible string defined in individual panel bindings.=
 The
> +  "panel-lvds" value shall never be used on its own.

What good is it if it shall never be used on its own? The above sounds
to me like the panel-specific compatible string implies the LVDS
binding, in a way that many compatible strings imply the simple binding.
Note that initially we did the very same thing with "panel-simple", only
to realize that it's completely redundant because it is never used.

> +- width-mm: See panel-common.txt.
> +- height-mm: See panel-common.txt.
> +- data-mapping: The color signals mapping order, "jeida-18", "jeida-24"
> +  or "vesa-24".
> +
> +Optional properties:
> +
> +- label: See panel-common.txt.
> +- gpios: See panel-common.txt.
> +- backlight: See panel-common.txt.
> +- data-mirror: If set, reverse the bit order described in the data mappi=
ngs
> +  below on all data lanes, transmitting bits for slots 6 to 0 instead of
> +  0 to 6.
> +
> +Required nodes:
> +
> +- panel-timing: See panel-common.txt.
> +- ports: See panel-common.txt. These bindings require a single port subn=
ode
> +  corresponding to the panel LVDS input.

Looks like I should go read the patch that introduces panel-common.txt
first...

Thierry

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYNCXPAAoJEN0jrNd/PrOh2Z4P/imodsQDUeD6Sypke/qZuoFS
NLMkIIcS7x9ii0M7oNSGkqCWo547cQqejst50RHe1lBJVX45Uo/fXPX7SbQnP0Si
DcbitdN9RGm6b2jEfc6qmm+W6uMGRoWT/gRVKQdtkyqVUAnr2mK9GowUp3LURYn0
v5shafqIfzPRHSyddhcjYUcZcum0WO7iW1jn52jE/Z1rkvF7LshnON7Oz8nj7OeM
Vfxr6bgTGyqETb4kfu8d4qtgWG4ryrehVYhFRKMPoPhwp5V0vLblXdJq59EThSd7
+6xWlNJ9Hq8Mw8TaPegfrK9Tf+feQ7/04KOott2OgIo1aHc0D3CNJ2eYXlPSfYsb
gMn13EgUUF8F9IP2VTVV8A2ZdNXy3Jc1sjH1XpyNU5tLod8f1eoLIgz7YHsJ7Ggw
vKMsCzkuFlPCLJl04FjVqeo4+tD0/OFcg1ZTRkidCS1JYu7ee6EIXXNu8q58im1p
8hzSq7QS6TnimZNtfsj2o4Dh0eN7AuSDwFQmuWfSkndlvEFPi8sNEHE97lfs3hth
X9Jn2AAeibJR2S7uRyKhTuX6Qbps0D20oH3+BRTkHYnqqLKg9wNPoMxHTgB+rptG
SguztypEmsBvE0CUl/ygv3Sjv1GISMDUlUZmFLQyzyiXKIRSTlxfEtxw96po95BB
BRCpkvwm6+rm8Ujz2d4l
=ff/C
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
