From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v1 0/6] Support the rk3036 Kylin board
Date: Sat, 19 Dec 2015 18:16:33 +0100
Message-ID: <9746732.gszC1tXaj9@diego>
References: <1450362112-8075-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450362112-8075-1-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, leozwang-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Caesar,

Am Donnerstag, 17. Dezember 2015, 22:21:46 schrieb Caesar Wang:
> Kylin-board is based on RK3036 SOCs, add the initiation
> version for working.

I've applied:
- patch1 (please include the "rockchip:" part in dts subjects)
- patch3 (dito)
- patch4 (after merging in patch6 and dropping the hdmi+lcdc parts)

Please resubmit the missing parts (audio + graphics) against my dts-branch [0]
after the relevant maintainers have added the code-parts to their trees.


Thanks
Heiko

[0] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/log/?h=v4.5-armsoc/dts32

> 
> This series patches have the following decriptions:
> 
> PATCH[1/6]:
> ARM: dts: fix the correct pinctrl control for rk3036
> 
> The pinctrl gpio pull up/down is incorrect since the rk3036 SoCs
> can't set the status in the internal.
> ---
> 
> PATCH[2/6]:
> ARM: dts: add the lcdc and hdmi node for rk3036
> 
> Add the devices is related to display.
> Based on the series patches of Mark Yao's
> ---
> 
> PATCH[3/6]:
> ARM: dts: add the sdio/sdmmc node for rk3036
> 
> Add the wifi/sd card work for kylin board.
> ---
> 
> PATCH[4/6]:
> ARM: dts: rockchip: add the kylin board for rk3036
> 
> Add the dts for kylin board.
> ---
> 
> PATCH[5/6]:
> ARM: dts: add the sound codec for kylin board
> 
> Make the codec rt5616 working on kylin board.
> The realteak have been upstream for Mark Brown,
> I guess need some days to review.
> 
> ---
> 
> PATCH[6/6]:
> ARM: dts: add the sdio node for kylin board
> 
> Enable the sdio for kylin board.
> ---
> 
> 
> 
> Caesar Wang (6):
>   ARM: dts: fix the correct pinctrl control for rk3036
>   ARM: dts: add the lcdc and hdmi node for rk3036
>   ARM: dts: add the sdio/sdmmc node for rk3036
>   ARM: dts: rockchip: add the kylin board for rk3036
>   ARM: dts: add the sound codec for kylin board
>   ARM: dts: add the sdio node for kylin board
> 
>  Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/rk3036-kylin.dts                 | 345
> +++++++++++++++++++++ arch/arm/boot/dts/rk3036.dtsi                      |
> 167 ++++++++-- 4 files changed, 498 insertions(+), 19 deletions(-)
>  create mode 100644 arch/arm/boot/dts/rk3036-kylin.dts

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
