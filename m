From: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: add support for A1 based Amlogic AD401
Date: Thu, 12 Sep 2019 16:25:06 +0800
Message-ID: <eefe907c-d1f3-1c56-51d4-01af342a9697@amlogic.com>
References: <1568216290-84219-1-git-send-email-jianxin.pan@amlogic.com>
 <1568216290-84219-5-git-send-email-jianxin.pan@amlogic.com>
 <e0054a53-7516-0527-3df7-c85e168003ba@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e0054a53-7516-0527-3df7-c85e168003ba@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Carlo Caione <carlo@caione.org>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Tao Zeng <tao.zeng@amlogic.com>
List-Id: devicetree@vger.kernel.org

Hi Neil,


On 2019/9/11 23:54, Neil Armstrong wrote:
> On 11/09/2019 17:38, Jianxin Pan wrote:
>> Add basic support for the Amlogic A1 based Amlogic AD401 board:
>> which describe components as follows: Reserve Memory, CPU, GIC, IRQ,
>> Timer, UART. It's capable of booting up into the serial console.
>>
>> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
>> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/Makefile           |   1 +
>>  arch/arm64/boot/dts/amlogic/meson-a1-ad401.dts |  30 ++++++
>>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi      | 131 +++++++++++++++++++++++++
>>  3 files changed, 162 insertions(+)
[...]
>> +
>> +	sm: secure-monitor {
>> +		compatible = "amlogic,meson-gxbb-sm";
>> +	};
>> +
>> +	soc {
>> +		compatible = "simple-bus";
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +
>> +		apb: bus@0xfe000000 {
> 
> Should be bus@fe000000
>
Thanks for your review.
I resent a new version and fixed it.
>> +			compatible = "simple-bus";
>> +			reg = <0x0 0xfe000000 0x0 0x1000000>;
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
[...]
>> +	xtal: xtal-clk {
>> +		compatible = "fixed-clock";
>> +		clock-frequency = <24000000>;
>> +		clock-output-names = "xtal";
>> +		#clock-cells = <0>;
>> +	};
>> +};
>>
> 
> With that fixed:
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> Neil
> 
> .
> 
