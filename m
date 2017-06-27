From: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v5 2/2] arm64: dts: renesas: salvator-x: Add ADV7482
 support
Date: Tue, 27 Jun 2017 10:25:39 +0100
Message-ID: <f1967d99-da16-303f-f3e9-7a3d28ccaf1d@ideasonboard.com>
References: <cover.90fc3153078e79a3f74af832de923ac675eb29ad.1497469745.git-series.kieran.bingham+renesas@ideasonboard.com>
 <ce388da93b793abc1b54df3e59ab287aedb9797f.1497469745.git-series.kieran.bingham+renesas@ideasonboard.com>
 <10057741.K1MBojqRFe@avalon>
Reply-To: kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10057741.K1MBojqRFe@avalon>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Kieran Bingham <kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

Thanks for the review,

On 23/06/17 08:43, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Wednesday 14 Jun 2017 20:58:13 Kieran Bingham wrote:
>> From: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
>>
>> The Salvator boards use an ADV7482 receiver for HDMI and CVBS inputs.
>>
>> Provide ADV7482 node on the i2c4 bus, along with connectors for the
>> hdmi and cvbs inputs, and link to the csi20 and csi40 nodes as outputs.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
>>
>> v4:
>>  - dt: Rebase to dts/renesas/salvator-x.dtsi
>>  - dt: Use AIN0-7 rather than AIN1-8
>>
>> v5:
>>  - dt: Move to salvator-common.dtsi
>> ---
>>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 123 ++++++++++++++++-
>>  1 file changed, 123 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>> b/arch/arm64/boot/dts/renesas/salvator-common.dtsi index
>> aef35e0b685a..d74fb55c38bc 100644
>> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>> @@ -65,6 +65,27 @@
>>  		enable-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
>>  	};
>>
>> +	cvbs-in {
>> +		compatible = "composite-video-connector";
>> +		label = "CVBS IN";
>> +
>> +		port {
>> +			cvbs_con: endpoint {
>> +			};
>> +		};
>> +	};
>> +
>> +	hdmi-in {
>> +		compatible = "hdmi-connector";
>> +		label = "HDMI IN";
>> +		type = "a";
>> +
>> +		port {
>> +			hdmi_in_con: endpoint {
>> +			};
>> +		};
>> +	};
>> +
>>  	reg_1p8v: regulator0 {
>>  		compatible = "regulator-fixed";
>>  		regulator-name = "fixed-1.8V";
>> @@ -257,6 +278,59 @@
>>  	};
>>  };
>>
>> +&csi20 {
>> +	status = "okay";
>> +
>> +	ports {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		port@0 {
>> +			reg = <0>;
> 
> Aren't #address-cells, #size-cells and reg already present in the SoC .dtsi ? 
> And if they're not, shouldn't they be ? :-)

Hrm - I think I added them because I was getting warnings from the DTC.

I've removed them from the csi nodes and no warning returns :)
So they're gone.


> 
>> +			csi20_in: endpoint {
>> +				clock-lanes = <0>;
>> +				data-lanes = <1>;
>> +				remote-endpoint = <&adv7482_txb>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&csi40 {
>> +	status = "okay";
>> +
>> +	ports {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;

# Removed

>> +
>> +		port@0 {
>> +			reg = <0>;
>> +
>> +			csi40_in: endpoint {
>> +				clock-lanes = <0>;
>> +				data-lanes = <1 2 3 4>;
>> +				remote-endpoint = <&adv7482_txa>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&cvbs_con {
>> +	port {
>> +		cvbs_in: endpoint {
>> +			remote-endpoint = <&adv7482_ain7>;
>> +		};
>> +	};
>> +};
> 
> You could merge this with the cvbs_con node above.

What is the distinction that means cvbs_con can be merged where hdmi_in_con
would not ?


Similarly, I see that VGA out is 'merged' where hdmi outs are not ... is it just
determined by whether the connector is on all boards that inherit
salvator-common.dtsi ?


> 
> Apart from that the patch looks good to me.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> 
>> +&hdmi_in_con {
>> +	port {
>> +		hdmi_in: endpoint {
>> +			remote-endpoint = <&adv7482_hdmi>;
>> +		};
>> +	};
>> +};
>> +
>>  &du {
>>  	pinctrl-0 = <&du_pins>;
>>  	pinctrl-names = "default";
>> @@ -343,6 +417,55 @@
>>
>>  		shunt-resistor-micro-ohms = <5000>;
>>  	};
>> +
>> +	video-receiver@70 {
>> +		compatible = "adi,adv7482";
>> +		reg = <0x70>;
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;

But I can't remove these # without generating a warning message ...

>> +
>> +		interrupt-parent = <&gpio6>;
>> +		interrupt-names = "intrq1", "intrq2";
>> +		interrupts = <30 IRQ_TYPE_LEVEL_LOW>,
>> +			     <31 IRQ_TYPE_LEVEL_LOW>;
>> +
>> +		port@7 {
>> +			reg = <7>;
>> +
>> +			adv7482_ain7: endpoint {
>> +				remote-endpoint = <&cvbs_in>;
>> +			};
>> +		};
>> +
>> +		port@8 {
>> +			reg = <8>;
>> +
>> +			adv7482_hdmi: endpoint {
>> +				remote-endpoint = <&hdmi_in>;
>> +			};
>> +		};
>> +
>> +		port@10 {
>> +			reg = <10>;
>> +
>> +			adv7482_txa: endpoint {
>> +				clock-lanes = <0>;
>> +				data-lanes = <1 2 3 4>;
>> +				remote-endpoint = <&csi40_in>;
>> +			};
>> +		};
>> +
>> +		port@11 {
>> +			reg = <11>;
>> +
>> +			adv7482_txb: endpoint {
>> +				clock-lanes = <0>;
>> +				data-lanes = <1>;
>> +				remote-endpoint = <&csi20_in>;
>> +			};
>> +		};
>> +	};
>>  };
>>
>>  &i2c_dvfs {
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
