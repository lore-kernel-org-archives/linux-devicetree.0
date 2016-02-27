From: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH 0/6] arm64: hip05: update
Date: Sat, 27 Feb 2016 16:38:06 +0800
Message-ID: <56D1606E.70709@hisilicon.com>
References: <1454056746-5048-1-git-send-email-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454056746-5048-1-git-send-email-wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kefeng,

On 29/01/2016 16:39, Kefeng Wang wrote:
> Enable more feature in hip05 d02 board.
> 
> Kefeng Wang (6):
>   arm64: dts: hip05: Add L2 cache topology
>   arm64: dts: hip05: Use Cortex specific device node for pmu
>   arm64: dts: hip05: Append all gicv3 ITS entries
>   arm64: dts: hip05: Append gpio nodes
>   arm64: dts: hip05: Append power button node for D02 board
>   arm64: defconfig: Enable DesignWare APB GPIO controller
> 
>  arch/arm64/boot/dts/hisilicon/hip05-d02.dts | 18 ++++++
>  arch/arm64/boot/dts/hisilicon/hip05.dtsi    | 92 ++++++++++++++++++++++++++++-
>  arch/arm64/configs/defconfig                |  1 +
>  3 files changed, 109 insertions(+), 2 deletions(-)
> 

Applied all the patches into the hisilicon soc tree.
Thanks!

Best Regards,
Wei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
