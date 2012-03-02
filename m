From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: kirkwood: fdt: absorb kirkwood_init()
Date: Fri, 02 Mar 2012 01:09:41 -0600
Message-ID: <20120302070941.851923E2D7B@localhost>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <9d9a87361c05b8b85e1ee2cdabb46a365c7abca8.1330625877.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <9d9a87361c05b8b85e1ee2cdabb46a365c7abca8.1330625877.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu,  1 Mar 2012 18:20:53 +0000, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> We need to absorb kirkwood_init() into kirkwood_dt_init() so that as we
> convert drivers, we can remove the platform call, eg
> kirkwood_rtc_init().  This maintains compatibility with non-fdt
> configurations because they still call kirkwood_init() in common.c.
> 
> As drivers are converted, we will reinstate the 'static' qualifier in
> common.c.
> 
> Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> ---
>  arch/arm/mach-kirkwood/board-dt.c |   30 +++++++++++++++++++++++++++++-
>  arch/arm/mach-kirkwood/common.c   |   12 ++++++------
>  arch/arm/mach-kirkwood/common.h   |    8 ++++++++
>  3 files changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/mach-kirkwood/board-dt.c b/arch/arm/mach-kirkwood/board-dt.c
> index 4960e63..a0cc28b 100644
> --- a/arch/arm/mach-kirkwood/board-dt.c
> +++ b/arch/arm/mach-kirkwood/board-dt.c
> @@ -29,7 +29,9 @@
>  #include <linux/spi/orion_spi.h>
>  #include <asm/mach-types.h>
>  #include <asm/mach/arch.h>
> +#include <asm/mach/map.h>
>  #include <mach/kirkwood.h>
> +#include <mach/bridge-regs.h>
>  #include <plat/mvsdio.h>
>  #include "common.h"
>  #include "mpp.h"
> @@ -115,7 +117,33 @@ static void __init dreamplug_init(void)
>  
>  static void __init kirkwood_dt_init(void)
>  {
> -	kirkwood_init();
> +	printk(KERN_INFO "Kirkwood: %s, TCLK=%d.\n",
> +		kirkwood_id(), kirkwood_tclk);

Nit: pr_info()

g.
