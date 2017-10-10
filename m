From: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Subject: Re: [RESEND PATCH 0/3] K2G: Add support for PWM ECAP
Date: Tue, 10 Oct 2017 18:11:31 +0530
Message-ID: <d8a7bec5-27df-d713-bff5-d70d946f19f7@ti.com>
References: <20170919061551.11981-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170919061551.11981-1-vigneshr-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Tuesday 19 September 2017 11:45 AM, Vignesh R wrote:
> 
> This series adds support for TI ECAP PWM IP present in 66AK2G SoC.
> Resending based on today's linux-next.
> 
> 
> Vignesh R (3):
>   ARM: dts: keystone-k2g: Add ECAP PWM DT nodes
>   ARM: dts: keystone-k2g-evm: Enable PWM ECAP0
>   ARM: configs: keystone: Enable TIECAP PWM driver
> 
>  arch/arm/boot/dts/keystone-k2g-evm.dts | 12 ++++++++++++
>  arch/arm/boot/dts/keystone-k2g.dtsi    | 20 ++++++++++++++++++++
>  arch/arm/configs/keystone_defconfig    |  2 ++
>  3 files changed, 34 insertions(+)
> 

Gentle ping on the series...

-- 
Regards
Vignesh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
