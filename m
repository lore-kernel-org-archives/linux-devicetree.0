From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: dove: add Dove divider clocks
Date: Mon, 07 Dec 2015 18:40:15 +0100
Message-ID: <87k2oqb1j4.fsf@free-electrons.com>
References: <E1a5ijN-0007pq-3t@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <E1a5ijN-0007pq-3t@rmk-PC.arm.linux.org.uk> (Russell King's
	message of "Sun, 06 Dec 2015 23:28:37 +0000")
Sender: linux-clk-owner@vger.kernel.org
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Russell,
=20
 On lun., d=C3=A9c. 07 2015, Russell King <rmk+kernel@arm.linux.org.uk>=
 wrote:

> Add the Dove divider clocks to the Dove dtsi file.
>
> Acked-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

Applied on mvebu/dt

Thanks,

Gregory

> ---
>  arch/arm/boot/dts/dove.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dts=
i
> index 179121630ad7..ea36a262d056 100644
> --- a/arch/arm/boot/dts/dove.dtsi
> +++ b/arch/arm/boot/dts/dove.dtsi
> @@ -459,6 +459,12 @@
>  					#clock-cells =3D <1>;
>  				};
> =20
> +				divider_clk: core-clock@0064 {
> +					compatible =3D "marvell,dove-divider-clock";
> +					reg =3D <0x0064 0x8>;
> +					#clock-cells =3D <1>;
> +				};
> +
>  				pinctrl: pin-ctrl@0200 {
>  					compatible =3D "marvell,dove-pinctrl";
>  					reg =3D <0x0200 0x14>,
> --=20
> 2.1.0
>

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
