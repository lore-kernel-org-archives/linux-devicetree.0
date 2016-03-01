From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v3 2/3] clk: rockchip: add dt-binding header for rk3399
Date: Tue, 1 Mar 2016 17:19:07 +0800
Message-ID: <56D55E8B.6070804@rock-chips.com>
References: <1456456341-14282-1-git-send-email-jay.xu@rock-chips.com>
 <1456814401-10711-1-git-send-email-jay.xu@rock-chips.com>
 <1456814401-10711-3-git-send-email-jay.xu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456814401-10711-3-git-send-email-jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jay,

On 2016=E5=B9=B403=E6=9C=8801=E6=97=A5 14:40, Jianqun Xu wrote:
> From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> Add the dt-bindings header for the rk3399, that gets shared between
> the clock controller and the clock references in the dts.
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> changes in v3:
> - add pmucru definations
>
>   include/dt-bindings/clock/rk3399-cru.h | 716 ++++++++++++++++++++++=
+++++++++++
>   1 file changed, 716 insertions(+)
>   create mode 100644 include/dt-bindings/clock/rk3399-cru.h
>
> diff --git a/include/dt-bindings/clock/rk3399-cru.h b/include/dt-bind=
ings/clock/rk3399-cru.h
> new file mode 100644
> index 0000000..77bb1ec
> --- /dev/null
> +++ b/include/dt-bindings/clock/rk3399-cru.h
> @@ -0,0 +1,716 @@
> +/*
> + * Copyright (c) 2015 Rockchip Electronics Co. Ltd.
The Copyright should be 2016.

Thanks.

--=20
- Xing Zheng


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
