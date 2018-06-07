From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v1 2/4] clk: rockchip: add dt-binding header for px30
Date: Thu, 07 Jun 2018 09:56:58 +0200
Message-ID: <2233320.o0OUWNYjTa@diego>
References: <1528340786-462-1-git-send-email-zhangqing@rock-chips.com> <1528340786-462-3-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528340786-462-3-git-send-email-zhangqing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, cl@rock-chips.com, xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 7. Juni 2018, 05:06:24 CEST schrieb Elaine Zhang:
> Add the dt-bindings header for the px30, that gets shared between
> the clock controller and the clock references in the dts.
> Add softreset ID for px30.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  include/dt-bindings/clock/px30-cru.h | 402
> +++++++++++++++++++++++++++++++++++ 1 file changed, 402 insertions(+)
>  create mode 100644 include/dt-bindings/clock/px30-cru.h
> 
> diff --git a/include/dt-bindings/clock/px30-cru.h
> b/include/dt-bindings/clock/px30-cru.h new file mode 100644
> index 000000000000..db9fc2a0bb21
> --- /dev/null
> +++ b/include/dt-bindings/clock/px30-cru.h
> @@ -0,0 +1,402 @@
> +/*
> + * Copyright (c) 2017 Rockchip Electronics Co. Ltd.
> + * Author: Elaine <zhangqing@rock-chips.com>

				^^ full name maybe?

Otherwise looks good.


Heiko
