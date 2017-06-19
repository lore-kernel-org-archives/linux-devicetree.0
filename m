From: Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: display: stm32: Add DSI host driver
Date: Mon, 19 Jun 2017 16:58:36 +0000
Message-ID: <537eaaa2-fb16-9b6a-6705-5f3b1ace8154@st.com>
References: <1496414235-20098-1-git-send-email-philippe.cornu@st.com>
 <1496414235-20098-6-git-send-email-philippe.cornu@st.com>
 <20170608171244.twgn4xmqd5pstb2i@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170608171244.twgn4xmqd5pstb2i@rob-hp-laptop>
Content-Language: en-US
Content-ID: <AE7BE63A4222414CBBD133EB6D43567B@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Eric Anholt <eric@anholt.net>, Thierry Reding <thierry.reding@gmail.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Chris Zhong <zyw@rock-chips.com>, Mickael REULIER <mickael.reulier@st.com>, Archit Taneja <architt@codeaurora.org>, Russell King <linux@armlinux.org.uk>, Fabien DESSENNE <fabien.dessenne@st.com>, Xinliang Liu <xinliang.liu@linaro.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Chen Feng <puck.chen@hisilicon.com>, Vincent ABRIOU <vincent.abriou@st.com>, Ludov
List-Id: devicetree@vger.kernel.org



On 06/08/2017 07:12 PM, Rob Herring wrote:
> On Fri, Jun 02, 2017 at 04:37:14PM +0200, Philippe CORNU wrote:
>> This patch adds documentation of device tree bindings for the STM32
>> DSI host driver based on the Synopsys DW MIPI DSI bridge driver.
>> ---
>>   .../devicetree/bindings/display/st,stm32-ltdc.txt  | 83 +++++++++++++++++++++-
>>   1 file changed, 82 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
>> index 90a8459..4cd32bd 100644
>> --- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
>> +++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
>> @@ -12,8 +12,39 @@
>>     Required nodes:
>>       - Video port for RGB output.
>>   
>> -Example:
>> +* STMicroelectronics STM32 dsi specific extensions to Synopsys DesignWare MIPI
>> +  DSI host controller
>>   
>> +The STMicroelectronics STM32 dsi driver uses the Synopsys DesignWare MIPI
>> +DSI host controller driver (related documentation in [5]).
>> +
>> +Required properties:
>> +- #address-cells: Should be <1>.
>> +- #size-cells: Should be <0>.
>> +- compatible: "st,stm32-dsi".
>> +- reg: Memory mapped base address and length of the DWC MIPI DSI registers.
>> +- clocks: References to all the clocks specified in the clock-names property
>> +  as specified in [1].
>> +- clock-names:
>> +  - peripheral clock string name, must be "pclk".
>> +  - phy pll reference clock string name, must be "ref".
> 
> I still have the same comment as v1.
> 
Hi Rob,
I added the "reference to [5]" just few lines above (before the required 
properties) and I though it was enough : )
In the v4 version I have just sent, I have tried to be more explicit 
regarding this reference to [5] (what is optional and what is mandatory...).
Many thanks for your help,

>> +- resets: References to all the resets specified in the reset-names property
>> +  as specified in [2].
>> +- reset-names: string reset name, must be "apb".
>> +
>> +Required nodes:
>> +- dsi input port node: connected to the ltdc rgb output port, see [3] & [4].
>> +- panel or bridge node: see [6].
> 
> Need to be explicit here. Port 0 is ... Port 1 is ...
> 
Done in v4, many thanks for your comment.

>> +
>> +Note: You can find more documentation
>> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>> +[2] Documentation/devicetree/bindings/reset/reset.txt
>> +[3] Documentation/devicetree/bindings/media/video-interfaces.txt
>> +[4] Documentation/devicetree/bindings/graph.txt
>> +[5] Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
>> +[6] Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
>> +
>> +Example 1: RGB panel
>>   / {
>>   	...
>>   	soc {
>> @@ -33,3 +64,53 @@ Example:
>>   		};
>>   	};
>>   };
>> +
>> +Example 2: DSI panel
>> +
>> +/ {
>> +	...
>> +	soc {
>> +	...
>> +		ltdc: display-controller@40016800 {
>> +			compatible = "st,stm32-ltdc";
>> +			reg = <0x40016800 0x200>;
>> +			interrupts = <88>, <89>;
>> +			resets = <&rcc STM32F4_APB2_RESET(LTDC)>;
>> +			clocks = <&rcc 1 CLK_LCD>;
>> +			clock-names = "lcd";
>> +
>> +			port {
>> +				ltdc_out_dsi: endpoint {
>> +					remote-endpoint = <&dsi_in>;
>> +				};
>> +			};
>> +		};
>> +
>> +
>> +		dsi: dsi@40016c00 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			compatible = "st,stm32-dsi";
>> +			reg = <0x40016c00 0x800>;
>> +			clocks = <&rcc 1 CLK_F469_DSI>, <&clk_hse>;
>> +			clock-names = "ref", "pclk";
>> +			resets = <&rcc STM32F4_APB2_RESET(DSI)>;
>> +			reset-names = "apb";
>> +
>> +			port {
>> +				dsi_in: endpoint {
>> +					remote-endpoint = <&ltdc_out_dsi>;
>> +				};
>> +			};
>> +
>> +			panel-dsi@0 {
> 
> This should use graph binding instead. Or at least we should allow that
> and be clear above that we do.
> 
Done in v4, many thanks for your comment.
Philippe

>> +				reg = <0>; /* dsi virtual channel (0..3) */
>> +				compatible = ...;
>> +				enable-gpios = ...;
>> +
>> +			};
>> +
>> +		};
>> +
>> +	};
>> +};
>> -- 
>> 1.9.1
>>
