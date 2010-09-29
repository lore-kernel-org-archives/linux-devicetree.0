From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/7] of: Fix uart16550 initialization on little-endian
	systems
Date: Wed, 29 Sep 2010 15:29:45 +0900
Message-ID: <20100929062944.GD2439@angua.secretlab.ca>
References: <1285739538-29058-1-git-send-email-monstr@monstr.eu>
	<1285739538-29058-2-git-send-email-monstr@monstr.eu>
	<1285739538-29058-3-git-send-email-monstr@monstr.eu>
	<1285739538-29058-4-git-send-email-monstr@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1285739538-29058-4-git-send-email-monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
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
Cc: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, duyl-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linnj-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, edgar.iglesias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 29, 2010 at 03:52:14PM +1000, Michal Simek wrote:
> Convert values from big-endian to cpu-endian.
> 
> Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
> CC: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> CC: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
> CC: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> CC: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org

Applied, thanks.

g.

> ---
>  drivers/serial/of_serial.c |   17 ++++++++++-------
>  1 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/serial/of_serial.c b/drivers/serial/of_serial.c
> index 2af8fd1..0e4d894 100644
> --- a/drivers/serial/of_serial.c
> +++ b/drivers/serial/of_serial.c
> @@ -31,17 +31,19 @@ static int __devinit of_platform_serial_setup(struct platform_device *ofdev,
>  {
>  	struct resource resource;
>  	struct device_node *np = ofdev->dev.of_node;
> -	const unsigned int *clk, *spd;
> +	const unsigned int *spd;
> +	unsigned int clk;
>  	const u32 *prop;
>  	int ret, prop_size;
>  
>  	memset(port, 0, sizeof *port);
>  	spd = of_get_property(np, "current-speed", NULL);
> -	clk = of_get_property(np, "clock-frequency", NULL);
> -	if (!clk) {
> +	prop = of_get_property(np, "clock-frequency", NULL);
> +	if (!prop) {
>  		dev_warn(&ofdev->dev, "no clock-frequency property set\n");
>  		return -ENODEV;
>  	}
> +	clk = be32_to_cpup(prop);
>  
>  	ret = of_address_to_resource(np, 0, &resource);
>  	if (ret) {
> @@ -55,23 +57,24 @@ static int __devinit of_platform_serial_setup(struct platform_device *ofdev,
>  	/* Check for shifted address mapping */
>  	prop = of_get_property(np, "reg-offset", &prop_size);
>  	if (prop && (prop_size == sizeof(u32)))
> -		port->mapbase += *prop;
> +		port->mapbase += be32_to_cpup(prop);
>  
>  	/* Check for registers offset within the devices address range */
>  	prop = of_get_property(np, "reg-shift", &prop_size);
>  	if (prop && (prop_size == sizeof(u32)))
> -		port->regshift = *prop;
> +		port->regshift = be32_to_cpup(prop);
>  
>  	port->irq = irq_of_parse_and_map(np, 0);
>  	port->iotype = UPIO_MEM;
>  	port->type = type;
> -	port->uartclk = *clk;
> +	port->uartclk = clk;
>  	port->flags = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF | UPF_IOREMAP
>  		| UPF_FIXED_PORT | UPF_FIXED_TYPE;
>  	port->dev = &ofdev->dev;
> +
>  	/* If current-speed was set, then try not to change it. */
>  	if (spd)
> -		port->custom_divisor = *clk / (16 * (*spd));
> +		port->custom_divisor = clk / (16 * be32_to_cpup(spd));
>  
>  	return 0;
>  }
> -- 
> 1.5.5.1
> 
