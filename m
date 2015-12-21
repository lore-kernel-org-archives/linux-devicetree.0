From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v2 2/9] ARM: mvebu: kirkwood: Add compatible property to "partitions" node
Date: Mon, 21 Dec 2015 17:49:58 +0100
Message-ID: <87vb7rrbk9.fsf@free-electrons.com>
References: <1450694033-27717-1-git-send-email-geert+renesas@glider.be>
        <1450694033-27717-3-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1450694033-27717-3-git-send-email-geert+renesas@glider.be>
        (Geert Uytterhoeven's message of "Mon, 21 Dec 2015 11:33:46 +0100")
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: arm@kernel.org, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Alex Smith <alex.smith@imgtec.com>, Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org, linux-mips@linux-mips.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Geert,
=20
 On lun., d=C3=A9c. 21 2015, Geert Uytterhoeven <geert+renesas@glider.b=
e> wrote:

> As of commit e488ca9f8d4f62c2 ("doc: dt: mtd: partitions: add compati=
ble
> property to "partitions" node"), the "partitions" subnode of an SPI
> FLASH device node must have a compatible property. The partitions are=
 no
> longer detected if it is not present.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied on mvebu/dt

Thanks,

Gregory

> ---
> v2:
>   - New.
> ---
>  arch/arm/boot/dts/kirkwood-pogoplug-series-4.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/kirkwood-pogoplug-series-4.dts b/arch/=
arm/boot/dts/kirkwood-pogoplug-series-4.dts
> index 1db6f2c506cce320..8082d64266a37c33 100644
> --- a/arch/arm/boot/dts/kirkwood-pogoplug-series-4.dts
> +++ b/arch/arm/boot/dts/kirkwood-pogoplug-series-4.dts
> @@ -131,6 +131,7 @@
>  	chip-delay =3D <40>;
>  	status =3D "okay";
>  	partitions {
> +		compatible =3D "fixed-partitions";
>  		#address-cells =3D <1>;
>  		#size-cells =3D <1>;
> =20
> --=20
> 1.9.1
>

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
