From: Chris Zhong <zyw@rock-chips.com>
Subject: Re: [v2 PATCH 1/4] Documentation: bindings: add dt doc for Rockchip
 USB Type-C PHY
Date: Thu, 16 Jun 2016 08:31:11 +0800
Message-ID: <5761F34F.8040202@rock-chips.com>
References: <1465810789-22303-1-git-send-email-zyw@rock-chips.com>
 <1465810789-22303-2-git-send-email-zyw@rock-chips.com>
 <2262175.XUeGlE1YsE@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2262175.XUeGlE1YsE@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: dianders@chromium.org, tfiga@chromium.org, yzq@rock-chips.com, groeck@chromium.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Heiko

On 06/16/2016 06:11 AM, Heiko Stuebner wrote:
> Am Montag, 13. Juni 2016, 17:39:46 schrieb Chris Zhong:
>> This patch adds a binding that describes the Rockchip USB Type-C PHY
>> for rk3399
>>
>> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
>>
>> ---
>>
>> Changes in v2:
>> - add some registers description
>>
>> Changes in v1:
>> - add extcon node description
>> - move the registers in phy driver
>> - remove the suffix of reset
>>
>>   .../devicetree/bindings/phy/phy-rockchip-typec.txt | 77
>> ++++++++++++++++++++++ 1 file changed, 77 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
>> b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt new file
>> mode 100644
>> index 0000000..430920c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
>> @@ -0,0 +1,77 @@
>> +* ROCKCHIP type-c PHY
>> +---------------------
>> +
>> +Required properties:
>> + - compatible : should be "rockchip,rk3399-typec-phy0" or
>> +			 "rockchip,rk3399-typec-phy1"
>> + - reg: Address and length of the usb phy control register set
>> + - rockchip,grf : phandle to the syscon managing the "general
>> +   register files"
>> + - clocks : phandle + clock specifier for the phy clocks
>> + - clock-names : string, clock name, must be "tcpdcore", "tcpdphy_ref";
>> + - resets : a list of phandle + reset specifier pairs
>> + - reset-names : string reset name, must be:
>> +		 "tcphy", "tcphy_pipe", "uphy_tcphy"
>> + - #phy-cells : Must be 0.  See ./phy-bindings.txt for details.
>> + - extcon : extcon specifier for the Power Delivery
>> +
>> +Note, there are 2 type-c phys for RK3399, and they are almost identical,
>> except +these registers(description below), every register node contains
>> 3 sections: +offset, enable bit, write mask bit.
>> + - rockchip,typec_conn_dir : the register of type-c connector direction,
>> +   for type-c phy0, it must be <0xe580 0 16>;
>> +   for type-c phy1, it must be <0xe58c 0 16>;
> I think I said this already, but these register-lists would be much happier
> being defined inside the driver - see how Frank managed this on his usb2phy
> please.
>
> Heiko
>
Yes, I move them into driver in v1 patch, but Rob Herring and Guenter 
Roeck recommend to put them back to dts.
These phy0 and phy1 are exactly the same, except these grf registers.



>
