From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v1 02/12] dt-bindings: phy: Add support for HiSilicon's
 hi3660 USB PHY
Date: Thu, 20 Dec 2018 09:52:02 +0800
Message-ID: <3b7cef2e-b39a-b410-dfb5-395da6f24efd@huawei.com>
References: <20181203034515.91412-1-chenyu56@huawei.com>
 <20181203034515.91412-3-chenyu56@huawei.com> <20181219141419.GA17302@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181219141419.GA17302@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: liuyu712@hisilicon.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, Mark Rutland <mark.rutland@arm.com>, John Stultz <john.stultz@linaro.org>, Binghui Wang <wangbinghui@hisilicon.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 2018/12/19 22:14, Rob Herring wrote:
> On Mon, Dec 03, 2018 at 11:45:05AM +0800, Yu Chen wrote:
>> This patch adds binding documentation for supporting the hi3660 usb
>> phy on boards like the HiKey960.
>>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: John Stultz <john.stultz@linaro.org>
>> Cc: Binghui Wang <wangbinghui@hisilicon.com>
>> Signed-off-by: Yu Chen <chenyu56@huawei.com>
>> --
>> v1: Fix some format error as suggested by Rob.
>> --
>> ---
>>  .../devicetree/bindings/phy/phy-hi3660-usb3.txt     | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt b/Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt
>> new file mode 100644
>> index 000000000000..8ea52d51aa13
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt
>> @@ -0,0 +1,21 @@
>> +Hisilicon hi3660 usb PHY
> 
> s/usb/USB/

OK.
> 
>> +-----------------------
>> +
>> +Required properties:
>> +- compatible: should be "hisilicon,hi3660-usb-phy"
>> +- #phy-cells: must be 0
>> +- hisilicon,pericrg-syscon: phandle of syscon used to control phy.
>> +- hisilicon,pctrl-syscon: phandle of syscon used to control phy.
>> +- hisilicon,usb3-otg-bc-syscon: phandle of syscon used to control phy.
>> +- hisilicon,eye-diagram-param: parameter set for phy
>> +Refer to phy/phy-bindings.txt for the generic PHY binding properties
> 
> Doesn't a phy need some clocks?
> 
Yes, the clocks of USB phy currently is enabled by config the
pctrl-syscon registers and pericrg-syscon.
>> +
>> +Example:
>> +	usb-phy {
>> +		compatible = "hisilicon,hi3660-usb-phy";
>> +		#phy-cells = <0>;
>> +		hisilicon,pericrg-syscon = <&crg_ctrl>;
>> +		hisilicon,pctrl-syscon = <&pctrl>;
>> +		hisilicon,usb3-otg-bc-syscon = <&usb3_otg_bc>;
> 
> Is one of these the "main" registers for the phy? If so, then make this 
> a child of that syscon node.
> 
Ok, the usb3-otg-bc-syscon is the "main" registers for the phy.

>> +		hisilicon,eye-diagram-param = <0x22466e4>;
>> +	};
>> -- 
>> 2.15.0-rc2
>>
> 
> .
> 
