From: Piotr Sroka <piotrs@cadence.com>
Subject: Re: [v3 2/2] dt-bindings: nand: Add Cadence NAND controller driver
Date: Wed, 17 Jul 2019 11:58:27 +0100
Message-ID: <20190717105825.GA11796@global.cadence.com>
References: <20190614150956.31244-1-piotrs@cadence.com>
 <20190614151301.5371-1-piotrs@cadence.com>
 <20190709144853.GA23699@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190709144853.GA23699@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, BrianNorris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

The 07/09/2019 08:48, Rob Herring wrote:
>EXTERNAL MAIL
>
>
>On Fri, Jun 14, 2019 at 04:13:01PM +0100, Piotr Sroka wrote:
>> Signed-off-by: Piotr Sroka <piotrs@cadence.com>
>> ---
>> Changes for v3:
>> - add unit suffix for board_delay
>> - move child description to proper place
>> - remove prefix cadence_ for reg and sdma fields
>> Changes for v2:
>> - remove chip dependends parameters from dts bindings
>> - add names for register ranges in dts bindings
>> - add generic bindings to describe NAND chip representation
>> ---
>>  .../bindings/mtd/cadence-nand-controller.txt       | 51 ++++++++++++++++++++++
>>  1 file changed, 51 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
>> new file mode 100644
>> index 000000000000..e485b87075bd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
>> @@ -0,0 +1,51 @@
>> +* Cadence NAND controller
>> +
>> +Required properties:
>> +  - compatible : "cdns,hpnfc"
>
>Only 1 version of h/w features and bugs?
>
At the moment, yes.

>'hp-nfc' would be a bit more readable IMO.
>
I will replace it.

>> +  - reg : Contains two entries, each of which is a tuple consisting of a
>> +	  physical address and length. The first entry is the address and
>> +	  length of the controller register set. The second entry is the
>> +	  address and length of the Slave DMA data port.
>> +  - reg-names: should contain "reg" and "sdma"
>> +  - interrupts : The interrupt number.
>> +  - clocks: phandle of the controller core clock (nf_clk).
>> +
>> +Optional properties:
>> +  - dmas: shall reference DMA channel associated to the NAND controller
>> +  - cdns,board-delay_ps : Estimated Board delay. The value includes the total
>
>s/_/-/
>
>> +    round trip delay for the signals and is used for deciding on values
>> +    associated with data read capture. The example formula for SDR mode is
>> +    the following:
>> +    board_delay = RE#PAD_delay + PCB trace to device + PCB trace from device
>> +    + DQ PAD delay
>> +
>> +Children nodes represent the available NAND chips.
>
>Child nodes...
>
>> +
>> +Required properties of NAND chips:
>> +  - reg: shall contain the native Chip Select ids from 0 to max supported by
>> +    the cadence nand flash controller
>> +
>> +
>> +See Documentation/devicetree/bindings/mtd/nand.txt for more details on
>> +generic bindings.
>> +
>> +Example:
>> +
>> +nand_controller: nand-controller @60000000 {
>
>remove space                       ^
>
>> +
>> +	  compatible = "cdns,hpnfc";
>> +	  reg = <0x60000000 0x10000>, <0x80000000 0x10000>;
>> +	  reg-names = "reg", "sdma";
>> +	  clocks = <&nf_clk>;
>> +	  cdns,board-delay_ps = <4830>;
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
Piotr
  



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
