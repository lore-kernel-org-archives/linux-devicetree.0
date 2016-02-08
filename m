From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Enable USB DRC on Itead Ibox
Date: Mon, 8 Feb 2016 17:56:06 +0100
Message-ID: <CAEKpxBkXp9hx6KWpWyRBvYBFi7Sr0FgFHrD6M0nSBuJ1bV++1A@mail.gmail.com>
References: <1454947167-12236-1-git-send-email-codekipper@gmail.com>
	<56B8BED7.9030704@redhat.com>
Reply-To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCHNXO4F7MHBBJUR4O2QKGQEUMYDWBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <56B8BED7.9030704-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 8 February 2016 at 17:14, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
> On 08-02-16 16:59, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>>
>> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Enable the otg/drc usb controller on the Itead Ibox device.
>>
>> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
>
> Same remark as with your Olimex A20 EVB board patch, please
> also provide a vbus detect pin setting. If for some reason the
> VBus detect is not wired up, or not working properly, please mention
> this explicitly in the commit message.
Hi Hans,
I've added vbus detect and it no longer works. It's mentioned that the
Itead Ibox is similar to the Cubieboard 2 which also doesn't include
the detect. I can see now in the commit that it states "Note this
board has the otg-vbus connected directly to the 5v-dcc of the board,
so there is no vbus0 regulator, nor vbus0-det.", I will add this to
the commit message and try and dig out a schematic to confirm.
Thanks,
CK
>
> Note that in some cases the axp209 is used for vbus detect,
> rather then a gpio, see e.g. :
>
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/arch/arm/boot/dts/sun7i-a20-bananapi.dts?id=dcfd8443d89f593e0c667a988ab017e716b33061
>
> Regards,
>
> Hans
>
>
>
>
>> ---
>>   arch/arm/boot/dts/sun7i-a20-itead-ibox.dts     | 14 ++++++++++++++
>>   arch/arm/boot/dts/sunxi-itead-core-common.dtsi |  9 +++++++++
>>   2 files changed, 23 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
>> b/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
>> index 661c21d..a512581 100644
>> --- a/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
>> +++ b/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
>> @@ -118,8 +118,22 @@
>>                 allwinner,drive = <SUN4I_PINCTRL_20_MA>;
>>                 allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
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
>>         status = "okay";
>>   };
>> +
>> +&usbphy {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&usb0_id_detect_pin>;
>> +       usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
>> +       status = "okay";
>> +};
>> diff --git a/arch/arm/boot/dts/sunxi-itead-core-common.dtsi
>> b/arch/arm/boot/dts/sunxi-itead-core-common.dtsi
>> index 2565d51..d22eea3 100644
>> --- a/arch/arm/boot/dts/sunxi-itead-core-common.dtsi
>> +++ b/arch/arm/boot/dts/sunxi-itead-core-common.dtsi
>> @@ -88,6 +88,10 @@
>>         status = "okay";
>>   };
>>
>> +&otg_sram {
>> +       status = "okay";
>> +};
>> +
>>   #include "axp209.dtsi"
>>
>>   &reg_dcdc2 {
>> @@ -129,6 +133,11 @@
>>         status = "okay";
>>   };
>>
>> +&usb_otg {
>> +       dr_mode = "otg";
>> +       status = "okay";
>> +};
>> +
>>   &usbphy {
>>         usb1_vbus-supply = <&reg_usb1_vbus>;
>>         usb2_vbus-supply = <&reg_usb2_vbus>;
>>
>
