Return-Path: <SRS0=0yxz=TQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:25406 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbfEPH7H (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 May 2019 03:59:07 -0400
Date: Thu, 16 May 2019 09:59:02 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
Message-ID: <1010579666.68696.1557993542697@webmail.strato.com>
In-Reply-To: <20190516003803.808-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190516003803.808-1-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] dt-bindings: rcar-{csi2,vin}: Rename bindings
 documentation files
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


> On May 16, 2019 at 2:38 AM Niklas S=C3=B6derlund <niklas.soderlund+renesa=
s@ragnatech.se> wrote:
>=20
>=20
> Renesas media binding documentation files uses a naming schema of
> 'renesas,<module>.txt'. Rename VIN and CSI-2 files to match this
> pattern.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  .../media/{renesas,rcar-csi2.txt =3D> renesas,csi2.txt}         | 0
>  .../bindings/media/{rcar_vin.txt =3D> renesas,vin.txt}          | 0
>  MAINTAINERS                                                   | 4 ++--
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/media/{renesas,rcar-csi2.txt =
=3D> renesas,csi2.txt} (100%)
>  rename Documentation/devicetree/bindings/media/{rcar_vin.txt =3D> renesa=
s,vin.txt} (100%)
>=20
> diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.tx=
t b/Documentation/devicetree/bindings/media/renesas,csi2.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> rename to Documentation/devicetree/bindings/media/renesas,csi2.txt
> diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Docum=
entation/devicetree/bindings/media/renesas,vin.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/rcar_vin.txt
> rename to Documentation/devicetree/bindings/media/renesas,vin.txt
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 878588cfb453d83c..c3a23726472d7d4d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9629,8 +9629,8 @@ L:=09linux-media@vger.kernel.org
>  L:=09linux-renesas-soc@vger.kernel.org
>  T:=09git git://linuxtv.org/media_tree.git
>  S:=09Supported
> -F:=09Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> -F:=09Documentation/devicetree/bindings/media/rcar_vin.txt
> +F:=09Documentation/devicetree/bindings/media/renesas,csi2.txt
> +F:=09Documentation/devicetree/bindings/media/renesas,vin.txt
>  F:=09drivers/media/platform/rcar-vin/
> =20
>  MEDIA DRIVERS FOR RENESAS - VSP1
> --=20
> 2.21.0
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
