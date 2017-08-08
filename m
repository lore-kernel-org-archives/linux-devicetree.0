From: Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH 2/2] ARM: shmobile: document iW-RainboW-G22D SODIMM SOM
 Development Platform
Date: Tue, 8 Aug 2017 14:15:38 +0000
Message-ID: <TY1PR06MB07025B57A216FAD06841241DB78A0@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <cover.1502190772.git.fabrizio.castro@bp.renesas.com>
 <8d98401d979ade94d19031ab3240d81c0959380b.1502190772.git.fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <8d98401d979ade94d19031ab3240d81c0959380b.1502190772.git.fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Biju Das <biju.das@bp.renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

+ linux-renesas-soc

> From: Fabrizio Castro [mailto:fabrizio.castro@bp.renesas.com]
> Sent: 08 August 2017 13:28
>=20
> Document the iW-RainboW-G22D device tree bindings.
> It is just a placeholder for the time being, the actual implementation is=
 not
> available yet.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt
> b/Documentation/devicetree/bindings/arm/shmobile.txt
> index 64e7f63..ae75cb3 100644
> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -68,6 +68,8 @@ Boards:
>      compatible =3D "renesas,h3ulcb", "renesas,r8a7795";
>    - Henninger
>      compatible =3D "renesas,henninger", "renesas,r8a7791"
> +  - iWave Systems RZ/G1E SODIMM SOM Development Platform (iW-
> RainboW-G22D)
> +    compatible =3D "iwave,g22d", "iwave,g22m", "renesas,r8a7745"
>    - iWave Systems RZ/G1E SODIMM System On Module (iW-RainboW-G22M-
> SM)
>      compatible =3D "iwave,g22m", "renesas,r8a7745"
>    - iWave Systems RZ/G1M Qseven Development Platform (iW-RainboW-G20D-
> Qseven)
> --
> 1.9.1
