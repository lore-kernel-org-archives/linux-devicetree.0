From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: Fix DWMMC clocks
Date: Fri, 16 Feb 2018 10:31:18 +0100
Message-ID: <4734191.1zOSGruJ4r@diego>
References: <74be71477b800f8a7b93a9e92ffeff9bf38c52ce.1518703554.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74be71477b800f8a7b93a9e92ffeff9bf38c52ce.1518703554.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 15. Februar 2018, 15:05:53 CET schrieb Robin Murphy:
> Trying to boot an RK3328 box with an HS200-capable eMMC, I see said eMMC
> fail to initialise as it can't run its tuning procedure, because the
> sample clock is missing. Upon closer inspection, whilst the clock is
> present in the DT, its name is subtly incorrect per the binding, so
> __of_clk_get_by_name() never finds it. By inspection, the drive clock
> suffers from a similar problem, so has never worked properly either.
> 
> Fix up all instances of the incorrect clock names across the 64-bit DTs.
> 
> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>

added apropriate Fixes-tags and applied as fix for 4.16


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
