From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: Re: [PATCH 1/6] arm64: dts: msm8992 SoC and LG Bullhead (Nexus 5X)
 support
Date: Wed, 2 Nov 2016 16:59:17 -0700
Message-ID: <be8df858-d427-c2f0-15a8-43cb2ee192a5@redhat.com>
References: <1477394221-30963-1-git-send-email-jeremymc@redhat.com>
 <1477394221-30963-2-git-send-email-jeremymc@redhat.com>
 <20161028001153.GJ26139@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161028001153.GJ26139@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Jeremy McNicoll <jeremymc@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, andy.gross@linaro.org, arnd@arndb.de, bjorn.andersson@linaro.org, mark.rutland@arm.com, michael.scott@linaro.org
List-Id: devicetree@vger.kernel.org

On 2016-10-27 5:11 PM, Stephen Boyd wrote:
> On 10/25, Jeremy McNicoll wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 5dd05de..439e40e 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -1,6 +1,8 @@
>> -dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb msm8916-mtp.dtb
>> -dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
>
> This is unrelated. Perhaps make another patch to "correct" it.
>

I rolled it into this change series as I was asked in previous feedback
to make them 1 per line.

>>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
>>
>>  always		:= $(dtb-y)
>>  subdir-y	:= $(dts-dirs)
>> diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
>> new file mode 100644
>> index 0000000..8bbf4f3
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
>> @@ -0,0 +1,191 @@
>> +
>> +	soc: soc {
>
> Do we need the soc phandle? If it isn't used we should leave it
> out.
>

What about doing something like:

8992soc: soc {

This will allow it to be overriden.  Or would it be best to add it when
someone wants / needs to override it.

>> +
>> +		clock_gcc: qcom,gcc@fc400000 {
>
> s/qcom,gcc/clock-controller/
>

done.


> Also we typically just give it a "gcc" phandle to be terse.

is clock_gcc not a little more descriptive from a human perspective?

Sometimes being terse is hard for humans to parse.

>
>> +			compatible = "qcom,gcc-8994";
>
> qcom,gcc-msm8994


agreed.


>
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +			reg = <0xfc400000 0x2000>;
>> +		};
>> +	};
>> +
>> +	memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +
>> +		device_type = "memory";
>> +		reg = <0 0 0 0>; // bootloader will update
>> +	};
>> +
>> +	clocks {
>> +		xo_board: xo_board {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <19200000>;
>> +			clock-output-names = "xo_board";
>> +		};
>> +
>> +		sleep_clk: sleep_clk {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <32768>;
>> +			clock-output-names = "sleep_clk";
>
> clock-output-names can be removed because we use the same string
> as the node name.
>

one less line works for me.

-jeremy
