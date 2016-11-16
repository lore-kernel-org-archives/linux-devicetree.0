From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: add documentation for rk1108 cru
Date: Wed, 16 Nov 2016 08:44:42 +0800
Message-ID: <bc11b1a6-1cca-ac3c-f520-618ecc708a05@rock-chips.com>
References: <1479124550-24037-1-git-send-email-andy.yan@rock-chips.com>
 <1479124981-24181-1-git-send-email-andy.yan@rock-chips.com>
 <2131710.LesyKkLYAr@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2131710.LesyKkLYAr@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: shawn.lin@rock-chips.com, mark.rutland@arm.com, devicetree@vger.kernel.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, mturquette@baylibre.com
List-Id: devicetree@vger.kernel.org

On 2016/11/15 17:35, Heiko Stuebner wrote:
> Hi Andy,
>
> Am Montag, 14. November 2016, 20:03:01 CET schrieb Andy Yan:
>> From: Shawn Lin <shawn.lin@rock-chips.com>
>>
>> This adds the dt-binding documentation for the clock and reset unit
>> found on Rockchip rk1108 SoCs.
>>
>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>> ---
>>
>> Changes in v2: None
>>
>>  .../bindings/clock/rockchip,rk1108-cru.txt         | 60
>> ++++++++++++++++++++++ 1 file changed, 60 insertions(+)
>>  create mode 100644
>> Documentation/devicetree/bindings/clock/rockchip,rk1108-cru.txt
>>
>> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk1108-cru.txt
>> b/Documentation/devicetree/bindings/clock/rockchip,rk1108-cru.txt new file
>> mode 100644
>> index 0000000..4d2356b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk1108-cru.txt
>> @@ -0,0 +1,60 @@
>> +* Rockchip RK1108 Clock and Reset Unit
>> +
>> +The RK1108 clock controller generates and supplies clock to various
>> +controllers within the SoC and also implements a reset controller for SoC
>> +peripherals.
>> +
>> +Required Properties:
>> +
>> +- compatible: should be "rockchip,rk1108-cru"
>> +- reg: physical base address of the controller and length of memory mapped
>> +  region.
>> +- #clock-cells: should be 1.
>> +- #reset-cells: should be 1.
>> +
>> +Optional Properties:
>> +
>> +- rockchip,grf: phandle to the syscon managing the "general register files"
>> +  If missing pll rates are not changeable, due to the missing pll lock
>> status. +
>> +Each clock is assigned an identifier and client nodes can use this
>> identifier +to specify the clock which they consume. All available clocks
>> are defined as +preprocessor macros in the dt-bindings/clock/rk1108-cru.h
>> headers and can be +used in device tree sources. Similar macros exist for
>> the reset sources in +these files.
>> +
>> +External clocks:
>> +
>> +There are several clocks that are generated outside the SoC. It is expected
>> +that they are defined using standard clock bindings with following
>> +clock-output-names:
>> + - "xin24m" - crystal input - required,
>> + - "cif_clkout" - output clock for the cif - optional
>> + - "mipi_csi_clkout" - output clock for the mipi csi - optional
>> + - "pclkin_vip" - external VIP clock - optional
>> + - "ext_i2s" - external I2S clock - optional
>> + - "ext_gmac" - external GMAC clock - optional
>> + - "mac_ref_clkout" - output clock of the pll in the mac phy
>
> we really only want to list the actual input clocks here, not outputs.
>
> Also, the list of actual input clocks seems incomplete (hdmiphy, usbphy) and
> some clocks listed here do not match the clock controller 2 patches later
> (pclkin_vip, ext_gmac [rk1108 only has 10/100], ext_i2s, ...)
>

yup, I was just listing the basic clock for Andy to bring up rk1108
board, so some of them was missing here. I will fix them here as well
as adding all of the input clocks in the clock driver. :)

>
> Heiko
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>


-- 
Best Regards
Shawn Lin
