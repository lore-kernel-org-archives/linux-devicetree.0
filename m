From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: berlin: fix typo in chosen property
Date: Tue, 13 Oct 2015 13:35:48 +0200
Message-ID: <20151013113547.GA20884@kwain>
References: <1444734729-4818-1-git-send-email-michael.opdenacker@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444734729-4818-1-git-send-email-michael.opdenacker@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Cc: sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, antoine.tenart@free-electrons.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Oct 13, 2015 at 01:12:09PM +0200, Michael Opdenacker wrote:
> This fixes a trivial typo in the name of the "chosen" device tree pro=
perty
> for the Marvell BG2-Q DMP board.
>=20
> Signed-off-by: Michael Opdenacker <michael.opdenacker@free-electrons.=
com>

Acked-by: Antoine Tenart <antoine.tenart@free-electrons.com>

Thanks!

Antoine

> ---
>  arch/arm/boot/dts/berlin2q-marvell-dmp.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts b/arch/arm/bo=
ot/dts/berlin2q-marvell-dmp.dts
> index 4a749e5b3b44..caeeb345c335 100644
> --- a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> +++ b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> @@ -48,7 +48,7 @@
>  		reg =3D <0x00000000 0x80000000>;
>  	};
> =20
> -	choosen {
> +	chosen {
>  		bootargs =3D "console=3DttyS0,115200 earlyprintk";
>  	};
> =20
> --=20
> 2.1.4
>=20

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
