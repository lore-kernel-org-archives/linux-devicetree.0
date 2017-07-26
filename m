From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: dts: stm32: Remove rdinit from bootargs
Date: Wed, 26 Jul 2017 18:24:46 +0200
Message-ID: <c38e634a-0475-4541-1127-b7a2fb390daa@st.com>
References: <1500280565-26049-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500280565-26049-1-git-send-email-alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 07/17/2017 10:36 AM, Alexandre TORGUE wrote:
> This series remove rdinit from bootargs on stm32f4 boards (429-eval,
> 429-disco, 469-disco). Indeed, rootfs is independent from boards.
> Furthermore it will align stm32 F4 devicetree on stm32 F7/H7 one.
> 
> Regards
> Alex
> 
> Alexandre TORGUE (3):
>    ARM: dts: stm32: Remove rdinit from bootargs on stm32f469-disco
>    ARM: dts: stm32: Remove rdinit from bootargs on stm32f429i-eval
>    ARM: dts: stm32: Remove rdinit from bootargs on stm32f429-disco
> 
>   arch/arm/boot/dts/stm32429i-eval.dts  | 2 +-
>   arch/arm/boot/dts/stm32f429-disco.dts | 2 +-
>   arch/arm/boot/dts/stm32f469-disco.dts | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
Series applied on stm32-dt-for-v4.14 branch.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
