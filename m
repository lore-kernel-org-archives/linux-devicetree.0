From: =?UTF-8?Q?Pablo_Sebasti=c3=a1n_Greco?= <pgreco@centosproject.org>
Subject: Re: [PATCH v4 5/7] ARM: dts: sun8i: v40: bananapi-m2-berry: Add
 Bluetooth device node
Date: Thu, 18 Apr 2019 13:14:35 -0300
Message-ID: <bc5d7e91-74c5-103a-db72-6cb1f3ef53b9@centosproject.org>
References: <1555600282-9405-1-git-send-email-pgreco@centosproject.org>
 <1555600282-9405-6-git-send-email-pgreco@centosproject.org>
 <20190418155613.shiv7geoqyzfy4kf@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418155613.shiv7geoqyzfy4kf@flea>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


El 18/4/19 a las 12:56, Maxime Ripard escribió:
> On Thu, Apr 18, 2019 at 12:11:20PM -0300, Pablo Greco wrote:
>> Since the bananapi-m2-ultra and the bananapi-m2-berry have the same
>> WiFi/Bluetooth, add the required nodes to the bananapi-m2-berry.
>>
>> Signed-off-by: Pablo Greco <pgreco@centosproject.org>
>> ---
>>   arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 26 +++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
>> index 78f4a1a..3d0bb7e 100644
>> --- a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
>> +++ b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
>> @@ -96,6 +96,8 @@
>>   	wifi_pwrseq: wifi_pwrseq {
>>   		compatible = "mmc-pwrseq-simple";
>>   		reset-gpios = <&pio 6 10 GPIO_ACTIVE_LOW>; /* PG10 WIFI_EN */
>> +		clocks = <&ccu CLK_OUTA>;
>> +		clock-names = "ext_clock";
>>   	};
>>   };
>>
>> @@ -171,6 +173,11 @@
>>   	status = "okay";
>>   };
>>
>> +&pio {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&clk_out_a_pin>;
>> +};
>> +
> I'm not sure you answered my question about why that is needed?
Because it is the same case as 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts?id=1e5f1db4ccd8348a21da55bff82f4263000879ef
I can repeat that info in this commit log
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
Pablo.
