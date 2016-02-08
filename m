From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [linux-sunxi][PATCH] ARM: dts: sun7i: Enable USB DRC on Olimex
 A20 EVB
Date: Mon, 8 Feb 2016 17:10:19 +0100
Message-ID: <CAEKpxBnkFgfaK43f0EKQnxmCVq9Kh-_MBWSa68ZCmcRdk=ZdJA@mail.gmail.com>
References: <1454945387-29424-1-git-send-email-codekipper@gmail.com>
	<56B8B7A1.5020800@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B8B7A1.5020800-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 8 February 2016 at 16:43, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
> On 08-02-16 16:29, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>>
>> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Enable the otg/drc usb controller on the Olimex A20 EVB.
>
>
> Does the A20 EVB not have some form of Vbus detect for the OTG
> port hooked up ? That does not sound right. Please double check.
Yeah...looks like it does...PH5. I'll add that and test.
CK
>
> Regards,
>
> Hans
>
>
>
>>
>> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts | 24
>> ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
>> b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
>> index c3c626b..93bbf26 100644
>> --- a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
>> +++ b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
>> @@ -198,6 +198,10 @@
>>         status = "okay";
>>   };
>>
>> +&otg_sram {
>> +       status = "okay";
>> +};
>> +
>>   &pio {
>>         ahci_pwr_pin_olimex_som_evb: ahci_pwr_pin@1 {
>>                 allwinner,pins = "PC3";
>> @@ -219,6 +223,13 @@
>>                 allwinner,drive = <SUN4I_PINCTRL_10_MA>;
>>                 allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
>>         };
>> +
>> +       usb0_id_detect_pin: usb0_id_detect_pin@0 {
>> +               allwinner,pins = "PH4";
>> +               allwinner,function = "gpio_in";
>> +               allwinner,drive = <SUN4I_PINCTRL_10_MA>;
>> +               allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>> +       };
>>   };
>>
>>   &reg_ahci_5v {
>> @@ -254,6 +265,10 @@
>>         regulator-name = "avcc";
>>   };
>>
>> +&reg_usb0_vbus {
>> +       status = "okay";
>> +};
>> +
>>   &reg_usb1_vbus {
>>         status = "okay";
>>   };
>> @@ -268,7 +283,16 @@
>>         status = "okay";
>>   };
>>
>> +&usb_otg {
>> +       dr_mode = "otg";
>> +       status = "okay";
>> +};
>> +
>>   &usbphy {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&usb0_id_detect_pin>;
>> +       usb0_id_det-gpios = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH04 */
>> +       usb0_vbus-supply = <&reg_usb0_vbus>;
>>         usb1_vbus-supply = <&reg_usb1_vbus>;
>>         usb2_vbus-supply = <&reg_usb2_vbus>;
>>         status = "okay";
>>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
