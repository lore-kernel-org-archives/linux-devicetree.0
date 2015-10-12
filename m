From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Fix random hang up issue while kernel init
Date: Mon, 12 Oct 2015 18:32:27 +0200
Message-ID: <561BE09B.3040702@gmail.com>
References: <1444209281-25536-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444209281-25536-1-git-send-email-jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 07/10/15 11:14, James Liao wrote:
> This patch is based on v4.3-rc4, to fix system hanging up issue
> while disabling unused clocks.
>
> There is nothing different in mtk-scpsys.c and mt8173.dtsi from v1 [1].
>
> Changes since v1:
> - Rebase to v4.3-rc4.
> - Add a patch to change the corresponding binding document.
> - Add a separated patch to change the dtsi.
>
> [1] https://patchwork.kernel.org/patch/7262411/
>
> James Liao (3):
>    dt-bindings: soc: Add clocks for Mediatek SCPSYS unit
>    soc: mediatek: Fix random hang up issue while kernel init
>    arm64: dts: mt8173: Add clocks for SCPSYS unit
>
>   .../devicetree/bindings/soc/mediatek/scpsys.txt    | 10 ++--
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  6 +-
>   drivers/soc/mediatek/mtk-scpsys.c                  | 67 ++++++++++++++--------
>   3 files changed, 54 insertions(+), 29 deletions(-)
>
> --
> 1.9.1
>
>

Applied. Does this fix also needs to be applied to earlier kernel versions?

Thanks,
Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
