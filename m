From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: dts: sun8i-h3-orangepi-plus:
 Enable USB host controllers
Date: Tue, 24 Nov 2015 09:50:01 +0100
Message-ID: <565424B9.5010601@redhat.com>
References: <1447616777-24660-1-git-send-email-hdegoede@redhat.com>
 <1447616777-24660-5-git-send-email-hdegoede@redhat.com>
 <CAGb2v669Cu6+G=P8yH-g5KbOsWTHBgnYUYf2fGt+jKXbqVAKfQ@mail.gmail.com>
 <56498FA8.3050908@redhat.com> <564B51D7.7090500@gmail.com>
 <fff9e78a-e23e-4226-9cec-67550bf09efb@googlegroups.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBRGJ2CZAKGQEBQJ4BDI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <fff9e78a-e23e-4226-9cec-67550bf09efb-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Troy Dack <troy-yfroEPzt3eC6c6uEtOJ/EA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org, patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 23-11-15 23:20, Troy Dack wrote:
>
>
> On Wednesday, 18 November 2015 03:12:11 UTC+11, Jens Kuske wrote:
>>
>> Enable the 2 USB host controllers used on the Orange Pi Plus
>> and add the necessary regulators.
>>
>> Signed-off-by: Reinder de Haan <patch...-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org <javascript:>>
>> Signed-off-by: Hans de Goede <hdeg...-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org <javascript:>>
>> Signed-off-by: Jens Kuske <jens...-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <javascript:>>
>> ---
>>
>> Hi Hans,
>>
>> with these regulators USB works on the Orange Pi Plus too.
>> I don't know if adding the regulators in the dts is okay, since most
>> regulators are defined in the sunxi-common-regulators.dtsi, but
>> we use different pins.
>>
>> Jens
>>
>>
>>   arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts | 44
>> ++++++++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
>> b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
>> index e67df59..1cb6c66 100644
>> --- a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
>> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
>> @@ -58,6 +58,35 @@
>>           chosen {
>>                   stdout-path = "serial0:115200n8";
>>           };
>> +
>> +        reg_usb3_vbus: usb3-vbus {
>> +                compatible = "regulator-fixed";
>> +                pinctrl-names = "default";
>> +                pinctrl-0 = <&usb3_vbus_pin_a>;
>> +                regulator-name = "usb3-vbus";
>> +                regulator-min-microvolt = <5000000>;
>> +                regulator-max-microvolt = <5000000>;
>> +                regulator-boot-on;
>> +                enable-active-high;
>> +                gpio = <&pio 6 11 GPIO_ACTIVE_HIGH>;
>> +        };
>> +};
>> +
>> +&ehci1 {
>> +        status = "okay";
>> +};
>> +
>> +&ehci3 {
>> +        status = "okay";
>> +};
>> +
>> +&pio {
>> +        usb3_vbus_pin_a: usb3_vbus_pin@0 {
>> +                allwinner,pins = "PG11";
>> +                allwinner,function = "gpio_out";
>> +                allwinner,drive = <SUN4I_PINCTRL_10_MA>;
>> +                allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>> +        };
>>   };
>>
>>   &mmc0 {
>> @@ -70,8 +99,23 @@
>>           status = "okay";
>>   };
>>
>> +&reg_usb1_vbus {
>> +        gpio = <&pio 6 13 GPIO_ACTIVE_HIGH>;
>> +        status = "okay";
>> +};
>> +
>>   &uart0 {
>>           pinctrl-names = "default";
>>           pinctrl-0 = <&uart0_pins_a>;
>>           status = "okay";
>>   };
>> +
>> +&usb1_vbus_pin_a {
>> +        allwinner,pins = "PG13";
>> +};
>> +
>> +&usbphy {
>> +        usb1_vbus-supply = <&reg_usb1_vbus>;
>> +        usb3_vbus-supply = <&reg_usb3_vbus>;
>> +        status = "okay";
>> +};
>>
>
> I've been trying to test these patches by using Hans' github sunxi-wip
> branches of the kernel and U-Boot.
>
> U-Boot at commit 7e17fd2 "suxni: Add support for Orangepi Plus and Orangepi
> PC boards"
> Kernel at commit cb45b8  "ARM: dts: sun8i-h3-orangepi-plus: Enable USB host
> controllers"
>
> Both have been built using the default defconfig for an OrangePi Plus
>
> U-Boot starts and successfully boots the kernel, but the kernel does not
> appear to boot fully and hangs at:
>
> [    0.861175] cpu cpu0: failed to get cpu0 clock: -2
> [    0.865973] cpufreq-dt: probe of cpufreq-dt failed with error -2
> [    0.872017] Registering SWP/SWPB emulation handler
>
> Full boot log: http://pastebin.com/VGkEix9p
>
> Building the kernel (or just using a dab) with the dts from commit 0a8c01
> "ARM: dts: sun8i: Add Orange Pi Plus support" results in the kernel booting
> fully to a login prompt.  Of course without enabled/working USB.
>
> There is a fair chance I've done something wrong that is causing this.  Any
> advice on how to get a bootable kernel?

Weird, are you sure you updated both the dtb and [u|z]image at the same time ?

I'm using this kernel config:
https://fedorapeople.org/~jwrdegoede/kernel-driver-programming/kernel-config

With that everything you need is builtin, no need to build modules.

Regards,

Hans
