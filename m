From: Nathan Lynch <Nathan_Lynch@mentor.com>
Subject: Re: [PATCH 2/4] remoteproc: Supply controller driver for ST's Remote
 Processors
Date: Wed, 26 Aug 2015 12:07:30 -0500
Message-ID: <55DDF252.2010901@mentor.com>
References: <1440594483-29601-1-git-send-email-lee.jones@linaro.org>
 <1440594483-29601-3-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1440594483-29601-3-git-send-email-lee.jones@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: ohad@wizery.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

On 08/26/2015 08:08 AM, Lee Jones wrote:
> --- /dev/null
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -0,0 +1,300 @@
> +/*
> + * ST's Remote Processor Control Driver
> + *
> + * Copyright (C) 2015 STMicroelectronics - All Rights Reserved
> + *
> + * Author: Ludovic Barre <ludovic.barre@st.com>

When submitting code you didn't write, I'd say it's better practice to
clearly indicate its provenance in the commit message.  E.g. something
like "Driver based on code authored by Ludovic Barre for ST".  And
obtain signoffs etc if possible.


> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License.

Please review the wording here.  It's unclear whether this is intended
to be v2-only or v2 or later.


> +static int st_rproc_stop(struct rproc *rproc)
> +{
> +	struct st_rproc *st_rproc = rproc->priv;
> +	int err = 0;
> +
> +	if (st_rproc->config->sw_reset) {
> +		err = reset_control_assert(st_rproc->sw_reset);
> +		if (err)
> +			dev_warn(&rproc->dev, "Failed to assert S/W Reset\n");
> +	}
> +
> +	if (st_rproc->config->pwr_reset) {
> +		err = reset_control_assert(st_rproc->pwr_reset);
> +		if (err)
> +			dev_warn(&rproc->dev, "Failed to assert Power Reset\n");
> +	}
> +
> +	clk_disable(st_rproc->clk);
> +
> +	return 0;
> +}

Seems like st_rproc_stop should propagate errors back to its caller
instead of always returning 0.
