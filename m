From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 2/2] memory: ti-aemif: add bindings for AEMIF driver
Date: Fri, 22 Nov 2013 15:04:53 -0600
Message-ID: <817E4263-5E61-4471-AED0-5C97FD2B902F@kernel.crashing.org>
References: <1384962416-14862-1-git-send-email-ivan.khoronzhuk@ti.com> <1384962416-14862-3-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384962416-14862-3-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Nov 20, 2013, at 9:46 AM, Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org> w=
rote:

> Add bindings for AEMIF controller drivers/memory/ti-aemif.c
>=20

Binding shouldn=92t normally refer to code.

Just saying something like:

Adding binging for TI Async External Memory Interface (AEMIF) controlle=
r.


> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
> ---
> .../bindings/memory-controllers/ti-aemif.txt       |  198 +++++++++++=
+++++++++
> 1 file changed, 198 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/memory-controlle=
rs/ti-aemif.txt
>=20
> diff --git a/Documentation/devicetree/bindings/memory-controllers/ti-=
aemif.txt b/Documentation/devicetree/bindings/memory-controllers/ti-aem=
if.txt
> new file mode 100644
> index 0000000..be0c0cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/ti-aemif.t=
xt
> @@ -0,0 +1,198 @@
> +* Device tree bindings for Texas instruments AEMIF controller
> +
> +Th Async External Memory Interface (EMIF16/AEMIF) controller is inte=
nded to

The?

> +provide a glue-less interface to a variety of asynchronous memory de=
vices like
> +ASRA M, NOR and NAND memory. A total of 256M bytes of any of these m=
emories
> +can be accessed at any given time via four chip selects with 64M byt=
e access
> +per chip select. Synchronous memories such as DDR1 SD RAM, SDR SDRAM
> +and Mobile SDR are not supported.
> +
> +Documentation:
> +Davinci DM646x - http://www.ti.com/lit/ug/sprueq7c/sprueq7c.pdf
> +OMAP-L138 - http://www.ti.com/lit/ug/spruh77a/spruh77a.pdf
> +Kestone - http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf
> +
> +Required properties:
> +
> +- compatible:		"ti,davinci-aemif"
> +			"ti,keystone-aemif"
> +			"ti,omap-L138-aemif"
> +
> +- #address-cells:	Must be 2. The first cell is the memory partition
> +			number. The 0 partition is for chip selects. And the
> +			second cell is the offset into the partition, for the 0
> +			partition it corresponds to chip select offset.
> +

Is the first cell just the chip select number?

I=92m wondering if this is similar to FSL Localbus controller, see the =
binding:

bindings/powerpc/fsl/lbc.txt

> +- #size-cells:		Must be set to 1.
> +
> +- reg:			contains offset/length value for AEMIF control registers
> +			space.
> +
> +- ranges:		Must be set up to reflect the memory layout for 4
> +			chipselects and for AEMIF control range.
> +
> +- clocks:		phandle reference to the controller clock. Required only
> +			if clock tree data present in device tree.
> +			See clock-bindings.txt
> +
> +- clock-names:		clock name. It has to be "aemif". Required only if c=
lock
> +			tree data present in device tree, in another case don't
> +			use it.
> +			See clock-bindings.txt
> +
> +- clock-ranges:		Empty property indicating that child nodes can inhe=
rit
> +			named clocks. Required only if clock tree data present
> +			in device tree.
> +			See clock-bindings.txt
> +
> +
> +Child chip-select (cs) nodes contain the memory devices nodes connec=
ted to
> +such as NOR (e.g. cfi-flash) and NAND (ti,davinci-nand, see davinci-=
nand.txt).
> +There might be board specific devices like FPGAs.
> +
> +Required child cs node properties:
> +
> +- compatible:		"ti,aemif-cs"
> +
> +- #address-cells:	Must be 2. The first cell is the memory partition
> +			number. The 0 partition is for chip selects. And the
> +			second cell is the offset into the partition, for the 0
> +			partition it corresponds to chip select offset.
> +
> +- #size-cells:		Must be 1.
> +
> +- ranges:		Empty property indicating that child nodes can inherit
> +			memory layout.
> +
> +- clock-ranges:		Empty property indicating that child nodes can inhe=
rit
> +			named clocks. Required only if clock tree data present
> +			in device tree.
> +
> +Optional child cs node properties:
> +
> +
> +- ti,bus-width:			width of the asynchronous device's data bus
> +				8 or 16 if not preset 8
> +
> +- ti,cs-ss:		enable/disable select strobe mode
> +				In select strobe mode chip select behaves as
> +				the strobe and is active only during the strobe
> +				period. If present then enable.
> +
> +- ti,cs-ew:		enable/disable extended wait mode
> +				if set, the controller monitors the EMIFWAIT pin
> +				mapped to that chip select to determine if the
> +				device wants to extend the strobe period. If
> +				present then enable.
> +
> +- ti,cs-ta:		minimum turn around time, ns
> +				Time between the end of one asynchronous memory
> +				access and the start of another asynchronous
> +				memory access. This delay is not incurred
> +				between a read followed by read or a write
> +				followed by a write to same chip select.
> +
> +- ti,cs-rsetup:		read setup width, ns
> +				Time between the beginning of a memory cycle
> +				and the activation of read strobe.
> +				Minimum value is 1 (0 treated as 1).
> +
> +- ti,cs-rstobe:		read strobe width, ns
> +				Time between the activation and deactivation of
> +				the read strobe.
> +				Minimum value is 1 (0 treated as 1).
> +
> +- ti,cs-rhold:		read hold width, ns
> +				Time between the deactivation of the read
> +				strobe and the end of the cycle (which may be
> +				either an address change or the deactivation of
> +				the chip select signal.
> +				Minimum value is 1 (0 treated as 1).
> +
> +- ti,cs-wsetup:		write setup width, ns
> +				Time between the beginning of a memory cycle
> +				and the activation of write strobe.
> +				Minimum value is 1 (0 treated as 1).
> +
> +- ti,cs-wstrobe:	write strobe width, ns
> +				Time between the activation and deactivation of
> +				the write strobe.
> +				Minimum value is 1 (0 treated as 1).
> +
> +- ti,cs-whold:		write hold width, ns
> +				Time between the deactivation of the write
> +				strobe and the end of the cycle (which may be
> +				either an address change or the deactivation of
> +				the chip select signal.
> +				Minimum value is 1 (0 treated as 1).
> +
> +If any of the above parameters are absent, current parameter value w=
ill be taken
> +from the corresponding HW reg.
> +
> +The name for cs node must be in format csN, where N is the cs number=
=2E
> +For compatibles "ti,davinci-aemif" and "ti,keystone-aemif" N =3D [0-=
3].
> +For compatible "ti,omap-L138-aemif" N =3D [2-5].
> +
> +Example for aemif, davinci nand and nor flash chip select shown belo=
w.
> +
> +memory-controller@21000A00 {
> +	compatible =3D "ti,keystone-aemif";
> +	#address-cells =3D <2>;
> +	#size-cells =3D <1>;
> +	clocks =3D <&clkaemif 0>;
> +	clock-names =3D "aemif";
> +	clock-ranges;
> +	reg =3D <0x2100A00 0x00000100>;
> +	ranges =3D <0 0 0x70000000 0x10000000
> +		  1 0 0x21000A00 0x0000100>;
> +
> +	nand:cs2 {
> +		compatible =3D "ti,aemif-cs";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <1>;
> +		clock-ranges;
> +		ranges;
> +
> +		/* all timings in nanoseconds */
> +		ti,cs-ta =3D <0>;
> +		ti,cs-rhold =3D <7>;
> +		ti,cs-rstrobe =3D <42>;
> +		ti,cs-rsetup =3D <14>;
> +		ti,cs-whold =3D <7>;
> +		ti,cs-wstrobe =3D <42>;
> +		ti,cs-wsetup =3D <14>;
> +
> +		nand@0,0x8000000 {
> +			compatible =3D "ti,davinci-nand";
> +			reg =3D <0 0x8000000 0x4000000
> +			       1 0x0000000 0x0000100>;
> +
> +			.. see davinci-nand.txt
> +		};
> +	};
> +
> +	nor:cs0 {
> +		compatible =3D "ti,aemif-cs";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <1>;
> +		clock-ranges;
> +		ranges;
> +
> +		/* all timings in nanoseconds */
> +		ti,cs-ta =3D <0>;
> +		ti,cs-rhold =3D <8>;
> +		ti,cs-rstrobe =3D <40>;
> +		ti,cs-rsetup =3D <14>;
> +		ti,cs-whold =3D <7>;
> +		ti,cs-wstrobe =3D <40>;
> +		ti,cs-wsetup =3D <14>;
> +		ti,cs-asize =3D <1>;
> +
> +		flash@0,0x0000000 {
> +			compatible =3D "cfi-flash";
> +			reg =3D <0 0x0000000 0x4000000>;
> +
> +			...
> +		};
> +	};
> +};
> --=20
> 1.7.9.5
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
