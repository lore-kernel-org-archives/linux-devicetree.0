From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [1/2, v3] powerpc/fsl-booke: Add initial T1040/T1042 RDB board
 support
Date: Wed, 3 Sep 2014 18:01:06 -0500
Message-ID: <20140903230106.GA5830@home.buserror.net>
References: <1407741488-2661-1-git-send-email-Priyanka.Jain@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1407741488-2661-1-git-send-email-Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Poonam Aggrwal <poonam.aggrwal-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Prabhakar Kushwaha <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 11, 2014 at 12:48:08PM +0530, Priyanka Jain wrote:
> T1040/T1042RDB is Freescale Reference Design Board.
> The board can support both T1040/T1042 QorIQ Power Architecture=E2=84=
=A2 processor.
>=20
> T1040/T1042RDB board Overview
> -----------------------
> - SERDES Connections, 8 lanes supporting:
> 	- PCI
> 	- SGMII
>     	- QSGMII
>     	- SATA 2.0
> - DDR Controller
>     	- Supports rates of up to 1600 MHz data-rate
>     	- Supports one DDR3LP UDIMM
> -IFC/Local Bus
>     	- NAND flash: 1GB 8-bit NAND flash
>     	- NOR: 128MB 16-bit NOR Flash
> - Ethernet
>     	- Two on-board RGMII 10/100/1G ethernet ports.
>     	- PHY #0 remains powered up during deep-sleep
> - CPLD
> - Clocks
>     	- System and DDR clock (SYSCLK, =E2=80=9CDDRCLK=E2=80=9D)
>     	- SERDES clocks
> - Power Supplies
> - USB
>     	- Supports two USB 2.0 ports with integrated PHYs
>     	- Two type A ports with 5V@1.5A per port.
> - SDHC
>     	- SDHC/SDXC connector
> - SPI
>     	- On-board 64MB SPI flash
> - I2C
>     	- Devices connected: EEPROM, thermal monitor, VID controller
> - Other IO
>     	- Two Serial ports
>     	- ProfiBus port
>=20
> Add support for T1040/T1042 RDB board:
>     -add device tree
>     -add entry in Kconfig to build
>     -Add entry in corenet_generic.c, as it is similar to other corene=
t platforms
>=20
> Signed-off-by: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Poonam Aggrwal <poonam.aggrwal-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Prabhakar Kushwaha <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> changes for v3: Incorporated Scott comments on moving cpld compatible
>  field to board specific file as cpld binaries are different
[snip]
> diff --git a/arch/powerpc/boot/dts/t1042rdb.dts b/arch/powerpc/boot/d=
ts/t1042rdb.dts
> new file mode 100644
> index 0000000..228a635
> --- /dev/null
> +++ b/arch/powerpc/boot/dts/t1042rdb.dts
[snip]
> +/include/ "fsl/t104xsi-pre.dtsi"
> +/include/ "t104xrdb.dtsi"
> +
> +/ {
> +	model =3D "fsl,T1042RDB";
> +	compatible =3D "fsl,T1042RDB";
> +	ifc: localbus@ffe124000 {
> +		cpld@3,0 {
> +			compatible =3D "fsl,t1040rdb-cpld";
> +		};
> +	};
> +};

The point of moving the cpld compatible is so that they can match the
exact CPLD binary being used.  The above does not match.

Likewise in patch 2/2

-Scott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
