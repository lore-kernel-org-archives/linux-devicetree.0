From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 0/2] arm/arm64: dts: fix typo in mmc pinctrl
Date: Wed, 28 Jun 2017 11:19:30 +0200
Message-ID: <2086760.HXNp32Jd3t@phil>
References: <20170627195831.56449-1-klaus.goger@theobroma-systems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170627195831.56449-1-klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Klaus Goger <klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 27. Juni 2017, 21:58:29 CEST schrieb Klaus Goger:
> 
> replaces all occurrences of sdmmc with sdmmc in the arm64 and arm
> rockchip devicetree files
> 
> Changes in v2:
> - split arm and arm64 changes into separate changes
> 
> Klaus Goger (2):
>   arm: dts: rockchip: fix typo in rk3036 mmc pinctrl
ARM: dts: rockchip: in future please
[arm32 uses capital letters]

>   arm64: dts: rockchip: fix typo in mmc pinctrl

applied both for 4.14 with the subject of patch1 fixed up.

Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
