From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 4/5] ARM: berlin: Add AHCI and SATA PHY nodes to BG2
Date: Thu, 16 Oct 2014 11:59:46 +0200
Message-ID: <20141016095946.GB1061@kwain>
References: <1413042073-14253-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1413042073-14253-5-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1413042073-14253-5-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sebastian,

On Sat, Oct 11, 2014 at 05:41:12PM +0200, Sebastian Hesselbarth wrote:
> =20
> +		ahci: sata@e90000 {
> +			compatible =3D "marvell,berlin2-ahci", "generic-ahci";
> +			reg =3D <0xe90000 0x1000>;
> +			interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&chip CLKID_SATA>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";

The ahci generic driver actually returns -ENODEV if no port is
activated. There is no need to disable it from there.

> +
> +			sata0: sata-port@0 {
> +				reg =3D <0>;
> +				phys =3D <&sata_phy 0>;
> +				status =3D "disabled";
> +			};
> +
> +			sata1: sata-port@1 {
> +				reg =3D <1>;
> +				phys =3D <&sata_phy 1>;
> +				status =3D "disabled";
> +			};
> +		};

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
