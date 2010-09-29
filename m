From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/7] of: GPIO: Fix OF probing on little-endian systems
Date: Wed, 29 Sep 2010 15:30:11 +0900
Message-ID: <20100929063011.GF2439@angua.secretlab.ca>
References: <1285739538-29058-1-git-send-email-monstr@monstr.eu>
	<1285739538-29058-2-git-send-email-monstr@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1285739538-29058-2-git-send-email-monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, duyl-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linnj-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, edgar.iglesias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 29, 2010 at 03:52:12PM +1000, Michal Simek wrote:
> DTB is always big-endian that's why is necessary
> to convert it.
> 
> Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
> CC: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> CC: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> CC: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
> CC: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org

Applied, thanks.

g.

> ---
>  drivers/gpio/xilinx_gpio.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/xilinx_gpio.c b/drivers/gpio/xilinx_gpio.c
> index 7096909..846fbd5 100644
> --- a/drivers/gpio/xilinx_gpio.c
> +++ b/drivers/gpio/xilinx_gpio.c
> @@ -171,13 +171,13 @@ static int __devinit xgpio_of_probe(struct device_node *np)
>  	/* Update GPIO state shadow register with default value */
>  	tree_info = of_get_property(np, "xlnx,dout-default", NULL);
>  	if (tree_info)
> -		chip->gpio_state = *tree_info;
> +		chip->gpio_state = be32_to_cpup(tree_info);
>  
>  	/* Update GPIO direction shadow register with default value */
>  	chip->gpio_dir = 0xFFFFFFFF; /* By default, all pins are inputs */
>  	tree_info = of_get_property(np, "xlnx,tri-default", NULL);
>  	if (tree_info)
> -		chip->gpio_dir = *tree_info;
> +		chip->gpio_dir = be32_to_cpup(tree_info);
>  
>  	/* Check device node and parent device node for device width */
>  	chip->mmchip.gc.ngpio = 32; /* By default assume full GPIO controller */
> @@ -186,7 +186,7 @@ static int __devinit xgpio_of_probe(struct device_node *np)
>  		tree_info = of_get_property(np->parent,
>  					    "xlnx,gpio-width", NULL);
>  	if (tree_info)
> -		chip->mmchip.gc.ngpio = *tree_info;
> +		chip->mmchip.gc.ngpio = be32_to_cpup(tree_info);
>  
>  	spin_lock_init(&chip->gpio_lock);
>  
> -- 
> 1.5.5.1
> 
