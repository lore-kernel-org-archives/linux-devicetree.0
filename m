From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of: Have of_device_add call platform_device_add rather than device_add
Date: Wed, 21 Nov 2012 15:51:04 +0000
Message-ID: <20121121155104.726B83E0AE2@localhost>
References: <20121121072448.GG19837@obsidianresearch.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121121072448.GG19837@obsidianresearch.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, 21 Nov 2012 00:24:48 -0700, Jason Gunthorpe <jgunthorpe@obsidianresearch.com> wrote:
> This allows platform_device_add a chance to call insert_resource
> on all of the resources from OF. At a minimum this fills in proc/iomem
> and presumably makes resource tracking and conflict detection work
> better.
> 
> Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
> ---
>  drivers/of/device.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> Tested on PPC32 and ARM32 embedded kernels.
> 
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index 4c74e4f..a5b67dc 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -62,7 +62,7 @@ int of_device_add(struct platform_device *ofdev)
>  	if (!ofdev->dev.parent)
>  		set_dev_node(&ofdev->dev, of_node_to_nid(ofdev->dev.of_node));
>  
> -	return device_add(&ofdev->dev);
> +	return platform_device_add(ofdev);
>  }
>  
>  int of_device_register(struct platform_device *pdev)

This has the side effect of moving all devices at the root of the tree
from /sys/devices/ to /sys/devices/platform. It also has the possibility
of breaking if any devices get registered with overlapping regions. I
think there are some powerpc 5200 boards that do this, and I'm not sure
about the larger Power boxen.

I've got a more nuanced version of this patch that I'm trying to get
published today for review. I'll add you to the cc list.

g.

> -- 
> 1.7.4.1
> 

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.
