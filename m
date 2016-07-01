From: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v5 5/5] usb: dwc3: rockchip: add devicetree bindings
 documentation
Date: Fri, 01 Jul 2016 09:20:30 +0800
Message-ID: <5775C55E.8090508@rock-chips.com>
References: <1467285176-25222-1-git-send-email-william.wu@rock-chips.com>
 <1467285400-25450-1-git-send-email-william.wu@rock-chips.com>
 <2510621.9FbtAACURA@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <2510621.9FbtAACURA@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Heiko,

On 06/30/2016 08:15 PM, Heiko Stuebner wrote:
> Hi William,
>
> Am Donnerstag, 30. Juni 2016, 19:16:40 schrieb William Wu:
>> This patch adds the devicetree documentation required for Rockchip
>> USB3.0 core wrapper consisting of USB3.0 IP from Synopsys.
>>
>> It supports DRD mode, and could operate in device mode (SS, HS, FS)
>> and host mode (SS, HS, FS, LS).
>>
>> Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>> Changes in v5:
>> - rename clock-names, and remove unnecessary clocks (Heiko)
>>
>> Changes in v4:
>> - modify commit log, and add phy documentation location (Sergei)
>>
>> Changes in v3:
>> - add dwc3 address (balbi)
>>
>> Changes in v2:
>> - add rockchip,dwc3.txt to Documentation/devicetree/bindings/ (balbi,
>> Brian)
>>
>>   .../devicetree/bindings/usb/rockchip,dwc3.txt      | 40
>> ++++++++++++++++++++++ 1 file changed, 40 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
>>
>> diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
>> b/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt new file mode
>> 100644
>> index 0000000..9c85e19
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
>> @@ -0,0 +1,40 @@
>> +Rockchip SuperSpeed DWC3 USB SoC controller
>> +
>> +Required properties:
>> +- compatible:	should contain "rockchip,rk3399-dwc3" for rk3399 SoC
>> +- clocks:	A list of phandle + clock-specifier pairs for the
>> +		clocks listed in clock-names
>> +- clock-names:	Should contain the following:
>> +  "ref_clk"	Controller reference clk, have to be 24 MHz
>> +  "suspend_clk"	Controller suspend clk, have to be 24 MHz or 32 KHz
>> +  "bus_clk_otg0"Master/Core clock, have to be >= 62.5 MHz for SS
>> +		operation and >= 60MHz for HS operation
> why is it called "bus_clk_otg0" not just simply "bus_clk". As far as I
> understand it (and see it in the TRM), you have two dwc3 controllers
> (otg0 and otg1) and clock-names are always meant from the perspective of
> the individual ip-block. So a devicetree would have:
>
> 	usbdrd3_0: usb@fe800000 {
> 		compatible = "rockchip,rk3399-dwc3";
> 		clocks = <&cru SCLK_USB3OTG0_REF>, <&cru SCLK_USB3OTG0_SUSPEND>,
> 			 <&cru ACLK_USB3OTG0>, <&cru ACLK_USB3_GRF>;
> 		clock-names = "ref_clk", "suspend_clk",
> 			      "bus_clk", "grf_clk";
> 		...
> 	};
>
> 	usbdrd3_1: usb@fe900000 {
> 		compatible = "rockchip,rk3399-dwc3";
> 		clocks = <&cru SCLK_USB3OTG1_REF>, <&cru SCLK_USB3OTG1_SUSPEND>,
> 			 <&cru ACLK_USB3OTG1>, <&cru ACLK_USB3_GRF>;
> 		clock-names = "ref_clk", "suspend_clk",
> 			      "bus_clk", "grf_clk";
> 		...
> 	};
>
>
> The rest looks really nice now.
Ah, it looks very goog to me. I'll fix it immediately.
Thank you very much!
>
>
> Heiko
>
>> +  "grf_clk"	Controller grf clk
>> +
>> +Required child node:
>> +A child node must exist to represent the core DWC3 IP block. The name of
>> +the node is not important. The content of the node is defined in
>> dwc3.txt. +
>> +Phy documentation is provided in the following places:
>> +Documentation/devicetree/bindings/phy/rockchip,dwc3-usb-phy.txt
>> +
>> +Example device nodes:
>> +
>> +	usbdrd3_0: usb@fe800000 {
>> +		compatible = "rockchip,rk3399-dwc3";
>> +		clocks = <&cru SCLK_USB3OTG0_REF>, <&cru SCLK_USB3OTG0_SUSPEND>,
>> +			 <&cru ACLK_USB3OTG0>, <&cru ACLK_USB3_GRF>;
>> +		clock-names = "ref_clk", "suspend_clk",
>> +			      "bus_clk_otg0", "grf_clk";
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +		status = "disabled";
>> +		usbdrd_dwc3_0: dwc3@fe800000 {
>> +			compatible = "snps,dwc3";
>> +			reg = <0x0 0xfe800000 0x0 0x100000>;
>> +			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
>> +			dr_mode = "otg";
>> +			status = "disabled";
>> +		};
>> +	};
>> --
>> 1.9.1
>
>
>
