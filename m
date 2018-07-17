From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/3] dt-bindings: amlogic: Add Internal Clock Measurer
 bindings
Date: Tue, 17 Jul 2018 13:30:38 +0200
Message-ID: <964512dd-fddb-4919-446a-96db7cc22a8b@baylibre.com>
References: <1530624110-4687-1-git-send-email-narmstrong@baylibre.com>
 <1530624110-4687-3-git-send-email-narmstrong@baylibre.com>
 <20180716214516.GA31738@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180716214516.GA31738@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: khilman@baylibre.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 16/07/2018 23:45, Rob Herring wrote:
> On Tue, Jul 03, 2018 at 03:21:49PM +0200, Neil Armstrong wrote:
>> The Amlogic Meson GX SoCs embeds a clock measurer IP to measure the internal
>> clock paths frequencies.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  .../devicetree/bindings/soc/amlogic/clk-measure.txt       | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
>>
>> diff --git a/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
>> new file mode 100644
>> index 0000000..ba9183a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
>> @@ -0,0 +1,15 @@
>> +Amlogic Internal Clock Measurer
>> +===============================
>> +
>> +The Amlogic SoCs contains an IP to measure the internal clocks.
>> +The precision is multiple of MHz, useful to debug the clock states.
> 
> What a simple yet useful debug tool.
> 
>> +
>> +Required properties:
>> +- compatible: Shall contain "amlogic,meson-gx-clk-measure"
>> +- reg: base address and size of the Clock Measurer register space.
>> +
>> +Example:
>> +	clock-measure@8758 {
>> +		compatible = "amlogic,meson-gx-clk-measure";
>> +		reg = <0x0 0x8758 0x0 0x10>;
> 
> This doesn't really look like its own block though. Can't the parent 
> device instantiate the driver for this?

As weird as it seems, on the GX family the registers are not on a aligned boundary, but yes it's its own block.
On newer SoCs, they have a more aligned register address, with the exact same register set.

Neil

> 
> 
>> +	};
>> -- 
>> 2.7.4
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
