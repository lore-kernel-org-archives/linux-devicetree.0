From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v4 4/4] dt: add amba device creation to platform bus scan
Date: Fri, 10 Jun 2011 16:39:02 -0600
Message-ID: <20110610223902.GF28994@ponder.secretlab.ca>
References: <1307738923-7564-1-git-send-email-robherring2@gmail.com>
	<1307738923-7564-5-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1307738923-7564-5-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 10, 2011 at 03:48:43PM -0500, Rob Herring wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> Add support to the platform bus scanning to call custom device creation
> function for amba devices.
> 
> Cc: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: arnd-r2nGTMty4D4@public.gmane.org
> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/of/platform.c |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 8d0f477..1712f22 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -21,6 +21,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/amba/bus.h>
>  
>  static int of_dev_node_match(struct device *dev, void *data)
>  {
> @@ -234,6 +235,11 @@ static int of_platform_bus_create(struct device_node *bus,
>  		return 0;
>  	}
>  
> +	if (of_device_is_compatible(bus, "arm,amba-device")) {
> +		of_amba_device_create(bus, parent);
> +		return 0;
> +	}
> +	

Yeah, this is the right thing to do.  I'll pick it up.

>  	dev = of_platform_device_create(bus, NULL, parent);
>  	if (!dev || !of_match_node(matches, bus))
>  		return 0;
> -- 
> 1.7.4.1
> 
