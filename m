From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v3 1/4] kernel/resource: Invalid memory access in
 __release_resource
Date: Wed, 22 Apr 2015 11:47:01 -0500
Message-ID: <20150422164701.GJ20701@google.com>
References: <1429719261-18024-1-git-send-email-ricardo.ribalda@gmail.com>
 <1429719261-18024-2-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1429719261-18024-2-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Jakub Sitnicki <jsitnicki@gmail.com>, Vivek Goyal <vgoyal@redhat.com>, Jiang Liu <jiang.liu@linux.intel.com>, Mike Travis <travis@sgi.com>, Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 22, 2015 at 06:14:18PM +0200, Ricardo Ribalda Delgado wrote:
> When a resource is initialized via of_platform_populate.
> resource->parent is initialized to NULL via kzalloc.
> (of_platform_populate->of_device_alloc->of_address_to_resource)
> 
> If of_platform_depopulate is called later, resource->parent is
> accessed (Offset 0x30 of address 0), causing a kernel error.
> 
> This patch evaluates resouce->parent before accessing it. If it
> is not initialized, -EACCESS is returned.
> 
> Also a WARN is thrown, so the developer can have a hint about what
> needs to be fixed.
> 
> Fixes:
> BUG: unable to handle kernel NULL pointer deference at 0000000000000030
> IP: release_resource+0x26/0x90
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  kernel/resource.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/kernel/resource.c b/kernel/resource.c
> index 90552aa..b7b270f 100644
> --- a/kernel/resource.c
> +++ b/kernel/resource.c
> @@ -237,6 +237,9 @@ static int __release_resource(struct resource *old)
>  {
>  	struct resource *tmp, **p;
>  
> +	if (WARN_ON(!old->parent))
> +		return -EINVAL;

I'm not really a fan of this.  The NULL pointer oops is a very good clue
all by itself, and it doesn't require any extra code here.

>  	p = &old->parent->child;
>  	for (;;) {
>  		tmp = *p;
> -- 
> 2.1.4
> 
