From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH 03/10] dt-bindings: misc: Add bindings for HiSilicon usb
 hub and data role switch functionality on HiKey960
Date: Mon, 29 Oct 2018 20:25:09 +0800
Message-ID: <644437e0-fa67-e3c5-ed57-48ae9f10b046@huawei.com>
References: <20181027095820.40056-1-chenyu56@huawei.com>
 <20181027095820.40056-4-chenyu56@huawei.com>
 <4872a689-bfdd-a8c1-f2cf-a2bba9e91fa9@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4872a689-bfdd-a8c1-f2cf-a2bba9e91fa9@cogentembedded.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: wangbinghui@hisilicon.com, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org



On 2018/10/28 2:06, Sergei Shtylyov wrote:
> On 27.10.2018 12:58, Yu Chen wrote:
>
>> This patch adds binding documentation to support usb hub and usb
>> data role switch of Hisilicon HiKey&HiKey960 Board.
>>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: John Stultz <john.stultz@linaro.org>
>> Cc: Binghui Wang <wangbinghui@hisilicon.com>
>> Signed-off-by: Yu Chen <chenyu56@huawei.com>
>> ---
>>  .../bindings/misc/hisilicon-hikey-usb.txt          | 24 ++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
>>
>> diff --git a/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
>> new file mode 100644
>> index 000000000000..f94e990362c9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
>> @@ -0,0 +1,24 @@
>> +Support usb hub and usb data role switch of Hisilicon HiKey&HiKey960 Board.
>> +
>> +-----------------------------
>> +
>> +Required properties:
>> +- compatible: "hisilicon,gpio_hubv1","hisilicon,hikey960_usb"
>> +- typc_vbus_int_gpio,typec-gpios: gpio to control the vbus of typeC port
>> +- typc_vbus_enable_val: gpio value that enable the vbus of typeC port
>
>    The part of the prop name preceding the comma is supposed to be vendor prefix.
> Also hyphens are preferred to underscores.

I will fix the name of properties. Thanks!


>
>> +- otg_gpio: gpio to switch DP&DM between the hub and typeC port
>> +- hub_vdd33_en_gpio: gpio to enable the power of hub
>> +- pinctrl-0: pinctrl config
> [...]
>
> MBR, Sergei
>
>
>
> .
>
