From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 4/7] mmc: sdhci-of: fix build on non-powerpc platforms
Date: Tue, 16 Nov 2010 22:32:47 -0700
Message-ID: <20101117053247.GE12813@angua.secretlab.ca>
References: <1289939635-30742-1-git-send-email-robherring2@gmail.com>
	<1289939635-30742-5-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1289939635-30742-5-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 16, 2010 at 02:33:52PM -0600, Rob Herring wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> Explicitly include err.h, of_address.h and of_irq.h.
> Make use of machine_is() conditional on PPC.
> 
> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Merged into my test branch, thanks.

g.

> ---
>  drivers/mmc/host/sdhci-of-core.c |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-core.c b/drivers/mmc/host/sdhci-of-core.c
> index fa19d84..dd84124 100644
> --- a/drivers/mmc/host/sdhci-of-core.c
> +++ b/drivers/mmc/host/sdhci-of-core.c
> @@ -13,6 +13,7 @@
>   * your option) any later version.
>   */
>  
> +#include <linux/err.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
> @@ -20,8 +21,12 @@
>  #include <linux/delay.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
>  #include <linux/mmc/host.h>
> +#ifdef CONFIG_PPC
>  #include <asm/machdep.h>
> +#endif
>  #include "sdhci-of.h"
>  #include "sdhci.h"
>  
> @@ -112,7 +117,11 @@ static bool __devinit sdhci_of_wp_inverted(struct device_node *np)
>  		return true;
>  
>  	/* Old device trees don't have the wp-inverted property. */
> +#ifdef CONFIG_PPC
>  	return machine_is(mpc837x_rdb) || machine_is(mpc837x_mds);
> +#else
> +	return false;
> +#endif
>  }
>  
>  static int __devinit sdhci_of_probe(struct platform_device *ofdev,
> -- 
> 1.7.1
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
