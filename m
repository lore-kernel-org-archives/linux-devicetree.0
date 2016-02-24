From: Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 0/5] Add mipi dsi support for rk3288
Date: Wed, 24 Feb 2016 17:38:27 +0800
Message-ID: <CAGd==049mj+K5u28SQQR+7Fh5aj-fGfOZtuPFHodmCZyKQhmqQ@mail.gmail.com>
References: <1452053038-32098-1-git-send-email-zyw@rock-chips.com>
	<56B869F4.6090507@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B869F4.6090507-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 8 February 2016 at 18:12, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wro=
te:
> Hi,
>
> On 01/06/2016 09:33 AM, Chris Zhong wrote:
>>
>>
>> The rk3288 MIPI DSI is a Synopsys DesignWare MIPI DSI host controlle=
r
>> IP. This series adds support for a Synopsys DesignWare MIPI DSI host
>> controller DRM driver.
>>
>> The MIPI DSI feature is tested on rk3288 evb board, backport them to
>> chrome os kernel chrome_v3.14, and it can display normally.
>>
>> This patchset is base on the patchset from Ying.liu-KZfg59tc24zYbTqN3TP0Kg@public.gmane.org
>> <http://www.spinics.net/lists/dri-devel/msg77181.html>
>>
>> According to the suggestion from Thierry, I have get rid of the brid=
ge,
>> and register the encoder & connecter in drm/rockchip/dw-mipi-dsi.c.
>
>
> I've raised this question too late, but what was the reason to not
> implement the DSI block as a bridge driver?
>
> The drm/hisilicon IP seems to use a very similar DSI Designware IP (t=
he
> register offsets seems to be the same). There is a good potential of
> re-use here by different kms drivers here the way it's already done f=
or
> DW HDMI and the analogix DP driver that's in review process.

yes, Hisilicon's hi6220 SoC use a Designware DSI Controller IP similar
to rockchip.
Maybe the version number is different.
I notice this recently when I am doing the upstream of hi6220's DRM dri=
ver.

And I have a look at Ying liu's original patches. It seems that it is
implemented in bridge.
His patches were sent in the early of last year, I can't get all the
background easily.
I wonder why his patches was not accecpted? What's the problem? And
why Thierry suggested get rid of bridge?

Thanks,
-xinliang

>
> Archit
>
>
>> After backport below patches from linux-next, I can merge this seria=
l into
>> Dave's drm-next branch.
>>
>> 94d5d6a0fbf3 clk: rockchip: add an id for rk3288 crypto clk
>> c6d49fbcfcc4 clk: rockchip: add id for mipidsi sclk on rk3288
>> a2f4c560f18e clk: rockchip: add mipidsi clock on rk3288
>> 69c923743640 ARM: dts: rockchip: correct the name of REG8 for
>> rk3288-evb-act8846
>> 662513a14c9d ARM: dts: rockchip: add 2 regulators for rk3288-evb-act=
8846
>> b04061e6599b ARM: dts: rockchip: move the public part to rk3288-evb =
common
>>
>>
>> Changes in v7:
>> - modify the config to tristate for modules build (Mark Yao)
>> - Pass NULL 'name' to drm_encoder_init() to fix compile err (Mark Ya=
o)
>> - Move the lcd_en control to act8846 dts
>>
>> Changes in v6:
>> - update the document, since the bridge device has been deleted.
>> - move the mipi_en gate to ockchip_drm_crtc_mode_config
>> - Remove the atomic feature check (Mark Yao)
>> - Add atomic API support (Heiko St=C3=BCbne)
>> - Do not use bridge driver (Thierry Reding)
>> - Optimization the phy init sequence
>>
>> Changes in v5:
>> - modify the clk name to SCLK_MIPIDSI_24M
>> - add a blank line befor lcd_en
>>
>> Changes in v4:
>> - use clk_round_rate to check the clock rate in vop_crtc_mode_fixup
>>
>> Changes in v3:
>> - move dw_mipi_dsi_rockchip.txt to bindings/display/rockchip/
>>
>> Chris Zhong (5):
>>    drm/rockchip: return a true clock rate to adjusted_mode
>>    Documentation: dt-bindings: Add bindings for rk3288 DW MIPI DSI d=
river
>>    drm: rockchip: Support Synopsys DW MIPI DSI
>>    ARM: dts: rockchip: add rk3288 mipi_dsi nodes
>>    ARM: dts: rockchip: add support mipi panel tv080wum-nl0
>>
>>   .../display/rockchip/dw_mipi_dsi_rockchip.txt      |   60 +
>>   arch/arm/boot/dts/rk3288-evb-act8846.dts           |    2 +
>>   arch/arm/boot/dts/rk3288-evb.dtsi                  |   12 +-
>>   arch/arm/boot/dts/rk3288.dtsi                      |   39 +
>>   drivers/gpu/drm/rockchip/Kconfig                   |   10 +
>>   drivers/gpu/drm/rockchip/Makefile                  |    1 +
>>   drivers/gpu/drm/rockchip/dw-mipi-dsi.c             | 1196
>> ++++++++++++++++++++
>>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    8 +
>>   8 files changed, 1327 insertions(+), 1 deletion(-)
>>   create mode 100644
>> Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockc=
hip.txt
>>   create mode 100644 drivers/gpu/drm/rockchip/dw-mipi-dsi.c
>>
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora F=
orum,
> hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
