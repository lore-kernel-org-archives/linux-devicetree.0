From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v8 3/3] arm64: dts: rockchip: add usb2-phy support for
 rk3399
Date: Thu, 21 Jul 2016 10:49:53 +0800
Message-ID: <d01e6b5c-8e7a-bcba-477b-cfe3a9088964@rock-chips.com>
References: <1468913311-23977-1-git-send-email-frank.wang@rock-chips.com>
 <CAD=FV=Wc0RdgpfzWhEVsrQhj5Pjf4RF3a81mZKaZfpZS41ce5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=Wc0RdgpfzWhEVsrQhj5Pjf4RF3a81mZKaZfpZS41ce5g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ziyuan Xu <xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?B?5ZC06Imv5bOw?= <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Doug,

On 2016/7/21 5:33, Doug Anderson wrote:
> Hi,
>
> On Tue, Jul 19, 2016 at 12:28 AM, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>
> You need a patch description here, even for simple patches.  All you
> have now is a subject.
>

OK, I will describe it next version.

>> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3399-evb.dts |   19 +++++++++++
>>   arch/arm64/boot/dts/rockchip/rk3399.dtsi    |   47 ++++++++++++++++++++++++++-
> Personally I'd prefer to see EVB in a separate patch.
>

Yep, I would like to separate them :-) .

>>   2 files changed, 65 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
>> index 1a3eb14..31d4828 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
>> @@ -69,6 +69,15 @@
>>                  regulator-max-microvolt = <3300000>;
>>          };
>>
>> +       vbus_host: vbus-host-regulator {
>> +               compatible = "regulator-fixed";
>> +               enable-active-high;
>> +               gpio = <&gpio4 25 GPIO_ACTIVE_HIGH>;
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&host_vbus_drv>;
>> +               regulator-name = "vbus_host";
>> +       };
>> +
> To match my schematics, this would probably be "vcc5v0_host".
> Technically there are two regulators but since they are the same
> voltage and enabled by the same GPIO it seems like modeling it as one
> regulator is fine.

Yep, you are right, I will rename it.

> If you really wanted to model things you could also include the input
> supply (VCC5V0_SYS).  Not sure how much you care to model in EVB.
>

Actually, from 
"Documentation/devicetree/bindings/regulator/fixed-regulator.txt" show, 
input supply name is just optional property, and it seems that only do 
assign "vin" value for input_supply (the second member of struct 
fixed_voltage_config) if "vin-supply" is specified.

So is input supply name  (VCC5V0_SYS) required here? Would you like to 
give more comments please?

>>          vcc_phy: vcc-phy-regulator {
>>                  compatible = "regulator-fixed";
>>                  regulator-name = "vcc_phy";
>> @@ -93,6 +102,16 @@
>>          status = "okay";
>>   };
>>
>> +&u2phy0_host {
>> +       phy-supply = <&vbus_host>;
>> +       status = "okay";
>> +};
>> +
>> +&u2phy1_host {
>> +       phy-supply = <&vbus_host>;
>> +       status = "okay";
>> +};
>> +
> Technically "u2" sorts alphabetically before "uart".
>

Well, It will be sorted next version.

>>   &usb_host0_ehci {
>>          status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> index d7f8e06..0383785 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> @@ -221,6 +221,8 @@
>>                  interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
>>                  clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>;
>>                  clock-names = "hclk_host0", "hclk_host0_arb";
>> +               phys = <&u2phy0_host>;
>> +               phy-names = "u2phy0";
> This is wrong.  From
> "Documentation/devicetree/bindings/usb/usb-ehci.txt" phy-names should
> be "usb".

done.

>>                  status = "disabled";
>>          };
>>
>> @@ -239,6 +241,8 @@
>>                  interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
>>                  clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST1_ARB>;
>>                  clock-names = "hclk_host1", "hclk_host1_arb";
>> +               phys = <&u2phy1_host>;
>> +               phy-names = "u2phy1";
> This is wrong.  From
> "Documentation/devicetree/bindings/usb/usb-ehci.txt" phy-names should
> be "usb".

done

>>                  status = "disabled";
>>          };
>>
>> @@ -481,8 +485,42 @@
>>          };
>>
>>          grf: syscon@ff770000 {
>> -               compatible = "rockchip,rk3399-grf", "syscon";
>> +               compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
>>                  reg = <0x0 0xff770000 0x0 0x10000>;
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +
>> +               u2phy0: usb2-phy@e450 {
>> +                       compatible = "rockchip,rk3399-usb2phy";
>> +                       reg = <0xe450 0x10>;
>> +                       clocks = <&cru SCLK_USB2PHY0_REF>;
>> +                       clock-names = "phyclk";
>> +                       #clock-cells = <0>;
>> +                       clock-output-names = "clk_usbphy0_480m";
> Any reason why there isn't a 'status = "disabled";' here?
>

Refer to some explains from Heiko in another mail which sent at 6:07 AM 
on 21th July,  anyway, I will add ' status = "disabled" ' property next 
version.

>> +                       u2phy0_host: host-port {
>> +                               #phy-cells = <0>;
>> +                               interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
>> +                               interrupt-names = "linestate";
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               u2phy1: usb2-phy@e460 {
>> +                       compatible = "rockchip,rk3399-usb2phy";
>> +                       reg = <0xe460 0x10>;
>> +                       clocks = <&cru SCLK_USB2PHY1_REF>;
>> +                       clock-names = "phyclk";
>> +                       #clock-cells = <0>;
>> +                       clock-output-names = "clk_usbphy1_480m";
>> +
>> +                       u2phy1_host: host-port {
>> +                               #phy-cells = <0>;
>> +                               interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
>> +                               interrupt-names = "linestate";
>> +                               status = "disabled";
>> +                       };
>> +               };
>>          };
>>
>>          watchdog@ff840000 {
>> @@ -1009,5 +1047,12 @@
>>                                          <1 14 RK_FUNC_1 &pcfg_pull_none>;
>>                          };
>>                  };
>> +
>> +               usb2 {
>> +                       host_vbus_drv: host-vbus-drv {
>> +                               rockchip,pins =
>> +                                       <4 25 RK_FUNC_GPIO &pcfg_pull_none>;
>> +                       };
>> +               };
> Are you certain this belongs in rk3399.dtsi?  It seems like it should
> be in the EVB file.
>

All right, It will be moved to EVB file next version.

BR.
Frank


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
