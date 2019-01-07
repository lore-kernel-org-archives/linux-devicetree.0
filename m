Return-Path: <SRS0=iARg=PP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:14106 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726864AbfAGQVg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 7 Jan 2019 11:21:36 -0500
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] ARM: dts: omap3-gta04: Fix graph_port warning
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190107160512.9480-1-tony@atomide.com>
Date: Mon, 7 Jan 2019 17:21:32 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <ED6668F3-73A7-49A1-A7C7-E54381841222@goldelico.com>
References: <20190107160512.9480-1-tony@atomide.com>
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Tony,

> Am 07.01.2019 um 17:05 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> We're currently getting a warning with make dtbs:
>=20
> arch/arm/boot/dts/omap3-gta04.dtsi:720.7-727.4: Warning (graph_port):
> /ocp@68000000/dss@48050000/encoder@48050c0 0/port: graph node unit
> address error, expected "0"

yes, dtc has become more critical nowadays...

To me it looks like redundant information, but it is how it is.

>=20
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
> arch/arm/boot/dts/omap3-gta04.dtsi | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi =
b/arch/arm/boot/dts/omap3-gta04.dtsi
> --- a/arch/arm/boot/dts/omap3-gta04.dtsi
> +++ b/arch/arm/boot/dts/omap3-gta04.dtsi
> @@ -717,7 +717,7 @@
> 	#address-cells =3D <1>;
> 	#size-cells =3D <0>;
>=20
> -	port {
> +	port@0 {
> 		reg =3D <0>;
> 		venc_out: endpoint {
> 			remote-endpoint =3D <&opa_in>;

Looks good to me.

BR and thanks,
NIkolaus
