From: =?UTF-8?Q?Pablo_Sebasti=c3=a1n_Greco?= <pgreco@centosproject.org>
Subject: Re: [PATCH v2 2/6] ARM: dts: sun8i: v40: bananapi-m2-berry: Enable
 GMAC ethernet controller
Date: Tue, 16 Apr 2019 07:47:09 -0300
Message-ID: <eb80d64f-7355-071b-c1d1-04e0eb4475ce@centosproject.org>
References: <1555065186-8154-1-git-send-email-pgreco@centosproject.org>
 <1555065186-8154-3-git-send-email-pgreco@centosproject.org>
 <20190415075309.p7pgj62mmtmxsnnr@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415075309.p7pgj62mmtmxsnnr@flea>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com
Cc: linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


El 15/4/19 a las 04:53, Maxime Ripard escribió:
> On Fri, Apr 12, 2019 at 07:33:01AM -0300, Pablo Greco wrote:
>> Just like the Bananapi M2 Ultra, the Bananapi M2 Berry has a Realtek
>> RTL8211E RGMII PHY tied to the GMAC.
>> The PMIC's DC1SW output provides power for the PHY, while the ALDO2
>> output provides I/O voltages on both sides.
>>
>> Signed-off-by: Pablo Greco <pgreco@centosproject.org>
>> ---
>>   arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 30 +++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
>> index f05cabd..0d79e91 100644
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
>> @@ -123,6 +140,13 @@
>>   	status = "okay";
>>   };
>>
>> +&reg_aldo2 {
>> +	regulator-always-on;
>> +	regulator-min-microvolt = <2500000>;
>> +	regulator-max-microvolt = <2500000>;
>> +	regulator-name = "vcc-pa";
>> +};
>> +
> If this one provides power to the pins, it should be tied to the PIO
> node.
In that case, I should fix the bananapi-m2-ultra the same way. Do you 
prefer me to add those fixes to this series?
Or is it better to apply this like it is, and I fix both together in a 
separated series?
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Pablo.
