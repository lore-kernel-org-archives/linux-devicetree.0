From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5] arm64: dts: mt8173: add mmsel clocks for 4K support
Date: Fri, 13 Jan 2017 16:32:39 +0100
Message-ID: <0786f0e3-791a-4173-7506-cbb0bcb9f521@gmail.com>
References: <1470279438-60372-1-git-send-email-bibby.hsieh@mediatek.com>
 <CAGS+omAZvHmSz6bJcvisC1LZgxwbd-HzvYMDrHXzfkY3mZZEsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omAZvHmSz6bJcvisC1LZgxwbd-HzvYMDrHXzfkY3mZZEsw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, YH Huang <yh.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>CK Hu <c>
List-Id: devicetree@vger.kernel.org



On 12/01/17 05:50, Daniel Kurtz wrote:
> Hi Matthias,
>
> (Trying again to send plain text email)...
>
> On Thu, Aug 4, 2016 at 10:57 AM, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>> To support HDMI 4K resolution, mmsys need clcok
>> mm_sel to be 400MHz.
>>
>> The board .dts file should override the clock rate
>> property with the higher VENCPLL frequency the board
>> supports HDMI 4K resolution.
>>
>> Signed-off-by: Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> Reviewed-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>

Applied to v4.10-next/dts
Thanks

>
> It looks like this patch was lost.  It is actually a prerequisite for
> MTK 4k HDMI support, which already landed in v4.9.
>
> See the email thread entitled:
> [PATCH v5 0/3] MT8173 HDMI 4K support <https://lkml.org/lkml/2016/9/28/893>
>
> Or these three:
>
> 0d2200794f0a drm/mediatek: modify the factor to make the pll_rate set
> in the 1G-2G range
> 968253bd7caa drm/mediatek: enhance the HDMI driving current
> d542b7c473f0 drm/mediatek: do mtk_hdmi_send_infoframe after HDMI clock enable
>
> -Dan
>
>> ---
>>  arch/arm64/boot/dts/mediatek/mt8173.dtsi |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> index 78529e4..c3f32f3 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> @@ -690,6 +690,8 @@
>>                         compatible = "mediatek,mt8173-mmsys", "syscon";
>>                         reg = <0 0x14000000 0 0x1000>;
>>                         power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>> +                       assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
>> +                       assigned-clock-rates = <400000000>;
>>                         #clock-cells = <1>;
>>                 };
>>
>> --
>> 1.7.9.5
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
