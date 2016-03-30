From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v3 0/2] mmc: dw_mmc: controller reset support
Date: Wed, 30 Mar 2016 19:45:05 +0800
Message-ID: <56FBBC41.5080104@rock-chips.com>
References: <1459322696-29919-1-git-send-email-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459322696-29919-1-git-send-email-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, --to=robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

+ Heiko
On 2016/3/30 15:24, Guodong Xu wrote:
> mmc controller registers may in abnormal state if mmc is used in
> bootloader, eg. to load kernel from eMMC. Some controllers cann't
> clear their registers when clk is set. They use dedicated reset
> logics to do this.
>
> In this patch, a 'resets' property is added into dw_mmc dts
> node. When driver does parse_dt and probe, it calls reset API to
> deassert the 'reset' of dw_mmc host controller. When probe error or
> remove, it calls reset API to assert it.
>
> Chip vendor's actual reset logics is implemented in reset driver, not
> in dw_mmc code.
>
> Please also refer to Documentation/devicetree/bindings/reset/reset.txt
>
> Guodong Xu (2):
>    Documentation: synopsys-dw-mshc: add binding for resets
>    mmc: dw_mmc: add resets support to dw_mmc
>
>   .../devicetree/bindings/mmc/synopsys-dw-mshc.txt     |  4 ++++
>   drivers/mmc/host/dw_mmc.c                            | 20 +++++++++++++++++++-
>   include/linux/mmc/dw_mmc.h                           |  6 ++++--
>   3 files changed, 27 insertions(+), 3 deletions(-)
>


-- 
Best Regards
Shawn Lin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
