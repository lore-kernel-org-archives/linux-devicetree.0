From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec"
 binding
Date: Thu, 12 Mar 2015 10:58:24 +0000
Message-ID: <20150312105824.GD30145@leverpostej>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426111046-29900-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 11, 2015 at 09:57:25PM +0000, Brian Norris wrote:
> Almost all flash that are "compatible" with m25p80 support the JEDEC
> READ ID opcode (0x95), and in fact, that is often the only thing that=
 is
> used to differentiate them. Let's add a compatible string that
> represents this lowest common denominator of compatibility.
>=20
> Device trees can still specify manufacturer/device names in addition,
> but (until some reason is found to differentiate between them through
> device tree) software will likely want to bind just against the gener=
ic
> name, and avoid unnecessarily growing its device ID binding tables.
>=20
> This is related to the work of commit a5b7616c55e1 ("mtd:
> m25p80,spi-nor: Fix module aliases for m25p80"), which showed that
> maintaining these device tables as stable device-tree/modalias bindin=
g
> tables is not a worthwhile burden for mostly-comptatible flash.
>=20
> At the same time, let's update the binding doc to point to the
> m25p_ids[] ID list instead of spi_nor_ids[]. The former can be used f=
or
> device tree bindings, but the latter cannot. In the future, we should
> pare down the m25p_ids[] list to only those IDs which are actually us=
ed
> in device trees.

We really should not be referring to C files for the binding. The right
fix is to define the list in the binding document.

Mark.

>=20
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mtd/m25p80.txt | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Docum=
entation/devicetree/bindings/mtd/m25p80.txt
> index 4611aa83531b..1b2997d4cee4 100644
> --- a/Documentation/devicetree/bindings/mtd/m25p80.txt
> +++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
> @@ -3,9 +3,12 @@
>  Required properties:
>  - #address-cells, #size-cells : Must be present if the device has su=
b-nodes
>    representing partitions.
> -- compatible : Should be the manufacturer and the name of the chip. =
Bear in mind
> +- compatible : Should be "nor-jedec" for any SPI NOR flash that can =
be
> +               identified by the JEDEC READ ID opcode (0x95).
> +               Additionally, may include a device-specific string co=
nsisting of
> +               the manufacturer and name of the chip. Bear in mind
>                 the DT binding is not Linux-only, but in case of Linu=
x, see the
> -               "spi_nor_ids" table in drivers/mtd/spi-nor/spi-nor.c =
for the list
> +               "m25p_ids" table in drivers/mtd/devices/m25p80.c for =
the list
>                 of supported chips.
>  - reg : Chip-Select number
>  - spi-max-frequency : Maximum frequency of the SPI bus the chip can =
operate at
> @@ -22,7 +25,7 @@ Example:
>  	flash: m25p80@0 {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <1>;
> -		compatible =3D "spansion,m25p80";
> +		compatible =3D "spansion,m25p80", "nor-jedec";
>  		reg =3D <0>;
>  		spi-max-frequency =3D <40000000>;
>  		m25p,fast-read;
> --=20
> 1.9.1
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
