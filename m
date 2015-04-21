From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v5 07/11] ARM: imx: add msl support for imx7d
Date: Tue, 21 Apr 2015 16:12:25 +0100
Message-ID: <20150421151225.GZ12732@n2100.arm.linux.org.uk>
References: <1429628007-8892-1-git-send-email-Frank.Li@freescale.com>
 <1429628007-8892-8-git-send-email-Frank.Li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1429628007-8892-8-git-send-email-Frank.Li@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Frank.Li@freescale.com
Cc: lznuaa@gmail.com, shawn.guo@linaro.org, linus.walleij@linaro.org, robh+dt@kernel.org, linux-gpio@vger.kernel.org, Anson Huang <b20788@freescale.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 21, 2015 at 10:53:23PM +0800, Frank.Li@freescale.com wrote:
> diff --git a/arch/arm/mach-imx/mx7.h b/arch/arm/mach-imx/mx7.h
> new file mode 100644
> index 0000000..bfef936
> --- /dev/null
> +++ b/arch/arm/mach-imx/mx7.h
> @@ -0,0 +1,38 @@
> +/*
> + * Copyright (C) 2015 Freescale Semiconductor, Inc. All Rights Reserved.
> + */
> +
> +/*
> + *  * This program is free software; you can redistribute it and/or modify
> + *   * it under the terms of the GNU General Public License version 2 as
> + *    * published by the Free Software Foundation.
> + *     */

Something obviously went wrong here.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
