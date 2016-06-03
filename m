From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/4] of: Add device tree bindings for Evatronix
Date: Fri, 3 Jun 2016 16:22:07 +0200
Message-ID: <20160603162207.0688c9e6@bbrezillon>
References: <alpine.DEB.2.02.1606020946500.19416@lnxricardw1.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1606020946500.19416@lnxricardw1.se.axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, Linux mtd <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ricard,

On Thu, 2 Jun 2016 09:47:18 +0200
Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:

> Devicetree bindings for the driver for the Evatronix NANDFLASH-CTRL N=
AND flash
> controller IP.  This controller is used in the Axis ARTPEC-6 SoC.
>=20
> The driver supports BCH ECC using the controller's hardware, but ther=
e is
> also an option to use software BCH ECC. However, the ECC layouts are =
not
> compatible so it's not possible to mix them. The main advantage to us=
ing
> software ECC is that there are more OOB bytes free, as the hardware i=
s
> slightly wasteful on OOB space.
>=20
> BCH ECC from 4 to 32 bits over 256, 512 or 1024 byte ECC blocks is su=
pported.
>=20
> Only large-page flash chips are supported, using 4 or 5 address cycle=
s.
>=20
> Signed-off-by: Ricard Wanderlof <ricardw@axis.com>
> ---
>  .../devicetree/bindings/mtd/evatronix-nand.txt     |   44 ++++++++++=
++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/evatronix-n=
and.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/evatronix-nand.txt=
 b/Documentation/devicetree/bindings/mtd/evatronix-nand.txt
> new file mode 100644
> index 0000000..7ceb95a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/evatronix-nand.txt
> @@ -0,0 +1,44 @@
> +Evatronix NANDFLASH-CTRL NAND flash controller
> +
> +Required properties:
> +- compatible : "evatronix,nandflash-ctrl"
> +- reg : specify bus address and register area size.
> +- interrupts : controller interrupt number and irq type.
> +- nand-ecc-mode : See nand.txt. Supported values "hw", "soft".
> +- nand-ecc-algo : See nand.txt. Supported value "bch".
> +- nand-ecc-strength : See nand.txt. Supported values: 4, 8, 16, 24, =
32.
> +- nand-ecc-step-size : See nand.txt. Supported values: 256, 512, 102=
4.
> +
> +Optional properties:
> +- nand-on-flash-bbt: See nand.txt.
> +- #address-cells, #size-cells: See partition.txt.
> +- evatronix,use-bank-select : Use controller bank select function to=
 access
> +			      multiple chips, rather than chip enable.

You mean, using a dedicated logic to control the CS lines rather than a
GPIO (controlled by the SW using gpio_set_value())?

It that's the case then I suggest doing it the other way around.
When you want to use a plain GPIO you should define something like:

	cs-gpios =3D <&pioC X>;

If it's not there the controller should use it's internal logic to
control the CS line.

BTW, you seem to support controlling several CS using the same
controller, which means you'll have to specify which CS the NAND chip
is connected to (see [1]).

> +- evatronix,rb-wired-and: Assume ready/busy signal from all flash ch=
ips are
> +			  connected using a wired-AND topology rather than
> +			  individually.

Hm, is that really required? If the R/B line is shared among several
NAND chips, it should be transparent, you just have to specific which
chip is connected to which GPIO (or dedicated R/B pin).

> +- evatronix,timings: Seven 32-bit values for initializing the TIME_S=
EQ_0,
> +		     TIME_SEQ_1, TIMINGS_ASYN, TIME_GEN_SEQ_0, TIME_GEN_SEQ_1,
> +		     TIME_GEN_SEQ_2 and TIME_GEN_SEQ_3 registers, respectively.


Can this be extracted from the timing mode exposed by the NAND chip.
IMO it shouldn't be defined in the DT.

> +
> +Example:
> +
> +nand: nand@f801e000 {
> +	compatible =3D "evatronix,nandflash-ctrl";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +	reg =3D <0xf801e000 0x0200>;
> +	interrupts =3D <0 139 IRQ_TYPE_LEVEL_HIGH>;
> +	/* ONFi mode 0 timing, assuming 100 MHz clock. */
> +	/* Order is TIME_SEQ_0, TIME_SEQ_1, TIMINGS_ASYN,
> +	 * TIME_GEN_SEQ_0, _1, _2, _3 */
> +	evatronix,timings =3D <0x0d151533 0x000b0515 0x00000046
> +			     0x00150000 0x00000000 0x00000005 0x00000015>;
> +	nand-ecc-mode =3D "hw";
> +	nand-ecc-algo =3D "bch";
> +	nand-on-flash-bbt;
> +	nand-ecc-strength =3D <8>;
> +	nand-ecc-step-size =3D <512>;
> +	evatronix,use-bank-select;
> +	evatronix,rb-wired-and;
> +};

We recently added more constraints on the 'NAND controller/NAND chip'
representation in the DT [1].
You should rework your binding (and your code) to match these
constraints, even if you controller is only able to interface with a
single NAND chip.

Thanks,

Boris

[1]https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/mtd/nand.txt

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/=
Documentation/devicetree/bindings/vendor-prefixes.txt
> index 86740d4..4018162 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -83,6 +83,7 @@ epson	Seiko Epson Corp.
>  est	ESTeem Wireless Modems
>  ettus	NI Ettus Research
>  eukrea  Eukr=C3=83=C2=A9a Electromatique
> +evatronix	Evatronix SA
>  everest	Everest Semiconductor Co. Ltd.
>  everspin	Everspin Technologies, Inc.
>  excito	Excito



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
