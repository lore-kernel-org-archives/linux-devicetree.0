From: =?UTF-8?Q?Pablo_Sebasti=c3=a1n_Greco?= <pgreco@centosproject.org>
Subject: Re: [linux-sunxi] Re: [PATCH v5 3/7] ARM: dts: sun8i: v40:
 bananapi-m2-berry: Enable GMAC ethernet controller
Date: Thu, 2 May 2019 07:25:25 -0300
Message-ID: <2af6a523-adeb-7f7d-c2b1-de852aa3c562@centosproject.org>
References: <1556040365-10913-1-git-send-email-pgreco@centosproject.org>
 <1556040365-10913-4-git-send-email-pgreco@centosproject.org>
 <20190502073904.yng5dz5kwgulw6ha@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502073904.yng5dz5kwgulw6ha@flea>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com
Cc: linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


El 2/5/19 a las 04:39, Maxime Ripard escribió:
> On Tue, Apr 23, 2019 at 02:26:00PM -0300, Pablo Greco wrote:
>> Just like the Bananapi M2 Ultra, the Bananapi M2 Berry has a Realtek
>> RTL8211E RGMII PHY tied to the GMAC.
>> The PMIC's DC1SW output provides power for the PHY, while the ALDO2
>> output provides I/O voltages on both sides.
>>
>> Signed-off-by: Pablo Greco <pgreco@centosproject.org>
>> ---
>>   arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 29 +++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
>> index 2cb2ce0..561319b 100644
>> --- a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
>> +++ b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
>> @@ -50,6 +50,7 @@
>>   	compatible = "sinovoip,bpi-m2-berry", "allwinner,sun8i-r40";
>>
>>   	aliases {
>> +		ethernet0 = &gmac;
>>   		serial0 = &uart0;
>>   	};
>>
>> @@ -92,6 +93,22 @@
>>   	status = "okay";
>>   };
>>
>> +&gmac {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&gmac_rgmii_pins>;
>> +	phy-handle = <&phy1>;
>> +	phy-mode = "rgmii";
>> +	phy-supply = <&reg_dc1sw>;
>> +	status = "okay";
>> +};
>> +
>> +&gmac_mdio {
>> +	phy1: ethernet-phy@1 {
>> +		compatible = "ethernet-phy-ieee802.3-c22";
>> +		reg = <1>;
>> +	};
>> +};
>> +
>>   &i2c0 {
>>   	status = "okay";
>>
>> @@ -133,6 +150,12 @@
>>   	vcc-pg-supply = <&reg_dldo1>;
>>   };
>>
>> +&reg_aldo2 {
>> +	regulator-min-microvolt = <2500000>;
>> +	regulator-max-microvolt = <2500000>;
>> +	regulator-name = "vcc-pa";
>> +};
>> +
> Shouldn't this one be added to the patch 2?
>
> Thanks
> Maxime
Yes, I'll do that in next version
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Pablo.
