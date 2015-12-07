From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: add Marvell core PLL and clock divider PMU documentation
Date: Mon, 07 Dec 2015 18:37:47 +0100
Message-ID: <87oae2b1n8.fsf@free-electrons.com>
References: <E1a5ijC-0007pd-SL@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <E1a5ijC-0007pd-SL@rmk-PC.arm.linux.org.uk> (Russell King's
	message of "Sun, 06 Dec 2015 23:28:26 +0000")
Sender: linux-clk-owner@vger.kernel.org
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Russell,
=20
 On lun., d=C3=A9c. 07 2015, Russell King <rmk+kernel@arm.linux.org.uk>=
 wrote:

> Add documentation for the Marvell clock divider driver, which is used
> to source clocks for the AXI bus, video decoder, GPU and LCD blocks.
>
> Acked-by: Andrew Lunn <andrew@lunn.ch>
> Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

Applied on mvebu/dt

Thanks,

Gregory

> ---
>  .../bindings/clock/dove-divider-clock.txt          | 28 ++++++++++++=
++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/dove-divi=
der-clock.txt
>
> diff --git a/Documentation/devicetree/bindings/clock/dove-divider-clo=
ck.txt b/Documentation/devicetree/bindings/clock/dove-divider-clock.txt
> new file mode 100644
> index 000000000000..e3eb0f657c5e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/dove-divider-clock.txt
> @@ -0,0 +1,28 @@
> +PLL divider based Dove clocks
> +
> +Marvell Dove has a 2GHz PLL, which feeds into a set of dividers to p=
rovide
> +high speed clocks for a number of peripherals.  These dividers are p=
art of
> +the PMU, and thus this node should be a child of the PMU node.
> +
> +The following clocks are provided:
> +
> +ID	Clock
> +-------------
> +0	AXI bus clock
> +1	GPU clock
> +2	VMeta clock
> +3	LCD clock
> +
> +Required properties:
> +- compatible : shall be "marvell,dove-divider-clock"
> +- reg : shall be the register address of the Core PLL and Clock Divi=
der
> +   Control 0 register.  This will cover that register, as well as th=
e
> +   Core PLL and Clock Divider Control 1 register.  Thus, it will hav=
e
> +   a size of 8.
> +- #clock-cells : from common clock binding; shall be set to 1
> +
> +divider_clk: core-clock@0064 {
> +	compatible =3D "marvell,dove-divider-clock";
> +	reg =3D <0x0064 0x8>;
> +	#clock-cells =3D <1>;
> +};
> --=20
> 2.1.0
>

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
