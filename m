From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/2] arm: dts: mt7623: Add SD-card and EMMC to
 bananapi-r2
Date: Mon, 14 Aug 2017 17:18:34 +0200
Message-ID: <f55920be-ff16-9f6f-a3b3-4e4bddda7b12@gmail.com>
References: <1c83eae1944992f7c5a9af946e03bc2c4e62c874.1501819056.git.sean.wang@mediatek.com>
 <1501841664.17551.2.camel@mtkswgap22>
 <9fd98b55-8c71-f697-3a41-bb8b70b7dcf1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9fd98b55-8c71-f697-3a41-bb8b70b7dcf1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 08/04/2017 02:19 PM, Matthias Brugger wrote:
> 
> 
> On 08/04/2017 12:14 PM, Sean Wang wrote:
>> On Fri, 2017-08-04 at 11:59 +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
>>> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>>
>>> The bananapi-r2 board has an SD-card controller and built-in
>>> EMMC storage so enables those devices in the devicetree. Also
>>> cleanup nodes in alphabetical order in the patch.
>>>
>>
>> Hi, Matthias
>>
>> could your help remove those words "Also cleanup nodes in alphabetical
>> order in the patch." when merging, i was forgetting to do it.
>>
>> or prefer wanting me to resend it again?
> 
> Yes I can do that. No need to resend.
> 

Both patches pushed to v4.13-next/dts32 now

Thanks a lot,
Matthias

> Regards,
> Matthias
> 
>>
>>     Sean
>>
>>> Signed-off-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>> ---
>>>   arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 37 +++++++++++++++++++++++++++
>>>   1 file changed, 37 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts 
>>> b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
>>> index 9f3e6dd..444ed93 100644
>>> --- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
>>> +++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
>>> @@ -179,6 +179,32 @@
>>>       status = "okay";
>>>   };
>>> +&mmc0 {
>>> +    pinctrl-names = "default", "state_uhs";
>>> +    pinctrl-0 = <&mmc0_pins_default>;
>>> +    pinctrl-1 = <&mmc0_pins_uhs>;
>>> +    status = "okay";
>>> +    bus-width = <8>;
>>> +    max-frequency = <50000000>;
>>> +    cap-mmc-highspeed;
>>> +    vmmc-supply = <&mt6323_vemc3v3_reg>;
>>> +    vqmmc-supply = <&mt6323_vio18_reg>;
>>> +    non-removable;
>>> +};
>>> +
>>> +&mmc1 {
>>> +    pinctrl-names = "default", "state_uhs";
>>> +    pinctrl-0 = <&mmc1_pins_default>;
>>> +    pinctrl-1 = <&mmc1_pins_uhs>;
>>> +    status = "okay";
>>> +    bus-width = <4>;
>>> +    max-frequency = <50000000>;
>>> +    cap-sd-highspeed;
>>> +    cd-gpios = <&pio 261 0>;
>>> +    vmmc-supply = <&mt6323_vmch_reg>;
>>> +    vqmmc-supply = <&mt6323_vio18_reg>;
>>> +};
>>> +
>>>   &pio {
>>>       cir_pins_a:cir@0 {
>>>           pins_cir {
>>> @@ -314,6 +340,17 @@
>>>               bias-pull-down;
>>>               drive-strength = <MTK_DRIVE_4mA>;
>>>           };
>>> +
>>> +        pins_wp {
>>> +            pinmux = <MT7623_PIN_29_EINT7_FUNC_MSDC1_WP>;
>>> +            input-enable;
>>> +            bias-pull-up;
>>> +        };
>>> +
>>> +        pins_insert {
>>> +            pinmux = <MT7623_PIN_261_MSDC1_INS_FUNC_GPIO261>;
>>> +            bias-pull-up;
>>> +        };
>>>       };
>>>       mmc1_pins_uhs: mmc1 {
>>
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
