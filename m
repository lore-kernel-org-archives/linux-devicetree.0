From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/7] ARM: dts: sun8i: h3: Enable AP6212 WiFi
 on mmc1 on Nanopi M1 Plus
Date: Wed, 30 Aug 2017 23:51:37 +0200
Message-ID: <89e3d5f8-1b31-bf86-4a6b-aee454c0b85f@gmail.com>
References: <1504062070-13523-1-git-send-email-embed3d@gmail.com>
 <1504062070-13523-5-git-send-email-embed3d@gmail.com>
 <20170830145211.snicbwdytobtd7ro@flea.lan>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBD257DPK24NRB4HGTTGQKGQEOSV6OMY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170830145211.snicbwdytobtd7ro-ZC1Zs529Oq4@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,
thanks for the feedback I will rework the patch.
Should I also update the sun8i-h3-bananapi-m2-plus.dts? It uses also the 
AP6212 and it is done in the same way like in this patch.

Am 30.08.2017 um 16:52 schrieb Maxime Ripard:
> Hi,
> 
> On Wed, Aug 30, 2017 at 05:01:07AM +0200, Philipp Rossak wrote:
>> From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> The WiFi side of the AP6212 WiFi/BT combo module is connected to
>> mmc1. There are also GPIOs for enable and interrupts.
>>
>> Enable WiFi on this board by enabling mmc1 and adding the power
>> sequencing clocks and GPIO, as well as the chip's interrupt line.
>>
>> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts | 35 +++++++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
>> index b9c6c27..3054308 100644
>> --- a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
>> +++ b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
>> @@ -48,6 +48,7 @@
>>   
>>   	aliases {
>>   		ethernet0 = &emac;
>> +		ethernet1 = &ap6212;
>>   	};
>>   
>>   	reg_gmac_3v3: gmac-3v3 {
>> @@ -59,6 +60,14 @@
>>   		enable-active-high;
>>   		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>;
>>   	};
>> +
>> +	wifi_pwrseq: wifi_pwrseq {
>> +		compatible = "mmc-pwrseq-simple";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wifi_en_npi_m1p>;
> 
> There's no need for pinctrl nodes when the pin is set to a GPIO.
> 
>> +		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
>> +	};
>> +
>>   };
>>   
>>   &ehci1 {
>> @@ -93,6 +102,25 @@
>>   	};
>>   };
>>   
>> +&mmc1 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&mmc1_pins_a>;
>> +	vmmc-supply = <&reg_vcc3v3>;
>> +	vqmmc-supply = <&reg_vcc3v3>;
> 
> You don't need vqmmc in this case.
> 
>> +	mmc-pwrseq = <&wifi_pwrseq>;
>> +	bus-width = <4>;
>> +	non-removable;
>> +	status = "okay";
>> +
>> +	ap6212: sdio_wifi@1 {
> 
> You're sure you need a label here?
> 
> Thanks!
> Maxime
> 
