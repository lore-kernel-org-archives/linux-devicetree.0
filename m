From: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH v11 0/3] ARM: hisi: Add initial support for Hi3519 SOC
Date: Tue, 28 Jun 2016 18:36:34 +0100
Message-ID: <5772B5A2.7030404@hisilicon.com>
References: <1465957147-32314-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465957147-32314-1-git-send-email-xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jiancheng,

On 15/06/2016 03:19, Jiancheng Xue wrote:
> These three patches are abstracted from the patchset titled
> "[RESEND PATCH v10 0/6] ARM: hisi: Add initial support including
> clock driver for Hi3519 soc."(https://lkml.org/lkml/2016/3/31/175).
> The clock driver part was merged in v4.7-rc1. This patch set
> is mainly used to enable Hi3519 basic soc and add dts files.
> 
> Jiancheng Xue (3):
>   ARM: hisi: add compatible string for Hi3519 soc
>   ARM: dt-bindings: add device tree bindings for Hi3519 sysctrl
>   ARM: dts: add dts files for Hi3519
> 

Thanks!
Applied all the 3 patches to the hisilicon soc tree.

I have modified the dts Makefile in the patch 3 and shuffled
the ARCH_HIGHBANK, ARCH_HISI and ARCH_HIX5HD2 around to
keep the list sorted.

Best Regards,
Wei


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
