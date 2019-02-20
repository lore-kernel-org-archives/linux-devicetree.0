From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: misc: Add bindings for HiSilicon
 usb hub and data role switch functionality on HiKey960
Date: Wed, 20 Feb 2019 10:34:16 +0800
Message-ID: <8c217714-381c-f449-4f9e-d398c260a916@huawei.com>
References: <20190218112310.17860-1-chenyu56@huawei.com>
 <20190218112310.17860-3-chenyu56@huawei.com>
 <22270fce-602e-d9fd-0416-58bfecc40b07@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <22270fce-602e-d9fd-0416-58bfecc40b07@cogentembedded.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: liuyu712@hisilicon.com, john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Binghui Wang <wangbinghui@hisilicon.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 2019/2/19 16:25, Sergei Shtylyov wrote:
> Hello!
> 
> On 18.02.2019 14:23, Yu Chen wrote:
> 
>> This patch adds binding documentation to support usb hub and usb
>> data role switch of Hisilicon HiKey960 Board.
>>
>> Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: John Stultz <john.stultz@linaro.org>
>> Cc: Binghui Wang <wangbinghui@hisilicon.com>
>> Signed-off-by: Yu Chen <chenyu56@huawei.com>
>> ---
>> v1:
>> * Fix some format errors as suggested by Sergei.
>> * Modify gpio description to use gpiod API.
>> v2:
>> * Remove information about Hikey.
>> * Fix gpio description.
>> * Remove device_type of endpoint.
>> ---
>> ---
>>   .../bindings/misc/hisilicon-hikey-usb.txt          | 35 ++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
>>
>> diff --git a/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
>> new file mode 100644
>> index 000000000000..c2b789b515df
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
>> @@ -0,0 +1,35 @@
>> +Support usb hub and usb data role switch of Hisilicon HiKey960 Board.
>> +
>> +-----------------------------
>> +
>> +Required properties:
>> +- compatible: "hisilicon,gpio-hubv1","hisilicon,hikey960-usb"
> 
>    Only one of those, looking at your example?
"hisilicon,gpio-hubv1" is similar as "hisilicon,hikey960-usb".

>    Need a space after comma, BTW.
OK. Thanks!

> 
>> +- typec-vbus-gpios: gpio to control the vbus of typeC port
>> +- typec-vbus-enable-val: gpio value that enable the vbus of typeC port
> 
>    Hm, I thought that can be inferred from the GPIO specifier above...
> 
OK. Thanks!

>> +- otg-switch-gpios: gpio to switch DP & DM between the hub and typeC port
>> +- hub-vdd33-en-gpios: gpio to enable the power of hub
>> +- pinctrl-0: pinctrl config
> 
>    You forgot about "pinctrl-names"...
OK. Thanks!

> 
>> +
>> +Example
>> +-----
>> +
>> +    hisi_hikey_usb: hisi_hikey_usb {
>> +        compatible = "hisilicon,hikey960-usb";
>> +        typec-vbus-gpios = <&gpio25 2 0>;
>> +        typec-vbus-enable-val = <1>;
>> +        otg-switch-gpios = <&gpio25 6 0>;
>> +        hub-vdd33-en-gpios = <&gpio5 6 0>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&usbhub5734_pmx_func>;
>> +
>> +        port {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            hikey_usb_ep: endpoint@0 {
>> +                reg = <0>;
>> +                remote-endpoint = <&dwc3_role_switch_notify>;
>> +            };
>> +        };
>> +
>> +    };
> 
> MBR, Sergei
> 
> .
> 

Thanks
Yu Chen
