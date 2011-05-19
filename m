From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/2] dt: check for devices already created fron DT scan
Date: Thu, 19 May 2011 13:54:13 -0600
Message-ID: <20110519195413.GV5109@ponder.secretlab.ca>
References: <1305829704-11774-1-git-send-email-robherring2@gmail.com>
	<1305829704-11774-2-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1305829704-11774-2-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 19, 2011 at 01:28:23PM -0500, Rob Herring wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> of_platform_bus_create may create duplicate devices if already
> added when scanning other buses like amba bus.
> 
> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/of/platform.c |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 9b785be..7bf74fb 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -234,6 +234,13 @@ static int of_platform_bus_create(struct device_node *bus,
>  		return 0;
>  	}
>  
> +	/* Has the device already been registered? */
> +	if (of_find_device_by_node(bus)) {
> +		pr_debug("%s() - skipping %s, already registered\n",
> +			 __func__, bus->full_name);
> +		return 0;
> +	}
> +

Intriguing, I hadn't though about doing it this way, and it would
hugely simplify the of_platform_prepare() logic that I posted a few
weeks back.  I need to think about this...

However, there is a potential race condition with static device
registrations that also use of_platform_prepare().  If there every
exists a multi-threaded device registration scenario, then it could be
possible for this check to pass, the other thread register a
conflicting device, and then this finishes creating it.  However,
since device registration is pretty much always a single threaded
affair, I'm probably just being paranoid.

Also, of_find_device_by_node() casts a rather wide net.  There are a
few small use-cases where multiple devices will have the same node
pointer.  It would be better to restrict it to devices with the same
parent, or devices on the same bus type.

>  	dev = of_platform_device_create(bus, NULL, parent);
>  	if (!dev || !of_match_node(matches, bus))
>  		return 0;
> @@ -326,4 +333,5 @@ int of_platform_populate(struct device_node *root,
>  	of_node_put(root);
>  	return rc;
>  }
> +EXPORT_SYMBOL(of_platform_populate);

This is an unrelated change.  Does it belong in this patch?

>  #endif /* !CONFIG_SPARC */
> -- 
> 1.7.4.1
> 
