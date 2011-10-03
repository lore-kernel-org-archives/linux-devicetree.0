From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V2] AT91: dt: at91sam9g45 family and board device tree
	files
Date: Mon, 3 Oct 2011 09:52:40 +0100
Message-ID: <20111003085240.GB11710@n2100.arm.linux.org.uk>
References: <1317636056-9537-1-git-send-email-nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1317636056-9537-1-git-send-email-nicolas.ferre@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 03, 2011 at 12:00:56PM +0200, Nicolas Ferre wrote:
> diff --git a/arch/arm/mach-at91/board-dt.c b/arch/arm/mach-at91/board-dt.c
> new file mode 100644
> index 0000000..7bcb9a9
> --- /dev/null
> +++ b/arch/arm/mach-at91/board-dt.c
> @@ -0,0 +1,122 @@
> +/*
> + *  Setup code for AT91SAM Evaluation Kits with Device Tree support
> + *
> + *  Covers: * AT91SAM9G45-EKES  board
> + *          * AT91SAM9M10-EKES  board
> + *          * AT91SAM9M10G45-EK board
> + *
> + *  Copyright (C) 2011 Atmel,
> + *                2011 Nicolas Ferre <nicolas.ferre@atmel.com>
> + *
> + * Licensed under GPLv2 or later.
> + */
> +
> +#include <linux/types.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/irqdomain.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +
> +#include <mach/hardware.h>
> +#include <mach/board.h>
> +#include <mach/gpio.h>

Is linux/gpio.h broken for you?
