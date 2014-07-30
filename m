From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 2/2] clk: initial clock driver for TWL6030
Date: Wed, 30 Jul 2014 16:29:45 +0200
Message-ID: <53D90159.7040307@suse.de>
References: <1406728949-7560-1-git-send-email-sassmann@kpanic.de>
 <1406728949-7560-3-git-send-email-sassmann@kpanic.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1406728949-7560-3-git-send-email-sassmann@kpanic.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Assmann <sassmann@kpanic.de>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, mturquette@linaro.org, pawel.moll@arm.com, robh+dt@kernel.org, t-kristo@ti.com, broonie@kernel.org
List-Id: devicetree@vger.kernel.org

Hi Stefan,

Glad you got it working. :)

Small nit below:

Am 30.07.2014 16:02, schrieb Stefan Assmann:
> diff --git a/drivers/clk/ti/clk-6030.c b/drivers/clk/ti/clk-6030.c
> new file mode 100644
> index 0000000..baa965b
> --- /dev/null
> +++ b/drivers/clk/ti/clk-6030.c
> @@ -0,0 +1,141 @@
> +/*
> + * drivers/clk/ti/clk-6030.c
> + *
> + *  Copyright (C) 2014 Stefan Assmann <sassmann@kpanic.de>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

Here you say version 2 ...

> + *
> + * Clock driver for ti twl6030.
> + */
[...]
> +MODULE_AUTHOR("Stefan Assmann <sassmann@kpanic.de>");
> +MODULE_DESCRIPTION("clock driver for TI SoC based boards with twl6030");
> +MODULE_LICENSE("GPL");

... but down here it's "GPL". Either use "GPL v2" here, or IIUC use the
"or (at your option) any later version" license above if you can.

Cheers,
Andreas

-- =

SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnberg
