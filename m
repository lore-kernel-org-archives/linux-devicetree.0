From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: Re: [RFC V3 PATCH 1/7] arm64: dts: msm8992 SoC and LG Bullhead (Nexus
 5X) support
Date: Fri, 21 Oct 2016 01:55:18 -0700
Message-ID: <bd5c03b3-1532-ec6a-b0ce-e85068d711e9@redhat.com>
References: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
 <1476265054-22511-2-git-send-email-jeremymc@redhat.com>
 <20161012103001.GB19509@remoulade>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161012103001.GB19509@remoulade>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Jeremy McNicoll <jeremymc@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org
List-Id: devicetree@vger.kernel.org

On 2016-10-12 3:30 AM, Mark Rutland wrote:
> On Wed, Oct 12, 2016 at 02:37:28AM -0700, Jeremy McNicoll wrote:
>> +/ {
>> +	model = "LGE MSM8992 BULLHEAD rev-1.01";
>> +	compatible = "qcom,msm8992";
>> +	qcom,board-id = <0xb64 0>;
>> +};
>
> This last property doesn't seem to be documented or used in mainline.
>
> What is it for?

Its required by the bootloader to select the correct blob.

>
>> +/ {
>> +	aliases {
>> +		serial0 = &blsp1_uart2;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0";
>> +	};
>
> I'd recommend describing the configured rate, per
> Documentation/devicetree/bindings/chosen.txt
>

Updated default serial settings have been changed as per V3
6/7 and the associated patch dropped. (6/7)


> [...]
>
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. MSM 8992";
>> +	compatible = "qcom,msm8992";
>> +	qcom,msm-id = <251 0>, <252 0>;
>> +	qcom,pmic-id = <0x10009 0x1000A 0x0 0x0>;
>
> These last two are not documented, and not used in mainline.
>
> What are they for?

They are explicitly needed by the bootloader.


>
>> +	memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +
>> +		device_type = "memory";
>> +		reg = <0 0 0 0>;
>
> If this is filled in by the bootloader, please havea coment to that effect.
>

added comment


>> +		peripheral_mem: peripheral_region@0 {
>> +			linux,reserve-contiguous-region;
>> +			linux,reserve-region;
>> +			linux,remove-completely;
>> +			reg = <0 0x07400000 0 0x1c00000>;
>> +			label = "peripheral_mem";
>> +		};
>> +	};
>
> What is this?
>
> There aren't any sub-nodes of memory (iirc reserved-memory is a separate node),
> an none of these 'liux,' prefixed properties exist in mainline.

dropped as its a relic of the past. (3.10)

>
> [...]
>
>> +	timer {
>> +		compatible = "arm,armv8-timer";
>> +		interrupts = <1 2 0xf08>,
>> +				<1 3 0xf08>,
>> +				<1 4 0xf08>,
>> +				<1 1 0xf08>;
>> +		clock-frequency = <19200000>;
>> +	};
>
> Why is the FW not programming the frequency register?
>

Not sure what the FW is doing as I don't have access to it.


>> +	clocks {
>> +		xo_board: xo_board {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <19200000>;
>> +		};
>> +
>> +		sleep_clk: sleep_clk {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <32768>;
>> +		};
>> +	};
>
> Get rid of the clocks container node, and places these directly under the root node.
>

moved up, waaay up!

-jeremy

> Thanks,
> Mark.
>
