From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH 1/2] Documentation: dt: reset: Add syscon reset binding
Date: Tue, 2 Feb 2016 09:23:12 -0600
Message-ID: <56B0C9E0.5090803@ti.com>
References: <1453748564-6429-1-git-send-email-afd@ti.com>
 <1453748564-6429-2-git-send-email-afd@ti.com>
 <20160129032200.GA12831@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160129032200.GA12831@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/28/2016 09:22 PM, Rob Herring wrote:
> On Mon, Jan 25, 2016 at 01:02:43PM -0600, Andrew F. Davis wrote:
>> Add syscon reset controller binding. This will hook to the reset
>> framework and use syscon/regmap to set reset bits. This allows
>> reset control of individual SoC subsytems and devices with
>> memory-mapped reset registers in a common register memory
>> space.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> [s-anna@ti.com: revise the binding format]
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>   .../devicetree/bindings/reset/syscon-reset.txt     | 84 ++++++++++++++++++++++
>>   1 file changed, 84 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/reset/syscon-reset.txt
>>
>> diff --git a/Documentation/devicetree/bindings/reset/syscon-reset.txt b/Documentation/devicetree/bindings/reset/syscon-reset.txt
>> new file mode 100644
>> index 0000000..466378a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reset/syscon-reset.txt
>> @@ -0,0 +1,84 @@
>> +SysCon Reset Controller
>> +=======================
>> +
>> +Almost all SoCs have hardware modules that require reset control in addition
>> +to clock and power control for their functionality. The reset control is
>> +typically provided by means of memory-mapped I/O registers. These registers are
>> +sometimes a part of a larger register space region implementing various
>> +functionalities. This register range is best represented as a syscon node to
>> +allow multiple entities to access their relevant registers in the common
>> +register space.
>> +
>> +A SysCon Reset Controller node defines a device that uses a syscon node
>> +and provides reset management functionality for various hardware modules
>> +present on the SoC.
>
> This may be one of those cases that is too low level to put into DT.
>

I can understand the worry about directly representing hardware register
functionality in DT, but I believe this case is a useful abstraction,
otherwise we end up with reset driver mods for every minor spin of a chip.

>> +
>> +SysCon Reset Controller Node
>> +============================
>> +Each of the reset provider/controller nodes should have the following
>> +properties.
>> +
>> +Required properties:
>> +--------------------
>> + - compatible	: Should be "syscon-reset"
>> + - syscon	: phandle to the syscon node containing the reset registers
>> + - #reset-cells	: Should be 6. Please see the reset consumer node below for
>> +                  usage details
>> +
>> +SysCon Reset Consumer Nodes
>> +===========================
>> +Each of the reset consumer nodes should have the following properties,
>> +in addition to their own properties.
>> +
>> +Required properties:
>> +--------------------
>> + - resets	: A phandle and reset specifier pair, one pair for each reset
>> +		  signal that affects the device, or that the device manages.
>> +		  The phandle should point to the syscon node containing the
>> +		  reset registers, and the reset specifier should have 6
>> +		  cell-values. The reset specifier contains two similar pairs
>> +		  of 3 cell-values each, the first of the pair containing the
>> +		  reset control register information, and the second of the pair
>> +		  containing the reset status register information. The reset
>> +		  control and status registers can be same on some devices/SoCs.
>
> What if there are no status bits?
>

The last three can be the same as the first three, then if status is read we
will check if the corresponding control register bit has been set (which may
be set as non-volatile, then the cached result from the last write is read).

If there is absolutely no way to read status information then that chip will
need a less generic driver solution, but I have not seen any like this.

>> +
>> +		  Each of the pairs of 3 cell-values should have the following
>> +		  values:
>> +		     Cell #1 : register offset of the reset control/status
>> +		               register from the syscon register base
>> +		     Cell #2 : bit shift value for the reset in the respective
>> +		               reset control/status register
>> +		     Cell #3 : polarity of the reset bit. Should be 1 for resets
>> +		               that are asserted when the bit is set, 0 for
>> +		               resets that are asserted when the bit is cleared
>> +
>> +Please also refer to Documentation/devicetree/bindings/reset/reset.txt for
>> +common reset controller usage by consumers.
>> +
>> +
>> +Example:
>> +--------
>> +The following example demonstrates a syscon node, the reset controller node
>> +using the syscon node, and a consumer (a DSP device) on the TI Keystone 2
>> +Hawking SoC.
>> +
>> +/ {
>> +	soc {
>> +		psc: power-sleep-controller@02350000 {
>> +			compatible = "syscon";
>> +			reg = <0x02350000 0x1000>;
>> +		};
>> +
>> +		pscrst: psc-reset {
>> +			compatible = "syscon-reset";
>> +			syscon = <&psc>;
>> +			#reset-cells = <6>;
>> +		};
>
> Any reason not to make this a child of psc?
>

I have not tested that, but if it gets registered the same I see no reason
it couldn't be if someone wanted it organized that way.

>> +
>> +		dsp0: dsp0 {
>> +			...
>> +			resets = <&pscrst 0xa3c 8 0 0x83c 8 0>;
>> +			...
>> +		};
>> +	};
>> +};
>> --
>> 2.7.0
>>
