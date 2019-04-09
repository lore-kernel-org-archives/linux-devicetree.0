From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add binding documentation for TI
 syscon gate clock
Date: Tue, 9 Apr 2019 13:27:04 +0530
Message-ID: <33f6bc53-a361-c12b-1c21-3c34b101e67a@ti.com>
References: <20190312090518.28666-1-vigneshr@ti.com>
 <20190312090518.28666-2-vigneshr@ti.com> <20190328123142.GA6229@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328123142.GA6229@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Menon, Nishanth" <nm@ti.com>, "Kristo, Tero" <t-kristo@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 28/03/19 6:01 PM, Rob Herring wrote:
> On Tue, Mar 12, 2019 at 02:35:17PM +0530, Vignesh Raghavendra wrote:
>> Add dt bindings for TI syscon gate clock.
>>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>>  .../bindings/clock/ti,syscon-gate-clock.txt   | 35 +++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/ti,syscon-gate-clock.txt
>>
>> diff --git a/Documentation/devicetree/bindings/clock/ti,syscon-gate-clock.txt b/Documentation/devicetree/bindings/clock/ti,syscon-gate-clock.txt
>> new file mode 100644
>> index 000000000000..f2bc4281ddba
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/ti,syscon-gate-clock.txt
>> @@ -0,0 +1,35 @@
>> +TI syscon gate clock
>> +
>> +The gate clock node must be provided inside a system controller node.
>> +
>> +Required:
>> +- comaptible: Must be "ti,syscon-gate-clock"
>> +- reg: Offset of register that controls the clock within syscon regmap
>> +- ti,clock-bit-idx: bit index that control gate/ungating of clock
>> +- clocks: phandle to the clock parent
>> +- #clock-cells: must be <0>
>> +
>> +Example:
>> +	ctrlmmr_epwm_ctrl: syscon@104140{
>> +		compatible = "syscon", "simple-bus";
> 
> Can't be both of these...
> 

These registers have bits that control other functionalities apart from
PWM clocks. Therefore, I modeled them as "syscon", "simple-bus";

Or is it recommended to use:
 compatible = "syscon", "simple-mfd";


>> +		reg = <0x0 0x104140 0x0 0x18>;
>> +		ranges = <0x0 0x0 0x104140>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		ehrpwm0_tbclk: clk@0 {
>> +			compatible = "ti,syscon-gate-clock";
>> +			reg = <0x0>;
>> +			#clock-cells = <0>;
>> +			clocks = <&k3_clks 40 0>;
>> +			ti,clock-bit-idx = <0>;
> 
> This would imply you have multiple nodes at one address which is 
> discouraged.
> 
>> +		};
> 
> We generally don't describe clocks as 1 clock per node. Give the parent 
> a specific compatible and make it a clock provider.
> 

Ok, I can change this to single clock node and use #clock-cells to pass
register offset of and bit index from each consumer:

       ctrlmmr_epwm_ctrl: syscon@104140{
               compatible = "syscon", "simple-mfd";
               reg = <0x0 0x104140 0x0 0x18>;
               ranges = <0x0 0x0 0x104140>;
               #address-cells = <1>;
               #size-cells = <0>;

               ehrpwm_tbclk: clk {
                       compatible = "ti,syscon-gate-clock";
                       #clock-cells = <2>;
               };
	};

And consumer node:

       ehrpwm1: pwm@3010000 {
               compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
               #pwm-cells = <3>;
               reg = <0x0 0x3000000 0x0 0x100>;
               power-domains = <&k3_pds 40>;
               clocks = <&ehrpwm_tbclk 4 0>; /* offset 4, bit 0 */
	       clock-names = "tbclk";
       };


Would that be acceptable?

Regards
Vignesh

>> +
>> +		ehrpwm1_tbclk: clk@4 {
>> +			compatible = "ti,syscon-gate-clock";
>> +			reg = <0x4>;
>> +			#clock-cells = <0>;
>> +			clocks = <&k3_clks 41 0>;
>> +			ti,clock-bit-idx = <0>;
>> +		};
>> +	};
>> -- 
>> 2.21.0
>>
