From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V1 3/9] clk: sprd: add gate clock support
Date: Mon, 19 Jun 2017 18:31:30 -0700
Message-ID: <20170620013130.GI4493@codeaurora.org>
References: <20170618015855.27738-1-chunyan.zhang@spreadtrum.com>
 <20170618015855.27738-4-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170618015855.27738-4-chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Xiaolong Zhang <xiaolong.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Orson Zhai <orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Geng Ren <geng.ren-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/18, Chunyan Zhang wrote:
> diff --git a/drivers/clk/sprd/Makefile b/drivers/clk/sprd/Makefile
> index 8f802b2..333e2b2 100644
> --- a/drivers/clk/sprd/Makefile
> +++ b/drivers/clk/sprd/Makefile
> @@ -1,3 +1,3 @@
>  ifneq ($(CONFIG_OF),)
> -obj-y	+= ccu_common.o
> +obj-y	+= ccu_common.o ccu_gate.o

Can this be built as a module?

>  endif
> diff --git a/drivers/clk/sprd/ccu_gate.c b/drivers/clk/sprd/ccu_gate.c
> new file mode 100644
> index 0000000..3d27615
> --- /dev/null
> +++ b/drivers/clk/sprd/ccu_gate.c
> @@ -0,0 +1,102 @@
> +/*
> + * Spreadtrum gate clock driver
> + *
> + * Copyright (C) 2017 Spreadtrum, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0
> + */
> +
> +#include <linux/clk-provider.h>
> +
> +#include "ccu_gate.h"
> +
> +DEFINE_SPINLOCK(gate_lock);

This variable name is not very unique for debugging lockdep
reports. Probably needs 'sprd' in the name.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
