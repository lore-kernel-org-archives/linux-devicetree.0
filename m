Return-Path: <wxt@rock-chips.com>
Message-ID: <577C7337.7060803@rock-chips.com>
Date: Wed, 06 Jul 2016 10:55:51 +0800
From: Caesar Wang <wxt@rock-chips.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: support the pmu node for rk3399
References: <1467358570-24417-1-git-send-email-wxt@rock-chips.com> <1467358570-24417-3-git-send-email-wxt@rock-chips.com> <20160701102612.GB22953@leverpostej>
In-Reply-To: <20160701102612.GB22953@leverpostej>
Content-Type: multipart/alternative;
 boundary="------------010406060203030404010602"
To: Mark Rutland <mark.rutland@arm.com>, marc.zyngier@arm.com
Cc: Caesar Wang <wxt@rock-chips.com>, huangtao@rock-chips.com, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Catalin Marinas <catalin.marinas@arm.com>, Brian Norris <briannorris@chromium.org>, Will Deacon <will.deacon@arm.com>, dianders@chromium.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, David Wu <david.wu@rock-chips.com>, cf@rock-chips.com, briannorris@google.com, jay.xu@rock-chips.com, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------010406060203030404010602
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mark,

On 2016?07?01? 18:26, Mark Rutland wrote:
> On Fri, Jul 01, 2016 at 03:36:10PM +0800, Caesar Wang wrote:
>> As the Marc posted the patches [0] to support Partitioning per-cpu
>> interrupts. Let's add this patch to match it on rk3399 SoCs.
>>
>> [0]:
>> https://lkml.org/lkml/2016/4/11/182
> The core IRQ support is merged, but it's worth noting that the perf code
> doesn't use it yet. So we still need a patch adding support to the perf
> code before we can change the dts.
>
> I think Marc had a prototype of that somewhere.
>
> Marc?
>
>> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
>> Cc: Heiko Stuebner <heiko@sntech.de>
>> Cc: Will Deacon <will.deacon@arm.com>
>> Cc: Marc Zyngier <marc.zyngier@arm.com>
>> CC: linux-arm-kernel@lists.infradead.org
>>
>> ---
>>
>>   arch/arm64/boot/dts/rockchip/rk3399.dtsi | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> index 8f0a069..b260f62 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> @@ -165,6 +165,22 @@
>>   			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
>>   	};
>>   
>> +	pmu_a53 {
>> +		compatible = "arm,cortex-a53-pmu";
>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &part0>;
>> +		interrupt-affinity = <&cpu_l0>,
>> +				     <&cpu_l1>,
>> +				     <&cpu_l2>,
>> +				     <&cpu_l3>;
>> +	};
> I'm not keen on having to redundantly describe the affinity in
> interrupt-affinity and the partition's affinity property. Those will
> almost certainly be out-of-sync in some DTs, and it'll be very painful
> to deal with.
>
> I think that for partitioned PPIs the PMU driver should use the affinity
> from the PPI, and not have an interrupt-affinity property. Hopefully
> that's relatively simple to handle.

So you are keen have the simple to handle the pmu.

e.g.:
+       pmu_a53 {
+               compatible = "arm,cortex-a53-pmu";
+               interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &part0>;
+       };
+
+       pmu_a72 {
+               compatible = "arm,cortex-a72-pmu";
+               interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &part1>;
+       };

Right?

---

BTW:
Do I need continue to send it for upstream or you guys will change it 
for all platform?

Thanks

-
Caesar
>
> Thanks,
> Mark.
>
>> +
>> +	pmu_a72 {
>> +		compatible = "arm,cortex-a72-pmu";
>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &part1>;
>> +		interrupt-affinity = <&cpu_b0>,
>> +				     <&cpu_b1>;
>> +	};
>> +
>>   	xin24m: xin24m {
>>   		compatible = "fixed-clock";
>>   		clock-frequency = <24000000>;
>> @@ -296,6 +312,16 @@
>>   			msi-controller;
>>   			reg = <0x0 0xfee20000 0x0 0x20000>;
>>   		};
>> +
>> +		ppi-partitions {
>> +			part0: interrupt-partition-0 {
>> +				affinity = <&cpu_l0 &cpu_l1 &cpu_l2 &cpu_l3>;
>> +			};
>> +
>> +			part1: interrupt-partition-1 {
>> +				affinity = <&cpu_b0 &cpu_b1>;
>> +			};
>> +		};
>>   	};
>>   
>>   	i2c1: i2c@ff110000 {
>> -- 
>> 1.9.1
>>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


-- 
caesar wang | software engineer | wxt@rock-chip.com


--------------010406060203030404010602
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi Mark,<br>
    <br>
    <div class="moz-cite-prefix">On 2016&#24180;07&#26376;01&#26085; 18:26, Mark Rutland
      wrote:<br>
    </div>
    <blockquote cite="mid:20160701102612.GB22953@leverpostej"
      type="cite">
      <pre wrap="">On Fri, Jul 01, 2016 at 03:36:10PM +0800, Caesar Wang wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">As the Marc posted the patches [0] to support Partitioning per-cpu
interrupts. Let's add this patch to match it on rk3399 SoCs.

[0]:
<a class="moz-txt-link-freetext" href="https://lkml.org/lkml/2016/4/11/182">https://lkml.org/lkml/2016/4/11/182</a>
</pre>
      </blockquote>
      <pre wrap="">
The core IRQ support is merged, but it's worth noting that the perf code
doesn't use it yet. So we still need a patch adding support to the perf
code before we can change the dts.

I think Marc had a prototype of that somewhere.

Marc?

</pre>
      <blockquote type="cite">
        <pre wrap="">Signed-off-by: Caesar Wang <a class="moz-txt-link-rfc2396E" href="mailto:wxt@rock-chips.com">&lt;wxt@rock-chips.com&gt;</a>
Cc: Heiko Stuebner <a class="moz-txt-link-rfc2396E" href="mailto:heiko@sntech.de">&lt;heiko@sntech.de&gt;</a>
Cc: Will Deacon <a class="moz-txt-link-rfc2396E" href="mailto:will.deacon@arm.com">&lt;will.deacon@arm.com&gt;</a>
Cc: Marc Zyngier <a class="moz-txt-link-rfc2396E" href="mailto:marc.zyngier@arm.com">&lt;marc.zyngier@arm.com&gt;</a>
CC: <a class="moz-txt-link-abbreviated" href="mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@lists.infradead.org</a>

---

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 8f0a069..b260f62 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -165,6 +165,22 @@
 			     &lt;GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0&gt;;
 	};
 
+	pmu_a53 {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = &lt;GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &amp;part0&gt;;
+		interrupt-affinity = &lt;&amp;cpu_l0&gt;,
+				     &lt;&amp;cpu_l1&gt;,
+				     &lt;&amp;cpu_l2&gt;,
+				     &lt;&amp;cpu_l3&gt;;
+	};
</pre>
      </blockquote>
      <pre wrap="">
I'm not keen on having to redundantly describe the affinity in
interrupt-affinity and the partition's affinity property. Those will
almost certainly be out-of-sync in some DTs, and it'll be very painful
to deal with.

I think that for partitioned PPIs the PMU driver should use the affinity
from the PPI, and not have an interrupt-affinity property. Hopefully
that's relatively simple to handle.</pre>
    </blockquote>
    <br>
    <small>So you are keen have the simple to handle the pmu.<br>
      <br>
      e.g.:<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pmu_a53 {<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible = "arm,cortex-a53-pmu";<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupts = &lt;GIC_PPI 7 IRQ_TYPE_LEVEL_LOW
      &amp;part0&gt;;<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
      +<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pmu_a72 {<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible = "arm,cortex-a72-pmu";<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupts = &lt;GIC_PPI 7 IRQ_TYPE_LEVEL_LOW
      &amp;part1&gt;;<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
      <br>
      Right?<br>
      &nbsp;<br>
      ---<br>
      <br>
      BTW: <br>
      Do I need continue to send it for upstream or you guys will change
      it for all platform?</small><br>
    <br>
    Thanks<br>
    <br>
    -<br>
    Caesar<br>
    <blockquote cite="mid:20160701102612.GB22953@leverpostej"
      type="cite">
      <pre wrap="">

Thanks,
Mark.

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+	pmu_a72 {
+		compatible = "arm,cortex-a72-pmu";
+		interrupts = &lt;GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &amp;part1&gt;;
+		interrupt-affinity = &lt;&amp;cpu_b0&gt;,
+				     &lt;&amp;cpu_b1&gt;;
+	};
+
 	xin24m: xin24m {
 		compatible = "fixed-clock";
 		clock-frequency = &lt;24000000&gt;;
@@ -296,6 +312,16 @@
 			msi-controller;
 			reg = &lt;0x0 0xfee20000 0x0 0x20000&gt;;
 		};
+
+		ppi-partitions {
+			part0: interrupt-partition-0 {
+				affinity = &lt;&amp;cpu_l0 &amp;cpu_l1 &amp;cpu_l2 &amp;cpu_l3&gt;;
+			};
+
+			part1: interrupt-partition-1 {
+				affinity = &lt;&amp;cpu_b0 &amp;cpu_b1&gt;;
+			};
+		};
 	};
 
 	i2c1: i2c@ff110000 {
-- 
1.9.1

</pre>
      </blockquote>
      <pre wrap="">
_______________________________________________
Linux-rockchip mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Linux-rockchip@lists.infradead.org">Linux-rockchip@lists.infradead.org</a>
<a class="moz-txt-link-freetext" href="http://lists.infradead.org/mailman/listinfo/linux-rockchip">http://lists.infradead.org/mailman/listinfo/linux-rockchip</a>
</pre>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
caesar wang | software engineer | <a class="moz-txt-link-abbreviated" href="mailto:wxt@rock-chip.com">wxt@rock-chip.com</a> </pre>
  </body>
</html>

--------------010406060203030404010602--
