From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/3] arm/dt: add very basic dts file for babbage board
Date: Mon, 21 Feb 2011 10:10:24 -0700
Message-ID: <AANLkTi=kxbzDCJqOnPNjCsNxMsLtcbbcGLfZbY05_Svh@mail.gmail.com>
References: <1298016730-22761-1-git-send-email-r64343@freescale.com>
	<1298016730-22761-3-git-send-email-r64343@freescale.com>
	<AANLkTikerADxGGRfnumWMN+s2r8gWOb1UAaS3tQ6DTe5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTikerADxGGRfnumWMN+s2r8gWOb1UAaS3tQ6DTe5-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 21, 2011 at 2:46 AM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Here is what I copied from booting-without-of.txt.
>
> =3D=3D=3D=3D=3D
> =A0f) the /soc<SOCname> node
>
> =A0This node is used to represent a system-on-a-chip (SoC) and must be
> =A0present if the processor is a SoC. The top-level soc node contains
> =A0information that is global to all devices on the SoC. The node name
> =A0should contain a unit address for the SoC, which is the base address
> =A0of the memory-mapped register set for the SoC. The name of an SoC
> =A0node should start with "soc", and the remainder of the name should
> =A0represent the part number for the soc. =A0For example, the MPC8540's
> =A0soc node would be called "soc8540".
>
> =A0Required properties:
>
> =A0 =A0- ranges : Should be defined as specified in 1) to describe the
> =A0 =A0 =A0translation of SoC addresses for memory mapped SoC registers.
> =A0 =A0- bus-frequency: Contains the bus frequency for the SoC node.
> =A0 =A0 =A0Typically, the value of this field is filled in by the boot
> =A0 =A0 =A0loader.
> =A0 =A0- compatible : Exact model of the SoC
>
>
> =A0Recommended properties:
>
> =A0 =A0- reg : This property defines the address and size of the
> =A0 =A0 =A0memory-mapped registers that are used for the SOC node itself.
> =A0 =A0 =A0It does not include the child device registers - these will be
> =A0 =A0 =A0defined inside each child node. =A0The address specified in the
> =A0 =A0 =A0"reg" property should match the unit address of the SOC node.
> =A0 =A0- #address-cells : Address representation for "soc" devices. =A0The
> =A0 =A0 =A0format of this field may vary depending on whether or not the
> =A0 =A0 =A0device registers are memory mapped. =A0For memory mapped
> =A0 =A0 =A0registers, this field represents the number of cells needed to
> =A0 =A0 =A0represent the address of the registers. =A0For SOCs that do not
> =A0 =A0 =A0use MMIO, a special address format should be defined that
> =A0 =A0 =A0contains enough cells to represent the required information.
> =A0 =A0 =A0See 1) above for more details on defining #address-cells.
> =A0 =A0- #size-cells : Size representation for "soc" devices
> =A0 =A0- #interrupt-cells : Defines the width of cells used to represent
> =A0 =A0 =A0 interrupts. =A0Typically this value is <2>, which includes a
> =A0 =A0 =A0 32-bit number that represents the interrupt number, and a
> =A0 =A0 =A0 32-bit number that represents the interrupt sense and level.
> =A0 =A0 =A0 This field is only needed if the SOC contains an interrupt
> =A0 =A0 =A0 controller.
>
> =A0The SOC node may contain child nodes for each SOC device that the
> =A0platform uses. =A0Nodes should not be created for devices which exist
> =A0on the SOC but are not used by a particular platform. See chapter VI
> =A0for more information on how to specify devices that are part of a SOC.
>
> =A0Example SOC node for the MPC8540:
>
> =A0 =A0 =A0 =A0soc8540@e0000000 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#address-cells =3D <1>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#size-cells =3D <1>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#interrupt-cells =3D <2>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device_type =3D "soc";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ranges =3D <00000000 e0000000 00100000>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <e0000000 00003000>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bus-frequency =3D <0>;
> =A0 =A0 =A0 =A0}
> =3D=3D=3D=3D=3D
>
> I'm seeing the babbage.dts defined "soc" so differently than the
> document requires.
>
>> + =A0 =A0 =A0 soc {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "soc";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x0 0xffffffff>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tzic {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x0>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xe0000000 0x1000=
>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fsl,tzic";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "tzic";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phandle =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 =A0 };
>

The document is a little out of date in that it doesn't reflect all of
the current best practices.  It does need to be updated, but I'll
respond to the specific questions here...

> * The soc node name has neither part number nor base address

Part number isn't necessary because the 'compatible' property is
supposed to be used to identify the exact device.  Base address must
be part of any node that has a 'reg' property.  In this particular
example, neither is the case so it is okay.

> * Even required property "bus-frequency" is missing

bus-frequency isn't required.

> * The document "Appendix A - Sample SOC node for MPC8540" defines
> every device node under "soc", while babbage.dts has most devices
> outside the "soc" node.

The 'soc' node thing was something we started when new PowerPC SoC
machines were created.  However, it doesn't necessarily reflect the
best practice.  Ideally, the dt structure will match the physical
structure of the chip.  So, if a chip has multiple internal busses,
then the dts should probably have a node for each bus, and then each
device a child of the bus node.  However, having a single containing
'soc' node for all on-chip busses and devices is probably a good thing
to preserve.

>
> Are what the document describes requirements we must follow or just
> suggestions we can take or not?

Crafting a .dts file and device tree bindings are as much an art as a
science.  There are some things that aren't hard rules, but there are
reasons behind why most are done in a certain way.  The best way to
develop a new .dts file is to draft up your best effort, post it for
review, and listen to the comments that come back.  :-)

>
> Besides the overall question above, some nitpicking embedded below ...
>
> On 18 February 2011 16:12, Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> ---
>> =A0arch/arm/boot/dts/babbage.dts | =A0117 ++++++++++++++++++++++++++++++=
+++++++++++
>> =A01 files changed, 117 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/babbage.dts b/arch/arm/boot/dts/babbage.d=
ts
>> new file mode 100644
>> index 0000000..7ee26f1
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/babbage.dts
>> @@ -0,0 +1,117 @@
>> +/dts-v1/;
>> +
>> +/ {
>> + =A0 =A0 =A0 model =3D "mx51_babbage";

This is a human readable string.  You can write something like
"Freescale i.MX51 Babbage" here.

>> + =A0 =A0 =A0 compatible =3D "fsl,mx51_babbage";

Use dash '-' instead of underscores '_' in compatible values.

>> + =A0 =A0 =A0 #address-cells =3D <0x1>;
>> + =A0 =A0 =A0 #size-cells =3D <0x1>;
>> + =A0 =A0 =A0 #interrupt-cells =3D <0x1>;
>> + =A0 =A0 =A0 interrupt-parent =3D <0x1>;
>> +
>> + =A0 =A0 =A0 memory {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "memory";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x90000000 0x20000000>;
>> + =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 chosen {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bootargs =3D "console=3Dttymxc1,115200n8 d=
ebug earlyprintk";
>> + =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 soc {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "soc";

Drop the "device_type" property.  It only makes sense for machines
with real Open Firmware.

>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";

Need to specify the specific chip here:

        compatible =3D "fsl,imx51-soc", "simple-bus";

>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x0 0xffffffff>;

one-to-one mapping of the full address range can be specified simply
with an empty ranges property:

        ranges;

>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tzic {

tzic@e0000000 {

>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x0>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xe0000000 0x1000=
>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fsl,tzic";

Specify the exact chip in the compatible property:

compatible =3D "fsl,imx51-tzic";

>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "tzic";

Drop device type

>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phandle =3D <0x1>;

Drop phandle; dtc adds phandles automatically.

>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 clocks {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
>> +
>
> Can we use hex value here to keep the consistency throughout the file?

For #address-cells and #size-cells use decimal integers.

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart_clk0: uart@0 {

@0 should only be specified if the node has a 'reg =3D <0>' property.
In this case it doesn't so either 'reg' should be added, or '@0'
should be removed.

>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-uar=
t.0";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart_clk1: uart@1{
>
> Can we put a space before "{" to keep the consistency throughout the file?

Yes, please.

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-uar=
t.1";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart_clk2: uart@2{
>
> ditto
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-uar=
t.2";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fec_clk: @0{

"@0" is not a valid node name.

>
> ditto
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "fec.0";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 spba@70000000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "soc";

Drop device type.

>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";

Specify the actual device here before "simple-bus"

>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x70000000 0x100000>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 imx-uart@C000 {
>
> Use lowercase for all address/offset to keep consistency throughout the f=
ile?

yes.

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "imx-uart";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xc000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x21>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rts-cts;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart-clock =3D < &uart_clk=
2 >, "uart";
>
> Remove the space after "<" and before ">" to keep consistency
> throughout the file?
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 aips@73f00000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "soc";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x73f00000 0x100000>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 imx-uart@BC000 {
>
> ditto
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "imx-uart";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xbc000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x1f>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rts-cts;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart-clock =3D < &uart_clk=
0 >, "uart";
>
> Remove the space after "<" and before ">"?
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 imx-uart@C0000 {
>
> Lowercase for offset?
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "imx-uart";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xc0000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x20>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rts-cts;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart-clock =3D <&uart_clk1=
>, "uart";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 aips@83f00000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "soc";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x83f00000 0x100000>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fec@EC000 {
>
> ditto
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fec";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xec000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x57>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fec_clk-clock =3D < &fec_c=
lk >, "fec";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 =A0 };
>> +};
>> --
>> 1.7.0.4
>>
>
> --
> Regards,
> Shawn
>
> _______________________________________________
> linaro-dev mailing list
> linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
