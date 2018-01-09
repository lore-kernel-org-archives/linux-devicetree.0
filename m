From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 5/7] ARM: dts: imx6ul: add ARM architected timer
Date: Tue, 09 Jan 2018 14:18:02 +0100
Message-ID: <52375931bc227da59721b0d7ebcf024b@agner.ch>
References: <20180102164223.15230-1-stefan@agner.ch>
 <20180102164223.15230-5-stefan@agner.ch>
 <20180109093422.GD26312@b29396-OptiPlex-7040>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180109093422.GD26312@b29396-OptiPlex-7040>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-imx-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2018-01-09 10:34, Dong Aisheng wrote:
> Hi Stefan,
> 
> On Tue, Jan 02, 2018 at 05:42:21PM +0100, Stefan Agner wrote:
>> Add per-core ARM architected timer. Unfortunately bootloaders (U-Boot)
>> currently do not make the necessary initialization. Also specifing the
>> clock manually using the clock-frequency property seems not to help.
>> Therefor leave the timer disabled by default for now.
>>
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> 
> Any special purpose to use arch timer?
> 

It is the better option. It supports virtualization and allows direct
user space access, e.g. as used in OpenSSL through _armv7_tick.

--
Stefan

>> ---
>>  arch/arm/boot/dts/imx6ul.dtsi | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
>> index 993fbdbdd506..4d76923e8f44 100644
>> --- a/arch/arm/boot/dts/imx6ul.dtsi
>> +++ b/arch/arm/boot/dts/imx6ul.dtsi
>> @@ -110,6 +110,16 @@
>>  		      <0x00a06000 0x2000>;
>>  	};
>>
>> +	timer {
>> +		compatible = "arm,armv7-timer";
>> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>> +		interrupt-parent = <&intc>;
>> +		status = "disabled";
>> +	};
>> +
>>  	ckil: clock-cli {
>>  		compatible = "fixed-clock";
>>  		#clock-cells = <0>;
>> --
>> 2.15.1
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
