From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v4 1/2] arm64: dts: rockchip: add "rockchip, grf" property
 for RK3399 PMUCRU/CRU
Date: Wed, 11 Jan 2017 09:04:24 +0800
Message-ID: <58758498.40309@rock-chips.com>
References: <1484028930-20305-1-git-send-email-zhengxing@rock-chips.com>
 <1484028930-20305-2-git-send-email-zhengxing@rock-chips.com>
 <CAD=FV=Wwu3q_LqwYUWcJQRvp5neVOS9szgsYFONWTRJ0X8hRTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=Wwu3q_LqwYUWcJQRvp5neVOS9szgsYFONWTRJ0X8hRTA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Doug,

On 2017年01月11日 02:45, Doug Anderson wrote:
> Hi,
>
> On Mon, Jan 9, 2017 at 10:15 PM, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>> The structure rockchip_clk_provider needs to refer the GRF regmap
>> in somewhere, if the CRU node has not "rockchip,grf" property,
>> calling syscon_regmap_lookup_by_phandle will return an invalid GRF
>> regmap, and the MUXGRF type clock will be not supported.
>>
>> Therefore, we need to add them.
>>
>> Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>
>> Changes in v4:
>> - separte the binding patch
>>
>> Changes in v3:
>> - add optional roperty rockchip,grf in rockchip,rk3399-cru.txt
>>
>> Changes in v2:
>> - referring pmugrf for PMUGRU
>> - fix the typo "invaild" in COMMIT message
>>
>>   arch/arm64/boot/dts/rockchip/rk3399.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
> This seems fine to me, so:
>
> Reviewed-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> ...but I will say that before you actually add any real "MUXGRF"
> clocks on rk3399 you _might_ need to rework the code to make things
> truly "optional".  If it turns out that any existing clocks that
> already exist today already go through one of these muxes in the GRF
> and we've always been assuming one setting of the mux, we'll need to
> make sure we keep assuming that setting of the mux even if the "grf"
> isn't specified.
>
> As I understand it, your motivation for this patch is to eventually be
> able to model the EDP reference clock which can either be xin24 or
> "edp osc".  Presumably the eDP "reference clock" isn't related to any
> of the pre-existing eDP clocks so that one should be safe.

Hmm... I had intended to use this patch for EDP reference clock, but we 
don't need to change the parent
clock (see the BUG: 61664).

I just woud like to add this patch to avoid getting some unavailable 
MUXGRF clock and need to debug it again,
if we support it one day in future.

Thanks.

-- 
- Xing Zheng


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
