From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 1/4] arm64: dts: marvell: Clean up armada-3720-db
Date: Thu, 24 Mar 2016 17:11:43 +0100
Message-ID: <87zitnn9ds.fsf@free-electrons.com>
References: <1458771861-12392-1-git-send-email-afaerber@suse.de>
	<1458771861-12392-2-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458771861-12392-2-git-send-email-afaerber@suse.de> ("Andreas
	=?utf-8?Q?F=C3=A4rber=22's?= message of "Wed, 23 Mar 2016 23:24:18 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Andreas,
=20
 On mer., mars 23 2016, Andreas F=C3=A4rber <afaerber@suse.de> wrote:

> Instead of duplicating the SoC's node hierarchy, including a bus node
> named "internal-regs", reference the actually desired nodes by label,
> like Berlin already does. Add labels where necessary.

We talked about this for the 3rd patch, but the conclusion will apply
here too. So we are going to use this solution for the mvebu 64bits. I
have just a minor remark.

>
> Drop an inconsistent white line while at it.
>
> Fixes: adbc3695d9e4 ("arm64: dts: add the Marvell Armada 3700 family =
and a development board")
> Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  arch/arm64/boot/dts/marvell/armada-3720-db.dts | 35 +++++++++++-----=
----------
>  arch/arm64/boot/dts/marvell/armada-372x.dtsi   |  1 -
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi   |  4 +--
>  3 files changed, 17 insertions(+), 23 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-db.dts b/arch/ar=
m64/boot/dts/marvell/armada-3720-db.dts
> index 359050154511..48f97d14b057 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-db.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-db.dts
> @@ -60,27 +60,22 @@
>  		device_type =3D "memory";
>  		reg =3D <0x00000000 0x00000000 0x00000000 0x20000000>;
>  	};
> +};
> =20
> -	soc {
> -		internal-regs {
> -			/*
> -			* Exported on the micro USB connector CON32
> -			* through an FTDI
> -			*/
> -			uart0: serial@12000 {
> -				status =3D "okay";
> -			};
> -
> -			/* CON31 */
> -			usb3@58000 {
> -				status =3D "okay";
> -			};
> +/* CON3 */
> +&sata {
> +	status =3D "okay";
> +};
> =20
> -			/* CON3 */
> -			sata@e0000 {
> -			       status =3D "okay";
> -			};
> -		};
> -	};
> +/*
> + * Exported on the micro USB connector CON32
> + * through an FTDI
> + */

As the comment didn't start anymore from the middle of the line, we
could have it an a single line. We don't have to split in 2 lines.

Thanks,

Gregory

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
