From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: CSR: Adding CSR SiRFprimaII board support
Date: Tue, 5 Jul 2011 23:30:26 -0600
Message-ID: <20110706053026.GB9978@ponder.secretlab.ca>
References: <1309231954-23260-1-git-send-email-bs14@csr.com>
	<201106292329.44447.arnd@arndb.de>
	<BANLkTinfKCMcutMDQ+mpdD4EUy9mCpZs+w@mail.gmail.com>
	<201106301236.25822.arnd@arndb.de>
	<BANLkTikoMu3ccUxj5KRmKzdReQcBqK4Y9Q@mail.gmail.com>
	<CAGsJ_4wSKP6EUihOVbUJJ+HUynWGp8PA=8J_WhgmOtVhpd5_Lg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGsJ_4wSKP6EUihOVbUJJ+HUynWGp8PA=8J_WhgmOtVhpd5_Lg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, workgroup.linux-kQvG35nSl+M@public.gmane.org, weizeng.he-kQvG35nSl+M@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 05, 2011 at 04:34:05PM +0800, Barry Song wrote:
> Hi Arnd,
> =

> 2011/7/1 Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> > Hi Arnd,
> >
> > 2011/6/30 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> >> On Thursday 30 June 2011, Barry Song wrote:
> >>
> >>> > Is this really just one bus with a huge address space, or rather so=
me
> >>> > nested buses? I'd prefer to have the device tree representation as
> >>> > close as possible to the actual layout.
> >>>
> >>> there are two AXI buses in prima2. AXI-1 connect to memory, AXI-2 is
> >>> transferred to CSR self-defined IOBUS by CPUIF, then 1 intterupt
> >>> controller and 9 IO bridges are connected to the IOBUS .
> >>> The 9 IO bridges are SYSIOBG, PERIIOBG,CPURTCIOBG, UUSIOBG, GRAPHIOBG,
> >>> MEDIAIOBG, DSPIOBG, DISPIOBG, MEMIOBG. Every iobrg connect to a group
> >>> of controllers.
> >>> For example, DISPIOBG connect to VPP and LCD, SYSIOBG connect to CLKC,
> >>> RSTC, RSC and CPHIFBG, DSPIOBG connect to DSPIF, GPS and DSP.
> >>> PERIIOBG connect to TIMER, NAND, AUDIO, UART0, UART1, UART2, USP0,
> >>> USP1, USP2, SPI0, I2C0, I2C1, GPIO, *SYS2PCI* and so on. Then
> >>> *SYS2PCI* connect to SD.
> >>>
> >>> The indendation descible the device hierarchy
> >>> AXI-1
> >>> =A0 =A0 =A0 =A0 =A0Memory
> >>> AXI-2
> >>> =A0 =A0 =A0 =A0 =A0interrupt controller
> >>> =A0 =A0 =A0 =A0 =A0IOBG...
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 xxxx
> >>> =A0 =A0 =A0 =A0 =A0IOBG...
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 xxxx
> >>> =A0 =A0 =A0 =A0 =A0IOBG...
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 xxxx
> >>> =A0 =A0 =A0 =A0 =A0IOBG...
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 xxxx
> >>> =A0 =A0 =A0 =A0 =A0IOBG...
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 xxxx
> >>> =A0 =A0 =A0 =A0 =A0IOBG...
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SYS2PCI
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SD
> >>>
> >>> i have get the IC guy Weizeng involved, maybe he can explain better t=
han me :-)
> >>
> >> I think it would be good to represent the IOBG devices in the device t=
ree then.
> >> You don't need to represent AXI-1 because memory is special anyway, an=
d I would
> >> not bother to list SYS2PCI if the intention of that block was to hide =
the fact
> >> that it's PCI behind it. Properly instantiating it as a PCI bridge wou=
ld be
> >> a lot of work that is probably not worth it.
> >>
> >> My usual plea to hardware developers: Please make the registers
> >> autodiscoverable from software! On an AMBA bus, please use the PrimeCe=
ll
> >> register layout. If you always have an IOBG device behind, they should
> >> all have the same identifier for that kind of bus bridge.
> >>
> >> For the IOBG, it would be ideal to have a similar way of finding and
> >> configuring the connected hardware, including:
> >>
> >> * unique identifier for each distinct IP block
> >> * revision of that block
> >> * MMIO ranges and sizes, relative to the bus
> >> * interrupt numbers, relative to a local interrupt controller
> >> * location identifier (like PCI bus/device/fn number) that can be
> >> =A0referred to by other devices
> >> * clock management for that device
> >> * power management for that device
> >>
> >> If your IODB infrastructure already has this, you should create a new
> >> bus-type for this in Linux, which will let you detect all devices
> >> in a consistent manner without having to list them in the device tree.
> >
> > IO bridges in prima2 don't have that. Configuration is hardcoded now.
> > but we have learned so much from you and hope to improve our future IC
> > design.
> =

> =

> i have tried to figure out the full DT:
> =

> /dts-v1/;
> / {
> 	model =3D "SiRF Prima2 EVB";
> 	compatible =3D "sirf,prima2-cb", "sirf,prima2";
> 	#address-cells =3D <1>;
> 	#size-cells =3D <1>;
> 	interrupt-parent =3D <&intc>;
> =

> 	memory {

memory@0

> 		reg =3D <0x00000000 0x20000000>;
> 	};
> =

> 	chosen {
> 		bootargs =3D "mem=3D512M real_root=3D/dev/mmcblk0p2 console=3DttyS0 pan=
el=3D1
> bootsplash=3Dtrue bpp=3D16 androidboot.console=3DttyS1";
> 		linux,stdout-path =3D &uart1;
> 	};
> =

> 	cpus {
> 		#address-cells =3D <1>;
> 		#size-cells =3D <0>;
> =

> 		ARM-CortexA9,SiRFprimaII@0 {

cpu@0 {

Don't duplicate the crack that powerpc did for cpu node names.  Use a
compatible property to identify the specific CPU model.

> 			device_type =3D "cpu";

Drop device_type here.

> 			reg =3D <0x0>;
> 			d-cache-line-size =3D <32>;
> 			i-cache-line-size =3D <32>;
> 			d-cache-size =3D <32768>;
> 			i-cache-size =3D <32768>;
> 			/* from bootloader */
> 			timebase-frequency =3D <0>;
> 			bus-frequency =3D <0>;
> 			clock-frequency =3D <0>;
> 		};
> 	};
> =

> 	axi {
> 		compatible =3D "simple-bus";
> 		#address-cells =3D <1>;
> 		#size-cells =3D <1>;
> 		ranges =3D <0x40000000 0x40000000 0x80000000>;
> =

> 		l2-cache-controller@0x80040000 {

l2-cache-controller@80040000  (Drop the '0x' from node names; address
in the node name is always hex.

> 			compatible =3D "arm,pl310-cache", "cache";

Drop the "cache" compatible value here.

> 			reg =3D <0x80040000 0x1000>;
> 			interrupts =3D <59>;
> 		};
> =

> 		sirfsoc-iobus {
> 			compatible =3D "simple-bus";
> 			#address-cells =3D <1>;
> 			#size-cells =3D <1>;
> 			ranges =3D <0x56000000 0x56000000 0x1b0000
> 				0x80010000 0x80010000 0x30000
> 				0x88000000 0x88000000 0x40040000>;
> =

> 			intc: interrupt-controller@0x80020000 {
> 				#interrupt-cells =3D <1>;
> 				interrupt-controller;
> 				compatible =3D "sirf,intc", "sirf,prima2-intc";

This looks backwards.  Most specific values should appear first.
"sirf,intc" looks to be generic when compared to "sirf,prima2-intc".
I'm also concerned that "sirf,intc" is trying to be too generic.  As
much as possible compatible values should reflect a real
implementation of the interface, not a generic abstract name.  Future
hardware can always claim compatibility with existing older hardware.
You're probably better off dropping "sirf,intc" entirely, and doing
the same for similar properties throughout the file.

Also, for every new compatible value make sure you add documentation
for it to Documentation/devicetree/bindings. (You may have already
done so, it's just something I remind people about a lot).

These comments also apply through the rest of the file.
