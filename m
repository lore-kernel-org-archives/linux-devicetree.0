From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH] MIPS: Octeon: Add device tree source files.
Date: Fri, 24 Jun 2011 13:51:08 -0700
Message-ID: <4E04F8BC.3030806@cavium.com>
References: <1307387986-27069-4-git-send-email-ddaney@caviumnetworks.com>
	<1308876129-14145-1-git-send-email-david.daney@cavium.com>
	<BANLkTin7aSULt3w8_d-zaPirVsrVwgKeqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BANLkTin7aSULt3w8_d-zaPirVsrVwgKeqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/23/2011 09:00 PM, Grant Likely wrote:
> On Thu, Jun 23, 2011 at 6:42 PM, David Daney<david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>  wrote:
>> From: David Daney<ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
>>
>> Signed-off-by: David Daney<ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
>> ---
>>
>> This is a revision of my main device-tree definitions from my previous
>> RFC.  I wanted to get feedback on my changes to several bindings
>> before I set them in stone.
>>
>> The changes are to bootbus.txt, compact-flash.txt and dma-engine.txt.
>>
>> Basically there are a ton of parameters needed to initialize the boot
>> bus, and I just stuck them all in there.  Is this the best way to
>> handle something like this?
>>
>> I look forward to hearing any feedback.
>
> Mostly looks good.  Comments below.
>

Thanks for looking at it.

Comments and a few more quesitons below...

> g.
>
>>
>> Thanks,
>> David Daney
>>
>>   .../devicetree/bindings/mips/cavium/bootbus.txt    |  114 +++++
>>   .../devicetree/bindings/mips/cavium/ciu.txt        |   26 ++
>>   .../bindings/mips/cavium/compact-flash.txt         |   31 ++
>>   .../devicetree/bindings/mips/cavium/dma-engine.txt |   21 +
>>   .../devicetree/bindings/mips/cavium/gpio.txt       |   48 ++
>
> should be .../bindings/gpio/cavium.txt
>
>>   .../devicetree/bindings/mips/cavium/mdio.txt       |   27 ++
>
> .../bindings/net/mdio.txt
>
> and so on.
>

Right.  However I think bootbus.txt, ciu.txt, dma-engine.txt and
uctl.txt may continue to live under devicetree/bindings/mips/cavium as
they don't really have an existing category.


>>   .../devicetree/bindings/mips/cavium/mix.txt        |   40 ++
>>   .../devicetree/bindings/mips/cavium/pip.txt        |   98 +++++
>>   .../devicetree/bindings/mips/cavium/twsi.txt       |   34 ++
>>   .../devicetree/bindings/mips/cavium/uart.txt       |   19 +
>>   .../devicetree/bindings/mips/cavium/uctl.txt       |   47 ++
[...]
>> diff --git a/Documentation/devicetree/bindings/mips/cavium/bootbus.txt b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
>> new file mode 100644
>> index 0000000..2960ba8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
>> @@ -0,0 +1,114 @@
>> +* Boot Bus
>> +
>> +The Octeon Boot Bus is a configurable parallel bus with 8 chip
>> +selects.  Each chip select is independently configurable.
>> +
>> +Properties:
>> +- compatible: "cavium,octeon-3860-bootbus"
>> +
>> +  Compatibility with all cn3XXX, cn5XXX and cn6XXX SOCs.
>> +
>> +- reg: The base address of the Boot Bus' register bank.
>> +
>> +- #address-cells: Must be<2>.  The first cell is the chip select
>> +   within the bootbus.  The second cell is the offset from the chip select.
>> +
>> +- #size-cells: Must be<1>.
>> +
>> +- ranges: There must be one one triplet of (child-bus-address,
>> +  parent-bus-address, length) for each active chip select.  If the
>> +  length element for any triplet is zero, the chip select is disabled,
>> +  making it inactive.
>
> You don't need to actually define standard properties like 'ranges'.
> You can save some text that way.

I wanted to add the part about the length element...


>
>> +
>> +- t-adr: An array of 8 elements specifying the ADR timing parameter
>> +  (in nS) for the each of the 8 chip selects.
>
> Using arrays like this is a little awkward.  Particularly if board
> code needs to modify only one CS configuration; it then needs to
> replace /all/ of the configuration values because there is no way for
> DTC to modify a portion of property data.  You may want to consider a
> set of CS configuration child nodes with the parameters as properties.
>
> Also, these property names are pretty terse.  They should probably
> carry a "cavium," prefix, and you can use longer names.

OK I added the "cavium," part.  I want to keep the name suffixes as
they are, as they correspond exactly to the terminology in the
Hardware Reference Manuals.

How about something like this:


* Boot Bus

The Octeon Boot Bus is a configurable parallel bus with 8 chip
selects.  Each chip select is independently configurable.

Properties:
- compatible: "cavium,octeon-3860-bootbus"

   Compatibility with all cn3XXX, cn5XXX and cn6XXX SOCs.

- reg: The base address of the Boot Bus' register bank.

- #address-cells: Must be <2>.  The first cell is the chip select
    within the bootbus.  The second cell is the offset from the chip select.

- #size-cells: Must be <1>.

- ranges: There must be one one triplet of (child-bus-address,
   parent-bus-address, length) for each active chip select.  If the
   length element for any triplet is zero, the chip select is disabled,
   making it inactive.

The configuration parameters for each chip select are stored in child
nodes.

Configuration Properties:
- compatible:  "cavium,octeon-3860-bootbus-config"

- cavium,cs-index: A single cell indicating the chip select that
   corresponds to this configuration.

- cavium,t-adr: A cell specifying the ADR timing (in nS).

- cavium,t-ce: A cell specifying the CE timing (in nS).

- cavium,t-oe: A cell specifying the OE timing (in nS).

- cavium,t-we: A cell specifying the WE timing (in nS).

- cavium,t-rd-hld: A cell specifying the RD_HLD timing (in nS).

- cavium,t-wr-hld: A cell specifying the WR_HLD timing (in nS).

- cavium,t-pause: A cell specifying the PAUSE timing (in nS).

- cavium,t-wait: A cell specifying the WAIT timing (in nS).

- cavium,t-page: A cell specifying the PAGE timing (in nS).

- cavium,t-rd-dly: A cell specifying the RD_DLY timing (in nS).

- cavium,pages: A cell specifying the PAGES parameter (0 = 8 bytes, 1
   = 2 bytes, 2 = 4 bytes, 3 = 8 bytes).

- cavium,wait-mode: Optional.  If present, wait mode (WAITM) is selected.

- cavium,page-mode: Optional.  If present, page mode (PAGEM) is selected.

- cavium,bus-width: A cell specifying the WIDTH parameter (in bits) of
   the bus for this chip select.

- cavium,ale-mode: Optional.  If present, ALE mode is selected.

- cavium,sam-mode: Optional.  If present, SAM mode is selected.

- cavium,or-mode: Optional.  If present, OR mode is selected.

Example:
	bootbus: bootbus@1180000000000 {
		compatible = "cavium,octeon-3860-bootbus";
		reg = <0x11800 0x00000000 0x0 0x200>;
		/* The chip select number and offset */
		#address-cells = <2>;
		/* The size of the chip select region */
		#size-cells = <1>;
		ranges = <0 0  0x0 0x1f400000  0xc00000>,
			 <1 0  0x10000 0x30000000  0>,
			 <2 0  0x10000 0x40000000  0>,
			 <3 0  0x10000 0x50000000  0>,
			 <4 0  0x0 0x1d020000  0x10000>,
			 <5 0  0x0 0x1d040000  0x10000>,
			 <6 0  0x0 0x1d050000  0x10000>,
			 <7 0  0x10000 0x90000000  0>;

			cavium,cs-config@0 {
			compatible = "cavium,octeon-3860-bootbus-config";
			cavium,cs-index = <0>;
			cavium,t-adr  = <20>;
			cavium,t-ce   = <60>;
			cavium,t-oe   = <60>;
			cavium,t-we   = <45>;
			cavium,t-rd-hld = <35>;
			cavium,t-wr-hld = <45>;
			cavium,t-pause  = <0>;
			cavium,t-wait   = <0>;
			cavium,t-page   = <35>;
			cavium,t-rd-dly = <0>;

			cavium,pages     = <0>;
			cavium,bus-width = <8>;
		};
		.
		.
		.
		cavium,cs-config@6 {
			compatible = "cavium,octeon-3860-bootbus-config";
			cavium,cs-index = <6>;
			cavium,t-adr  = <5>;
			cavium,t-ce   = <300>;
			cavium,t-oe   = <270>;
			cavium,t-we   = <150>;
			cavium,t-rd-hld = <100>;
			cavium,t-wr-hld = <70>;
			cavium,t-pause  = <0>;
			cavium,t-wait   = <0>;
			cavium,t-page   = <320>;
			cavium,t-rd-dly = <0>;

			cavium,pages     = <0>;
			cavium,wait-mode;
			cavium,bus-width = <16>;
		};
		.
		.
		.
	};

>> diff --git a/Documentation/devicetree/bindings/mips/cavium/ciu.txt b/Documentation/devicetree/bindings/mips/cavium/ciu.txt
>> new file mode 100644
>> index 0000000..c8ff212
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/cavium/ciu.txt
>> @@ -0,0 +1,26 @@
>> +* Central Interrupt Unit
>> +
>> +Properties:
>> +- compatible: "cavium,octeon-3860-ciu"
>> +
>> +  Compatibility with all cn3XXX, cn5XXX and cn63XX SOCs.
>> +
>> +- interrupt-controller:  This is an interrupt controller.
>> +
>> +- reg: The base address of the CIU's register bank.
>> +
>> +- #interrupt-cells: Must be<2>.  The first cell is the bank within
>> +   the CIU and may have a value of 0 or 1.  The second cell is the bit
>> +   within the bank and may have a value between 0 and 63.
>
> Is there any edge/level high/low configuration on these interrupt
> lines?  If so, then you'll want a third cell for flags.  (I may have
> already asked you this question)

You did ask, I forget if I answered.

Within the CIU there is really no concept of high and low.  They are
just bits in some registers, and the interrupt handling code knows how
to deal with them.

Interrupt lines that leave the chip are specified in the
cavium,octeon-3860-gpio controller below, and do have edge/level
high/low configuration there.

>
>> +
>> +Example:
>> +       interrupt-controller@1070000000000 {
>> +               compatible = "cavium,octeon-3860-ciu";
>> +               interrupt-controller;
>> +               /* Interrupts are specified by two parts:
>> +                * 1) Controller register (0 or 1)
>> +                * 2) Bit within the register (0..63)
>> +                */
>> +               #interrupt-cells =<2>;
>> +               reg =<0x10700 0x00000000 0x0 0x7000>;
>> +       };
>> diff --git a/Documentation/devicetree/bindings/mips/cavium/compact-flash.txt b/Documentation/devicetree/bindings/mips/cavium/compact-flash.txt
>> new file mode 100644
>> index 0000000..84972a3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/cavium/compact-flash.txt
>> @@ -0,0 +1,31 @@
>> +* Compact Flash
>> +
>> +The Cavium Compact Flash device is connected to the Octeon Boot Bus,
>> +and is thus a child of the Boot Bus device.  It can read and write
>> +industry standard compact flash devices.
>> +
>> +Properties:
>> +- compatible: "cavium,ebt3000-compact-flash";
>> +
>> +  Compatibility with many Cavium evaluation boards.
>> +
>> +- reg: The base address of the the CF chip select banks.  Depending on
>> +  the device configuration, there may be one or two banks.
>> +
>> +- bus-width: The width of the connection to the CF devices.  Valid
>> +  values are 8 and 16.
>> +
>> +- true-ide: Mode of the CF connection.  Valid values are 1 - True IDE,
>> +  0 - not True IDE.
>
> Often, booleans like this are encoded based on whether or not the
> property is present.  ie. "cavium,true-ide;" turns on true-ide mode.

OK.

>
>> +
>> +- dma-engine-handle: Optional, a phandle for the DMA Engine connected
>> +  to this device.
>
> In general, if you're defining new device-specific properties, it is
> good practice to prefix them with "cavium,"

OK.


[...]
>> diff --git a/Documentation/devicetree/bindings/mips/cavium/gpio.txt b/Documentation/devicetree/bindings/mips/cavium/gpio.txt
>> new file mode 100644
>> index 0000000..21b989a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/cavium/gpio.txt
>> @@ -0,0 +1,48 @@
>> +* General Purpose Input Output (GPIO) bus.
>> +
>> +Properties:
>> +- compatible: "cavium,octeon-3860-gpio"
>> +
>> +  Compatibility with all cn3XXX, cn5XXX and cn6XXX SOCs.
>> +
>> +- reg: The base address of the GPIO unit's register bank.
>> +
>> +- gpio-controller: This is a GPIO controller.
>> +
>> +- #gpio-cells: Must be<2>.  The first cell is the GPIO pin.
>
> Should also state what the meaning of the 2nd cell is.

Right.  I don't know what it is yet.

I put the 2nd. cell there because "fsl,mpc8347-gpio" has it.

There are programmable glitch filters, signal inversion and several
other parameters that may need to be set, but I am not sure the best
way to specify that.

[...]
>> diff --git a/Documentation/devicetree/bindings/mips/cavium/mix.txt b/Documentation/devicetree/bindings/mips/cavium/mix.txt
>> new file mode 100644
>> index 0000000..2a91a33
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/cavium/mix.txt
>> @@ -0,0 +1,40 @@
>> +* MIX Ethernet controller.
>> +
>> +Properties:
>> +- compatible: "cavium,octeon-5750-mix"
>> +
>> +  Compatibility with all cn5XXX and cn6XXX SOCs populated with MIX
>> +  devices.
>> +
>> +- reg: The base addresses of four seperate register banks.  The first
>
> sp.  separate.
>

OK.


Thanks,
David Daney
