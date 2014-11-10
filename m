From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 08/13] ARM: STi: DT: STiH410: Add defines for STiH410 DT
 clocks
Date: Mon, 10 Nov 2014 10:08:40 +0000
Message-ID: <20141110100840.GO21424@x1>
References: <1415361475-6218-1-git-send-email-peter.griffin@linaro.org>
 <1415361475-6218-9-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415361475-6218-9-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 07 Nov 2014, Peter Griffin wrote:

> Although most clock outputs are the same as stih407 SoC, stih410
> also has some additional new clock outputs.
>=20
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  include/dt-bindings/clock/stih410-clks.h | 24 ++++++++++++++++++++++=
++
>  1 file changed, 24 insertions(+)
>  create mode 100644 include/dt-bindings/clock/stih410-clks.h
>=20
> diff --git a/include/dt-bindings/clock/stih410-clks.h b/include/dt-bi=
ndings/clock/stih410-clks.h
> new file mode 100644
> index 0000000..2c5d6ff
> --- /dev/null
> +++ b/include/dt-bindings/clock/stih410-clks.h
> @@ -0,0 +1,24 @@
> +/*
> + * This header provides constants clk index STMicroelectronics
> + * STiH410 SoC.
> + */
> +#ifndef _DT_BINDINGS_CLK_STIH410
> +#define _DT_BINDINGS_CLK_STIH410
> +#include "stih407-clks.h"

Nit: Please add a newline between the sentries and #include.

Apart from that, looks good:

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> +/* STiH410 introduces new clock outputs compared to STiH407 */
> +
> +/* CLOCKGEN C0 */
> +#define CLK_TX_ICN_HADES	32
> +#define CLK_RX_ICN_HADES	33
> +#define CLK_ICN_REG_16		34
> +#define CLK_PP_HADES		35
> +#define CLK_CLUST_HADES		36
> +#define CLK_HWPE_HADES		37
> +#define CLK_FC_HADES		38
> +
> +/* CLOCKGEN D0 */
> +#define CLK_PCMR10_MASTER	4
> +#define CLK_USB2_PHY		5
> +
> +#endif

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
