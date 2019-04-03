From: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add binding documentation for TI
 syscon gate clock
Date: Wed, 3 Apr 2019 12:30:05 +0300
Message-ID: <a998b977-99ef-876e-a226-4f1738392f9f@ti.com>
References: <20190312090518.28666-1-vigneshr@ti.com>
 <20190312090518.28666-2-vigneshr@ti.com> <20190328123142.GA6229@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328123142.GA6229@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 28/03/2019 14:31, Rob Herring wrote:
> On Tue, Mar 12, 2019 at 02:35:17PM +0530, Vignesh Raghavendra wrote:
>> Add dt bindings for TI syscon gate clock.
>>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>>   .../bindings/clock/ti,syscon-gate-clock.txt   | 35 +++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/ti,syscon-gate-clock.txt
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

Is this a hard requirement? We seem to have few instances in the various 
DTS files for various vendors where this is done, syscon is paired with 
simple-mfd or simple-bus, or something else.

Basically, syscon by itself does not probe its children, and you can't 
have the simple syscon support from kernel side if you don't have the 
syscon compatible. Alternative is that we don't add any of the syscon 
children under the syscon but add them as separate nodes outside it.

The above is not an issue for this patch itself if we ditch the separate 
clock nodes, but it is more of a question about the syscon functionality 
itself.

-Tero

> 
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

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
