From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: berlin: enable SD card reader and eMMC
 for the BG2Q DMP
Date: Wed, 23 Apr 2014 19:26:23 +0200
Message-ID: <5357F7BF.8000703@gmail.com>
References: <1398155248-1659-1-git-send-email-antoine.tenart@free-electrons.com> <1398155248-1659-3-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398155248-1659-3-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QW50b2luZSBUw6luYXJ0?= <antoine.tenart@free-electrons.com>
Cc: alexandre.belloni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/22/2014 10:27 AM, Antoine T=C3=A9nart wrote:
> Enable the SD Card reader and the internal eMMC on the Berlin BG2Q DM=
P
> using two of the SDHCI nodes of the Berlin BG2Q.
>=20
> Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com=
>
> ---
>  arch/arm/boot/dts/berlin2q-marvell-dmp.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts b/arch/arm/bo=
ot/dts/berlin2q-marvell-dmp.dts
> index 2da9c41e29d8..6ca8c9e52b08 100644
> --- a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> +++ b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> @@ -26,3 +26,14 @@
>  &uart0 {
>  	status =3D "okay";
>  };
> +
> +&sdhci1 {

Antoine,

nit: please sort referenced nodes alphabetically.

With your comments about mmc aliases, I can take both patches
in now (and fixup ordering) if you like.

Sebastian

> +	broken-cd;
> +	sdhci,wp-inverted;
> +	status =3D "okay";
> +};
> +
> +&sdhci2 {
> +	non-removable;
> +	status =3D "okay";
> +};
>=20
