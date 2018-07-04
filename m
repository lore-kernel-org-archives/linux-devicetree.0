Return-Path: <SRS0=klVN=JU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.bitwise.fi ([109.204.228.163]:37754 "EHLO mail.bitwise.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753607AbeGDHU6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 4 Jul 2018 03:20:58 -0400
Subject: Re: [PATCH 1/3] dt-bindings: can: xilinx_can: add Xilinx CAN FD
 bindings
References: <20180627143414.7114-1-anssi.hannula@bitwise.fi>
 <20180627143414.7114-2-anssi.hannula@bitwise.fi>
 <20180703225139.GA14644@rob-hp-laptop>
From: Anssi Hannula <anssi.hannula@bitwise.fi>
Message-ID: <cdfae163-57e8-f8fe-063e-41c7a57034a9@bitwise.fi>
Date: Wed, 4 Jul 2018 10:20:53 +0300
MIME-Version: 1.0
In-Reply-To: <20180703225139.GA14644@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Michal Simek <michal.simek@xilinx.com>, linux-can@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 4.7.2018 1:51, Rob Herring wrote:
> On Wed, Jun 27, 2018 at 05:34:12PM +0300, Anssi Hannula wrote:
>> Add compatible string and new attributes to support the Xilinx CAN FD
>> core.
>>
>> Unlike the previously documented Xilinx CAN cores, the CAN FD core has
>> TX mailboxes instead of TX FIFO, and optionally RX mailboxes instead of
>> RX FIFO (selected at core generation time, not switchable at runtime).
>> Add "tx-mailbox-count" and "rx-mailbox-count" to specify the mailbox
>> counts instead of reusing "tx-fifo-depth" and "rx-fifo-depth". "rx-mode"
>> attribute is added to allow mailbox mode.
>>
>> The RX FIFO depth is constant 32, but allow it to be specified via
>> "rx-fifo-depth" to match DT usage with Zynq CAN (which has constant RX
>> FIFO of depth of 64).
>>
>> Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
>> Cc: Michal Simek <michal.simek@xilinx.com>
>>
>> ---
>>
>> Xilinx has an out-of-tree driver that uses the same compatible string
>> "xlnx,canfd-1.0" but reads the TX mailbox count from "tx-fifo-depth"
>> and always assumes RX FIFO mode.
>>
>> I'm not 100% sure if we want to introduce "tx-mailbox-count" and
>> "rx-mailbox-count" or just do the same and use the "fifo" depth
>> properties for non-fifo as well.
> Don't you need a way to distinguish between rx fifo and mailbox?

Yes, so if we went that way either "rx-mode" would have to be kept or
fifo mode assumed.

>
>>
>>  .../devicetree/bindings/net/can/xilinx_can.txt     | 36 +++++++++++++++++-----
>>  1 file changed, 28 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/can/xilinx_can.txt b/Documentation/devicetree/bindings/net/can/xilinx_can.txt
>> index fe38847..ab14e56 100644
>> --- a/Documentation/devicetree/bindings/net/can/xilinx_can.txt
>> +++ b/Documentation/devicetree/bindings/net/can/xilinx_can.txt
>> @@ -2,20 +2,28 @@ Xilinx Axi CAN/Zynq CANPS controller Device Tree Bindings
>>  ---------------------------------------------------------
>>  
>>  Required properties:
>> -- compatible		: Should be "xlnx,zynq-can-1.0" for Zynq CAN
>> -			  controllers and "xlnx,axi-can-1.00.a" for Axi CAN
>> -			  controllers.
>> -- reg			: Physical base address and size of the Axi CAN/Zynq
>> -			  CANPS registers map.
>> +- compatible		: Should be:
>> +			  - "xlnx,zynq-can-1.0" for Zynq CAN controllers
>> +			  - "xlnx,axi-can-1.00.a" for Axi CAN controllers
>> +			  - "xlnx,canfd-1.0" for CAN FD controllers
>> +- reg			: Physical base address and size of the controller
>> +			  registers map.
>>  - interrupts		: Property with a value describing the interrupt
>>  			  number.
>>  - interrupt-parent	: Must be core interrupt controller
>>  - clock-names		: List of input clock names - "can_clk", "pclk"
>> -			  (For CANPS), "can_clk" , "s_axi_aclk"(For AXI CAN)
>> +			  (For CANPS), "can_clk", "s_axi_aclk" (For AXI CAN
> "(For CANPS)" should go on the previous line to be more readable.

OK.

>> +		          and CAN FD)
>>  			  (See clock bindings for details).
>>  - clocks		: Clock phandles (see clock bindings for details).
>> -- tx-fifo-depth		: Can Tx fifo depth.
>> -- rx-fifo-depth		: Can Rx fifo depth.
>> +- rx-mode		: Rx mode of a CAN FD controller core: "sequential"
>> +			  (fifo) or "mailbox" (default: "sequential").
> You can determine this with the presence of the below properties.

Good point, will change.

Thanks.

>> +- tx-fifo-depth		: Can Tx fifo depth (Zynq, Axi CAN).
>> +- rx-fifo-depth		: Can Rx fifo depth (Zynq, Axi CAN, CAN FD in
>> +                          sequential Rx mode).
>> +- tx-mailbox-count	: Can Tx mailbox buffer count (CAN FD).
>> +- rx-mailbox-count	: Can Rx mailbox buffer count (CAN FD in mailbox Rx
>> +			  mode).
>>  
>>  
>>  Example:
>> @@ -42,3 +50,15 @@ For Axi CAN Dts file:
>>  			tx-fifo-depth = <0x40>;
>>  			rx-fifo-depth = <0x40>;
>>  		};
>> +For CAN FD Dts file:
>> +	canfd_0: canfd@40000000 {
>> +			compatible = "xlnx,canfd-1.0";
>> +			clocks = <&clkc 0>, <&clkc 1>;
>> +			clock-names = "can_clk", "s_axi_aclk";
>> +			reg = <0x40000000 0x2000>;
>> +			interrupt-parent = <&intc>;
>> +			interrupts = <0 59 1>;
>> +			rx-mode = "sequential";
>> +			tx-mailbox-count = <0x20>;
>> +			rx-fifo-depth = <0x20>;
>> +		};
>> -- 
>> 2.8.3
>>

-- 
Anssi Hannula / Bitwise Oy
+358 503803997

