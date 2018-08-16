From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH 2/4] dt-bindings: phy-rockchip-inno-usb2: add
 documentation for extcon and utmi-avalid properties.
Date: Thu, 16 Aug 2018 10:38:13 +0200
Message-ID: <a71af5b8-cdc1-cf26-8c01-beb523e7c332@collabora.com>
References: <20180815095934.11205-1-enric.balletbo@collabora.com>
 <20180815095934.11205-3-enric.balletbo@collabora.com>
 <20180815222157.GA8193@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180815222157.GA8193@rob-hp-laptop>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, amstan@chromium.org, groeck@google.com, kieran.bingham@ideasonboard.com, kernel@collabora.com, bleung@chromium.org, heiko@sntech.de, devicetree@vger.kernel.org, Frank Wang <frank.wang@rock-chips.com>, linux-rockchip@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 16/08/18 00:21, Rob Herring wrote:
> On Wed, Aug 15, 2018 at 11:59:32AM +0200, Enric Balletbo i Serra wrote:
>> Commit 98898f3bc83c8 ("phy: rockchip-inno-usb2: support otg-port for
>> rk3399") introduces two new properties. The extcon property is used to
>> detect the cable-state, and the rockchip,utmi-avalid is used to indicate
>> which register should be used to detect the vbus state.
>>
>> Document these properties in the documentation binding.
>>
>> Fixes: 98898f3bc83c8 ("phy: rockchip-inno-usb2: support otg-port for rk3399")
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>>
>>  .../devicetree/bindings/phy/phy-rockchip-inno-usb2.txt         | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
>> index 074a7b3b0425..2d4808d3920b 100644
>> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
>> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
>> @@ -23,6 +23,7 @@ Optional properties:
>>  		 register files". When set driver will request its
>>  		 phandle as one companion-grf for some special SoCs
>>  		 (e.g RV1108).
>> + - extcon : phandle to the extcon device for the otg phy.
> 
> extcon is not a good binding. The usb connector binding should be used 
> instead for new users.
> 

Ok, although the extcon thing is implemented in the driver, so I was trying to
just describe how is implemented now, looks like nobody is using it apart from
me (patches not upstreamed yet). I suppose switch to the usb connector binding
will imply some driver modifications. I will take a look.

Thanks,
 Enric

> Rob
> 
