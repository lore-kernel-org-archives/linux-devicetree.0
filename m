From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Subject: Re: [PATCH] ARM: dts: rockchip: add ethernet phy node for tinker board
Date: Sat, 22 Jun 2019 23:50:10 +0900
Message-ID: <ccf5ad2c-bd56-2d77-4728-d7906045e302@katsuster.net>
References: <20190621180017.29646-1-katsuhiro@katsuster.net>
 <1871177.hjLhdHVgcu@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1871177.hjLhdHVgcu@phil>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

Current linux-next on my environment, 'ifconfig eth0 up' does not
work correctly with following message...

-----
root@linaro-alip:~# ifconfig eth0 up
[  105.028916] rk_gmac-dwmac ff290000.ethernet eth0: stmmac_open: Cannot 
attach to PHY (error: -19)
SIOCSIFFLAGS: No such device
-----

I checked drivers/net/ethernet/stmicro/stmmac/stmmac_main.c and found
stmmac_init_phy() is going to fail if ethernet device node does not
have following property:
   - phy-handle
   - phy
   - phy-device

I salvaged old version of linux-next kernel (5.2.0-rc1-20190523),
network device of my Tinker Board worked correctly if use it.

I have not bisect commit of root cause yet... Is it better to bisect
and find problem instead of sending this patch?

Best Regards,
---
Katsuhiro Suzuki


On 2019/06/22 17:33, Heiko Stuebner wrote:
> Hi,
> 
> Am Freitag, 21. Juni 2019, 20:00:17 CEST schrieb Katsuhiro Suzuki:
>> This patch adds missing mdio and ethernet PHY nodes for rk3328 ASUS
>> tinker board.
>>
>> Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
> 
> just for my understanding, which problem does this solve?
> Normally the gmac can establish connections just fine on
> the rk3288 by probing the phy in the automatic way.
> 
> And I also don't see any additional properties like phy
> interrupt line below.
> 
> 
> Thanks
> Heiko
> 
>> ---
>>   arch/arm/boot/dts/rk3288-tinker.dtsi | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi b/arch/arm/boot/dts/rk3288-tinker.dtsi
>> index 293576869546..3190817e8d5d 100644
>> --- a/arch/arm/boot/dts/rk3288-tinker.dtsi
>> +++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
>> @@ -117,6 +117,7 @@
>>   	assigned-clocks = <&cru SCLK_MAC>;
>>   	assigned-clock-parents = <&ext_gmac>;
>>   	clock_in_out = "input";
>> +	phy-handle = <&phy0>;
>>   	phy-mode = "rgmii";
>>   	phy-supply = <&vcc33_lan>;
>>   	pinctrl-names = "default";
>> @@ -127,6 +128,17 @@
>>   	tx_delay = <0x30>;
>>   	rx_delay = <0x10>;
>>   	status = "ok";
>> +
>> +	mdio0 {
>> +		compatible = "snps,dwmac-mdio";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		phy0: ethernet-phy@0 {
>> +			compatible = "ethernet-phy-ieee802.3-c22";
>> +			reg = <0>;
>> +		};
>> +	};
>>   };
>>   
>>   &gpu {
>>
> 
> 
> 
> 
> 
