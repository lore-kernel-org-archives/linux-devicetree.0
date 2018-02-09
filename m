From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: introduce pclk_vio_grf in eDP device node
Date: Fri, 09 Feb 2018 10:45:03 +0100
Message-ID: <2524920.mM517gbyb6@phil>
References: <20180207163150.16332-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180207163150.16332-1-enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 7. Februar 2018, 17:31:48 CET schrieb Enric Balletbo i Serra:
> From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> The pclk_vio_grf supply power for VIO GRF IOs, if it is disabled,
> driver would failed to operate the VIO GRF registers.
> 
> The clock is optional but one of the side effects of don't have this clk
> is that the Samsung Chromebook Plus fails to recover display after a
> suspend/resume with following errors:
> 
>     rockchip-dp ff970000.edp: Input stream clock not detected.
>     rockchip-dp ff970000.edp: Timeout of video streamclk ok
>     rockchip-dp ff970000.edp: unable to config video
> 
> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

as you said in IRC that his should also fix the failures when rockchip-drm
is build as module, I've applied this patch as fix for 4.16


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
