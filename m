Return-Path: <SRS0=8eNp=OM=samsung.com=s.nawrocki@kernel.org>
Subject: Re: [PATCH v2 3/5] arm64: dts: bindings: document imem clock
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <be16bd2d-6f71-b273-a708-3781cdd9179d@samsung.com>
Date: Mon, 03 Dec 2018 11:44:17 +0100
MIME-version: 1.0
In-reply-to: <154353492516.88331.1979737561234011163@swboyd.mtv.corp.google.com>
Content-type: text/plain; charset="utf-8"
Content-language: en-GB
Content-transfer-encoding: 7bit
References: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
	<CGME20181129155146eucas1p1518bbd1c009d340898227d3d72cbb5a1@eucas1p1.samsung.com>
	<20181129155134.19141-4-k.konieczny@partner.samsung.com>
	<154353492516.88331.1979737561234011163@swboyd.mtv.corp.google.com>
To: Stephen Boyd <sboyd@kernel.org>, k.konieczny@partner.samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

On 11/30/18 00:42, Stephen Boyd wrote:
> Quoting Kamil Konieczny (2018-11-29 07:51:32)
>> Document imem clock bindings for SSS (Security SubSystem) and SlimSSS IPs.
>>
>> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
>> ---
> 
> Fix the subject of this patch please. It's not arm64: or dts:
> 
>>  .../bindings/clock/exynos5433-clock.txt       | 23 +++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
>> index 50d5897c9849..4e4352bf5a0b 100644
>> --- a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
>> +++ b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
>> @@ -264,6 +272,21 @@ Example 2: Examples of clock controller nodes are listed below.
>>                        <&cmu_top CLK_SCLK_USBDRD30_FSYS>;
>>         };
>>  
>> +       cmu_imem: clock-controller@11060000 {
>> +               compatible = "samsung,exynos5433-cmu-imem";
>> +               reg = <0x11060000 0x1000>;
>> +               #clock-cells = <1>;
>> +
>> +               clock-names = "oscclk",
> 
> How about just osc? clk seems redundant.

Can we keep this "oscclk" name? This patch just adds missing definition
of one of multiple CMUs in the SoC and for the all other CMUs "oscclk"
name has been adopted for the OSCCLK root oscillator clock. The name is 
exactly as on the diagrams in the datasheet, just in lower case.
To avoid confusion I would prefer to stay with same name as used for the
other CMUs.

>> +                       "aclk_imem_sssx_266",
>> +                       "aclk_imem_266",
>> +                       "aclk_imem_200";
> 
> And what is 'aclk'? Also redundant?

Again the names used here are exactly as in the SoC datasheet. I know we 
could use shorted names for these consumer clocks however at this point 
I would prefer to use same convention as for the other CMUs.

ACLK means AXI bus clock, the IMEM CMU is basically just gates that pass
the clocks further to the SoC peripheral blocks.

>> +               clocks = <&xxti>,
>> +                       <&cmu_top CLK_DIV_ACLK_IMEM_SSSX_266>,
>> +                       <&cmu_top CLK_DIV_ACLK_IMEM_266>,
>> +                       <&cmu_top CLK_DIV_ACLK_IMEM_200>;
>> +       };
>> 
-- 
Regards,
Sylwester
