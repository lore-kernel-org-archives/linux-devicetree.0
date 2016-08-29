From: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: add eMMC's power domain support
 for rk3399
Date: Mon, 29 Aug 2016 09:58:42 +0800
Message-ID: <57C396D2.4090607@rock-chips.com>
References: <20160827134103.28160-1-xzy.xu@rock-chips.com>
 <20160827134103.28160-3-xzy.xu@rock-chips.com>
 <2ab8ab94-fa4d-2cd6-5805-a92ac5f9697e@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <2ab8ab94-fa4d-2cd6-5805-a92ac5f9697e-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Ziyuan Xu <xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 08/27/2016 11:05 PM, Shawn Lin wrote:
> On 2016/8/27 21:41, Ziyuan Xu wrote:
>> Control power domain for eMMC via genpd to reduce power consumption.
>>
>> Signed-off-by: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> Signed-off-by: Ziyuan Xu <xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>
> It looks nice to me. But this should be merged after applying that[0]
> as your patch will break bind/unbind test for sdhci-of-arasan on rk3399
> without it[0]. Moreover, Elaine should make sure that upstreamed
> rockchip power domain stuff would not off pd for emmc, *otherwise*, I
> should update my patch to make sure we update clkmul every time when
> doing suspend 2 resume..
>
It looks nice to me. I was going on to submit with other Pds.

>
>
> [0]: https://patchwork.kernel.org/patch/9300971/
>
>> ---
>>
>>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> index 32aebc8..71733d4 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> @@ -239,6 +239,7 @@
>>          #clock-cells = <0>;
>>          phys = <&emmc_phy>;
>>          phy-names = "phy_arasan";
>> +        power-domains = <&power RK3399_PD_EMMC>;
>>          status = "disabled";
>>      };
>>
>> @@ -611,6 +612,11 @@
>>          status = "disabled";
>>      };
>>
>> +    qos_emmc: qos@ffa58000 {
>> +        compatible = "syscon";
>> +        reg = <0x0 0xffa58000 0x0 0x20>;
>> +    };
>> +
>>      qos_hdcp: qos@ffa90000 {
>>          compatible = "syscon";
>>          reg = <0x0 0xffa90000 0x0 0x20>;
>> @@ -739,6 +745,11 @@
>>              };
>>
>>              /* These power domains are grouped by VD_LOGIC */
>> +            pd_emmc@RK3399_PD_EMMC {
>> +                reg = <RK3399_PD_EMMC>;
>> +                clocks = <&cru ACLK_EMMC>;
>> +                pm_qos = <&qos_emmc>;
>> +            };
>>              pd_vio@RK3399_PD_VIO {
>>                  reg = <RK3399_PD_VIO>;
>>                  #address-cells = <1>;
>>
>
>
