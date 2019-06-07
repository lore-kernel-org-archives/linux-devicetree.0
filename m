From: Piotr Sroka <piotrs@cadence.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: nand: Add Cadence NAND controller
 driver
Date: Fri, 7 Jun 2019 17:08:23 +0100
Message-ID: <20190607160822.GA22242@global.cadence.com>
References: <20190219161406.4340-1-piotrs@cadence.com>
 <20190219161920.26602-1-piotrs@cadence.com>
 <20190222204052.GA17855@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190222204052.GA17855@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, BrianNorris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob

Thanks for reviwing this.

The 02/22/2019 14:40, Rob Herring wrote:
>EXTERNAL MAIL
>
>
>On Tue, Feb 19, 2019 at 04:19:20PM +0000, Piotr Sroka wrote:
>> Signed-off-by: Piotr Sroka <piotrs@cadence.com>
>> ---
>> Changes for v2:
>> - remove chip dependends parameters from dts bindings
>> - add names for register ranges in dts bindings
>> - add generic bindings to describe NAND chip representation
>>   under the NAND controller node
>> ---
>>  .../bindings/mtd/cadence-nand-controller.txt       | 48 ++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
>> new file mode 100644
>> index 000000000000..3d9b4decae24
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
>> @@ -0,0 +1,48 @@
>> +* Cadence NAND controller
>> +
>> +Required properties:
>> +  - compatible : "cdns,hpnfc"
>
>Only one version of IP or is that discoverable?
In general IP is configurable. There are a lot of configurations options.
Most features are checked in runtime base on controller registers.
Some of capabilities are not shared by registersn. But there is not sense to create
all possible configuration here. I think more compatible may appear if
sombody add here a SoC.

>
>> +  - reg : Contains two entries, each of which is a tuple consisting of a
>> +	  physical address and length. The first entry is the address and
>> +	  length of the controller register set. The second entry is the
>> +	  address and length of the Slave DMA data port.
>> +  - reg-names: should contain "cadence_reg" and "cadence_sdma"
>
>'cadence_' part is pointless.
>
>> +  - interrupts : The interrupt number.
>> +  - clocks: phandle of the controller core clock (nf_clk).
>> +  - Children nodes represent the available NAND chips.
>
>Need a blank line and remove the '-' as it's not a property.
>
>> +
>> +Required properties of NAND chips:
>> +  - reg: shall contain the native Chip Select ids from 0 to max supported by
>> +    the cadence nand flash controller
>> +
>> +Optional properties:
>
>For child nodes? If not move before child nodes.
>
>> +  - dmas: shall reference DMA channel associated to the NAND controller
>> +  - cdns,board-delay : Estimated Board delay. The value includes the total
>> +    round trip delay for the signals and is used for deciding on values
>> +    associated with data read capture. The example formula for SDR mode is
>> +    the following:
>> +    board_delay = RE#PAD_delay + PCB trace to device + PCB trace from device
>> +    + DQ PAD delay
>
>Units? Use unit suffix as defined in property-units.txt.
>
>> +
>> +See Documentation/devicetree/bindings/mtd/nand.txt for more details on
>> +generic bindings.
>> +
>> +Example:
>> +
>> +nand_controller: nand-controller @60000000 {
>
>space                              ^
>
>> +	  compatible = "cdns,hpnfc";
>> +	  reg = <0x60000000 0x10000>, <0x80000000 0x10000>;
>> +	  reg-names = "cadence_reg", "cadence_sdma";
>> +	  clocks = <&nf_clk>;
>> +	  cdns,board-delay = <4830>;
>> +	  interrupts = <2 0>;
>> +	  nand@0 {
>> +	      reg = <0>;
>> +	      label = "nand-1";
>> +	  };
>> +	  nand@1 {
>> +	      reg = <1>;
>> +	      label = "nand-2";
>> +	  };
>> +
>> +};
>> --
>> 2.15.0
>>

Thanks
Piotr Sroka
