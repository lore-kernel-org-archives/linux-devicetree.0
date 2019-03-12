From: =?utf-8?Q?Christoph_M=C3=BCllner?=
        <christoph.muellner@theobroma-systems.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: Add a new property
 drive-impedance-ohm for RK's emmc PHY
Date: Tue, 12 Mar 2019 14:01:42 +0100
Message-ID: <1C73976A-9039-4F7B-959A-4A1E1840EF68@theobroma-systems.com>
References: <20190307084159.25236-1-christoph.muellner@theobroma-systems.com>
 <20190307084159.25236-2-christoph.muellner@theobroma-systems.com>
 <1924357.CMCVK5N5Qd@phil>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1924357.CMCVK5N5Qd@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawn.lin@rock-chips.com, Philipp Tomsich <philipp.tomsich@theobroma-systems.com>, Kishon Vijay Abraham I <kishon@ti.com>, Brian Norris <briannorris@chromium.org>, Klaus Goger <klaus.goger@theobroma-systems.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Douglas Anderson <dianders@chromium.org>, Viresh Kumar <viresh.kumar@linaro.org>, Ezequiel Garcia <ezequiel@collabora.com>, Lin Huang <hl@rock-chips.com>, Randy Li <ayaka@soulik.info>, Tony Xie <tony.xie@rock-chips.com>, Vicente Bergas <vicencb@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org


> On 12.03.2019, at 13:52, Heiko Stuebner <heiko@sntech.de> wrote:
> 
> Hi Christoph,
> 
> Am Donnerstag, 7. März 2019, 09:41:54 CET schrieb Christoph Muellner:
>> This patch documents the new proprty drive-impedance-ohm for
>> Rockchip's eMMC PHY node.
>> 
>> Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
>> Signed-off-by: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>
>> ---
>> Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt | 3 +++
>> 1 file changed, 3 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
>> index e3ea55763b0a..5f5d999dacc3 100644
>> --- a/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
>> +++ b/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
>> @@ -13,6 +13,9 @@ specified by name:
> 
> you might want to adapt the section headline as well, as right now it
> talks about "Optional clocks", but should likely become the generic
> "Optional properties" as in other bindings (including moving the clock-
> binding.txt reference down into the clock elements)

Thank's for spotting this.
Will do for v3.

Thanks,
Christoph

> 
> 
> Heiko
> 
>> 		(because most boards can get basic functionality without having
>> 		access to it), it is strongly suggested.
>>  - clocks: Should have a phandle to the card clock exported by the SDHCI driver.
>> + - drive-impedance-ohm: Specifies the drive impedance in Ohm.
>> +                        Possible values are 33, 40, 50, 66 and 100.
>> +                        If not set, the default value of 50 will be applied.
>> 
>> Example:
>> 
>> 
> 
> 
> 
> 
