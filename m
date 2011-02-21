From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] arm/dt: add very basic dts file for babbage board
Date: Mon, 21 Feb 2011 17:46:14 +0800
Message-ID: <AANLkTikerADxGGRfnumWMN+s2r8gWOb1UAaS3tQ6DTe5@mail.gmail.com>
References: <1298016730-22761-1-git-send-email-r64343@freescale.com>
	<1298016730-22761-3-git-send-email-r64343@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1298016730-22761-3-git-send-email-r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Here is what I copied from booting-without-of.txt.

=3D=3D=3D=3D=3D
  f) the /soc<SOCname> node

  This node is used to represent a system-on-a-chip (SoC) and must be
  present if the processor is a SoC. The top-level soc node contains
  information that is global to all devices on the SoC. The node name
  should contain a unit address for the SoC, which is the base address
  of the memory-mapped register set for the SoC. The name of an SoC
  node should start with "soc", and the remainder of the name should
  represent the part number for the soc.  For example, the MPC8540's
  soc node would be called "soc8540".

  Required properties:

    - ranges : Should be defined as specified in 1) to describe the
      translation of SoC addresses for memory mapped SoC registers.
    - bus-frequency: Contains the bus frequency for the SoC node.
      Typically, the value of this field is filled in by the boot
      loader.
    - compatible : Exact model of the SoC


  Recommended properties:

    - reg : This property defines the address and size of the
      memory-mapped registers that are used for the SOC node itself.
      It does not include the child device registers - these will be
      defined inside each child node.  The address specified in the
      "reg" property should match the unit address of the SOC node.
    - #address-cells : Address representation for "soc" devices.  The
      format of this field may vary depending on whether or not the
      device registers are memory mapped.  For memory mapped
      registers, this field represents the number of cells needed to
      represent the address of the registers.  For SOCs that do not
      use MMIO, a special address format should be defined that
      contains enough cells to represent the required information.
      See 1) above for more details on defining #address-cells.
    - #size-cells : Size representation for "soc" devices
    - #interrupt-cells : Defines the width of cells used to represent
       interrupts.  Typically this value is <2>, which includes a
       32-bit number that represents the interrupt number, and a
       32-bit number that represents the interrupt sense and level.
       This field is only needed if the SOC contains an interrupt
       controller.

  The SOC node may contain child nodes for each SOC device that the
  platform uses.  Nodes should not be created for devices which exist
  on the SOC but are not used by a particular platform. See chapter VI
  for more information on how to specify devices that are part of a SOC.

  Example SOC node for the MPC8540:

        soc8540@e0000000 {
                #address-cells =3D <1>;
                #size-cells =3D <1>;
                #interrupt-cells =3D <2>;
                device_type =3D "soc";
                ranges =3D <00000000 e0000000 00100000>
                reg =3D <e0000000 00003000>;
                bus-frequency =3D <0>;
        }
=3D=3D=3D=3D=3D

I'm seeing the babbage.dts defined "soc" so differently than the
document requires.

> + =A0 =A0 =A0 soc {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "soc";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x0 0xffffffff>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tzic {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xe0000000 0x1000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fsl,tzic";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "tzic";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phandle =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };

* The soc node name has neither part number nor base address
* Even required property "bus-frequency" is missing
* The document "Appendix A - Sample SOC node for MPC8540" defines
every device node under "soc", while babbage.dts has most devices
outside the "soc" node.

Are what the document describes requirements we must follow or just
suggestions we can take or not?

Besides the overall question above, some nitpicking embedded below ...

On 18 February 2011 16:12, Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> =A0arch/arm/boot/dts/babbage.dts | =A0117 +++++++++++++++++++++++++++++++=
++++++++++
> =A01 files changed, 117 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/babbage.dts b/arch/arm/boot/dts/babbage.dts
> new file mode 100644
> index 0000000..7ee26f1
> --- /dev/null
> +++ b/arch/arm/boot/dts/babbage.dts
> @@ -0,0 +1,117 @@
> +/dts-v1/;
> +
> +/ {
> + =A0 =A0 =A0 model =3D "mx51_babbage";
> + =A0 =A0 =A0 compatible =3D "fsl,mx51_babbage";
> + =A0 =A0 =A0 #address-cells =3D <0x1>;
> + =A0 =A0 =A0 #size-cells =3D <0x1>;
> + =A0 =A0 =A0 #interrupt-cells =3D <0x1>;
> + =A0 =A0 =A0 interrupt-parent =3D <0x1>;
> +
> + =A0 =A0 =A0 memory {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "memory";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x90000000 0x20000000>;
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 chosen {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bootargs =3D "console=3Dttymxc1,115200n8 de=
bug earlyprintk";
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 soc {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "soc";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x0 0xffffffff>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tzic {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xe0000000 0x1000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fsl,tzic";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "tzic";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phandle =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 clocks {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> +

Can we use hex value here to keep the consistency throughout the file?

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart_clk0: uart@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-uart=
.0";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart_clk1: uart@1{

Can we put a space before "{" to keep the consistency throughout the file?

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-uart=
.1";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart_clk2: uart@2{

ditto

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-uart=
.2";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fec_clk: @0{

ditto

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "fec.0";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 spba@70000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "soc";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x70000000 0x100000>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 imx-uart@C000 {

Use lowercase for all address/offset to keep consistency throughout the fil=
e?

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "imx-uart";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xc000 0x1000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x21>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rts-cts;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart-clock =3D < &uart_clk2=
 >, "uart";

Remove the space after "<" and before ">" to keep consistency
throughout the file?

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 aips@73f00000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "soc";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x73f00000 0x100000>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 imx-uart@BC000 {

ditto

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "imx-uart";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xbc000 0x1000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x1f>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rts-cts;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart-clock =3D < &uart_clk0=
 >, "uart";

Remove the space after "<" and before ">"?

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 imx-uart@C0000 {

Lowercase for offset?

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "imx-uart";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xc0000 0x1000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x20>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rts-cts;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart-clock =3D <&uart_clk1>=
, "uart";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 aips@83f00000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "soc";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x83f00000 0x100000>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fec@EC000 {

ditto

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fec";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xec000 0x1000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x57>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fec_clk-clock =3D < &fec_cl=
k >, "fec";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> +};
> --
> 1.7.0.4
>

-- =

Regards,
Shawn
