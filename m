From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6 3/5] watchdog: at91sam9_wdt: add device tree support
Date: Mon, 1 Oct 2012 14:45:46 +0200
Message-ID: <20121001124546.GE11837@lunn.ch>
References: <1349094281-28889-1-git-send-email-fabio.porcedda@gmail.com>
 <1349094281-28889-4-git-send-email-fabio.porcedda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1349094281-28889-4-git-send-email-fabio.porcedda@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-watchdog@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Wim Van Sebroeck <wim@iguana.be>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Andrew Victor <linux@maxim.org.za>, linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 01, 2012 at 02:24:39PM +0200, Fabio Porcedda wrote:
> Tested on an at91sam9260 board (evk-pro3)
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  .../devicetree/bindings/watchdog/atmel-wdt.txt      | 19 +++++++++++++++++++
>  drivers/watchdog/at91sam9_wdt.c                     | 21 +++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt b/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
> new file mode 100644
> index 0000000..65c1755
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
> @@ -0,0 +1,19 @@
> +* Atmel Watchdog Timers
> +
> +** at91sam9-wdt
> +
> +Required properties:
> +- compatible: must be "atmel,at91sam9260-wdt".
> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +
> +Optional properties:
> +- timeout: contains the watchdog timeout in seconds.
> +
> +Example:
> +
> +	watchdog@fffffd40 {
> +		compatible = "atmel,at91sam9260-wdt";
> +		reg = <0xfffffd40 0x10>;
> +		timeout = <10>;
> +	};
> diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
> index 05e1be8..c9e6bfa 100644
> --- a/drivers/watchdog/at91sam9_wdt.c
> +++ b/drivers/watchdog/at91sam9_wdt.c
> @@ -32,6 +32,7 @@
>  #include <linux/timer.h>
>  #include <linux/bitops.h>
>  #include <linux/uaccess.h>
> +#include <linux/of.h>
>  
>  #include "at91sam9_wdt.h"
>  
> @@ -254,6 +255,14 @@ static struct miscdevice at91wdt_miscdev = {
>  	.fops		= &at91wdt_fops,
>  };
>  
> +static inline void __init at91wdt_probe_dt(struct device_node *node)
> +{
> +	if (!node)
> +		return;
> +
> +	of_property_read_u32(node, "timeout", &heartbeat);
> +}
> +

In patch #1 you add a function to do this, and then you don't make use
of it here ?

Or am i missing something?

   Thanks
	Andrew
