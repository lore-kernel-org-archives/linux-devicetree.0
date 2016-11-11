From: Anurup M <anurupvasu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH v1 02/11] dt-bindings: hisi: Add Hisilicon
 HiP05/06/07 Sysctrl and Djtag dts bindings
Date: Fri, 11 Nov 2016 16:49:03 +0530
Message-ID: <5825A927.2000202@gmail.com>
References: <1478151727-20250-1-git-send-email-anurup.m@huawei.com>
 <1478151727-20250-3-git-send-email-anurup.m@huawei.com>
 <20161110172320.GA10137@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161110172320.GA10137@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, anurup.m-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, zhangshaokun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, sanil.kumar-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shiju.jose-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shyju.pv-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Thursday 10 November 2016 10:53 PM, Mark Rutland wrote:
> Hi,
>
> On Thu, Nov 03, 2016 at 01:41:58AM -0400, Anurup M wrote:
>> From: Tan Xiaojun <tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>
>> 	1) Add Hisilicon HiP05/06/07 CPU and ALGSUB system controller dts
>> 	   bindings.
>> 	2) Add Hisilicon Djtag dts binding.
>>
>> Signed-off-by: Tan Xiaojun <tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Anurup M <anurup.m-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> ---
>>   .../bindings/arm/hisilicon/hisilicon.txt           | 82 ++++++++++++++++++++++
>>   1 file changed, 82 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
>> index 7df79a7..341cbb9 100644
>> --- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
>> +++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
>> @@ -270,3 +270,85 @@ Required Properties:
>>     [1]: bootwrapper size
>>     [2]: relocation physical address
>>     [3]: relocation size
>
>> +-----------------------------------------------------------------------
>> +The Hisilicon Djtag in CPU die is an independent component which connects with
>> +some other components in the SoC by Debug Bus. This driver can be configured
>> +to access the registers of connecting components (like L3 cache, l3 cache PMU
>> + etc.) during real time debugging by sysctrl. These components appear as child
>> +nodes of djtag.
> Please put the djtag binding in a new file.
>
> It's clearly unrelated to many other things in this file, which should
> also be split out.
Ok. Shall move the djtag bindings to hisilicon/djtag.txt.

>> +The Hip05/06/07 CPU system controller(sysctrl) support to manage some important
>> +components (such as clock, reset, soft reset, secure debugger, etc.).
>> +The CPU sysctrl registers in hip05/06/07 doesnot use syscon but will be mapped
>> +by djtag driver for use by connecting components.
> The djtag driver is irrelvant here.
>
> If there's a realtionship between the two, please define that in the
> binding rather than implicitly assuming it in the driver.
Ok. I shall remove "djtag driver" and shall modify as

+The Hisilicon Djtag in CPU die is an independent component which connects with
+some other components in the SoC by Debug Bus. The djtag will use the system controller
+registers to access the connecting components in CPU die (like L3 cache, l3 cache PMU
+etc.) during real time debugging. These components appear as child nodes of djtag.

>> +
>> +Required properties:
>> +  - compatible : "hisilicon,hip05-cpu-djtag-v1"
>> +  - reg : Register address and size
>> +
>> +Hisilicon HiP06 djtag for CPU sysctrl
>> +Required properties:
>> +- compatible : "hisilicon,hip06-sysctrl", "syscon", "simple-mfd";
> This looks messy. Why is this syscon and a simple-mfd?
>
> We should kill off / deprecate the syscon binding. It's completely
> meaningless.
My Apologies. The syscon is not used now. Mistake in file version used 
for patch creation.
The compatible filed will be "hisilicon,hisi-cpu-djtag-v1"
>> +- reg : Register address and size
>> +- djtag :
>> +  - compatible : "hisilicon,hip06-cpu-djtag-v1"
>> +  - reg : Register address and size
>> +
>> +Hisilicon HiP07 djtag for CPU sysctrl
>> +Required properties:
>> +  - compatible : "hisilicon,hip07-cpu-djtag-v2"
>> +  - reg : Register address and size
>> +
>> +Example:
>> +	/* for Hisilicon HiP05 djtag for CPU sysctrl */
>> +	djtag0: djtag@80010000 {
>> +		compatible = "hisilicon,hip05-cpu-djtag-v1";
>> +		reg = <0x0 0x80010000 0x0 0x10000>;
>> +
>> +		/* For L3 cache PMU */
>> +		pmul3c0 {
>> +			compatible = "hisilicon,hisi-pmu-l3c-v1";
>> +			scl-id = <0x02>;
>> +			num-events = <0x16>;
>> +			num-counters = <0x08>;
>> +			module-id = <0x04>;
>> +			num-banks = <0x04>;
>> +			cfgen-map = <0x02 0x04 0x01 0x08>;
>> +			counter-reg = <0x170>;
>> +			evctrl-reg = <0x04>;
>> +			event-en = <0x1000000>;
>> +			evtype-reg = <0x140>;
>> +		};
> This sub-node needs a binding document.
>
> These properties are completely opaque
The L3 cache PMU bindings are defined @bindings/arm/hisilicon/pmu.txt.
Is it OK that I document here(hisilicon/djtag.txt), a reference to the 
PMU bindings doc ?

>> +	};
>> +
>> +-----------------------------------------------------------------------
>> +The Hisilicon HiP05/06/07 ALGSUB system controller(sysctrl) is in IO die
>> +of SoC. It has a similar function as the Hisilicon HiP05/06/07 CPU system
>> +controller in CPU die and it manage different components, like RSA, etc.
>> +The Hisilicon Djtag in IO die has a similar function as in CPU die and maps
>> +the sysctrl registers for use by connecting components.
>> +All connecting components shall appear as child nodes of djtag.
> I don't follow the above. This describes an ALGSUB system controllerm
> but the documentation below is all about djtag.
The ALGSUB is the name of the sysctrl of IO die. I shall remove ALGSUB 
to avoid confusion.

I would also add the below details in the introduction.

The Hisilicon djtag will use the system controller registers to control 
access to connecting modules
of CPU and IO die in the chip. There are separate system controller 
registers for CPU and IO die  in the chip.

And the section will be modified as

+Hisilicon HiP05 djtag for IO sysctrl
+Required properties:
+  - compatible : "hisilicon,hisi-io-djtag-v1"
+  - reg : Register address and size
+
+Hisilicon HiP06/07 djtag for IO sysctrl
+Required properties:
+  - compatible : "hisilicon,hip06-io-djtag-v2"
+  - reg : Register address and size
+
+Example:
+	/* for Hisilicon HiP05 djtag for IO sysctrl */
+	djtag0: djtag@d0000000 {
+	       compatible = "hisilicon,hisi-io-djtag-v1";
+		reg = <0x0 0xd0000000 0x0 0x10000>;
+	};

Thanks,
Anurup

> Thanks,
> Mark.
>
>> +Hisilicon HiP05 djtag for ALGSUB sysctrl
>> +Required properties:
>> +  - compatible : "hisilicon,hip05-io-djtag-v1"
>> +  - reg : Register address and size
>> +
>> +Hisilicon HiP06 djtag for ALGSUB sysctrl
>> +Required properties:
>> +  - compatible : "hisilicon,hip06-io-djtag-v2"
>> +  - reg : Register address and size
>> +
>> +Hisilicon HiP07 djtag for ALGSUB sysctrl
>> +Required properties:
>> +  - compatible : "hisilicon,hip07-io-djtag-v2"
>> +  - reg : Register address and size
>> +
>> +Example:
>> +	/* for Hisilicon HiP05 djtag for alg sysctrl */
>> +	djtag0: djtag@d0000000 {
>> +	       compatible = "hisilicon,hip05-io-djtag-v1";
>> +		reg = <0x0 0xd0000000 0x0 0x10000>;
>> +	};
>> -- 
>> 2.1.4
>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
