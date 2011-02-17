From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 5/7] serial: samsung: Get console register defaults
	from device tree
Date: Wed, 16 Feb 2011 17:21:10 -0700
Message-ID: <20110217002110.GB14124@angua.secretlab.ca>
References: <1297514825-10345-1-git-send-email-thomas.abraham@linaro.org>
	<1297514825-10345-6-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1297514825-10345-6-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 12, 2011 at 06:17:03PM +0530, Thomas Abraham wrote:
> The uart ports are used as console and due to console_init, the uart ports
> are initialized prior to the uart driver's probe function is called.
> During this intialization stage, the driver obtains the default port
> register values from the platform data.
> 
> This patch adds support for obtaining the default port register values
> from the device tree. The default values should be specified in the
> 'chosen' node of the device tree.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/tty/serial/samsung.c |   14 ++++++++++++++
>  1 files changed, 14 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
> index 2335eda..66fece9 100644
> --- a/drivers/tty/serial/samsung.c
> +++ b/drivers/tty/serial/samsung.c
> @@ -43,6 +43,7 @@
>  #include <linux/delay.h>
>  #include <linux/clk.h>
>  #include <linux/cpufreq.h>
> +#include <linux/of.h>
>  
>  #include <asm/irq.h>
>  
> @@ -1384,11 +1385,24 @@ static int s3c24xx_serial_init_ports(struct s3c24xx_uart_info **info)
>  	struct s3c24xx_uart_port *ptr = s3c24xx_serial_ports;
>  	struct platform_device **platdev_ptr;
>  	int i;
> +	unsigned int *condefs , len;
> +	struct s3c2410_uartcfg *cfg;
>  
>  	dbg("s3c24xx_serial_init_ports: initialising ports...\n");
>  
>  	platdev_ptr = s3c24xx_uart_devs;
> +	condefs = (u32 *)of_get_property(of_chosen, "console-defaults", &len);

of_get_property returns (const void *) for a reason.  Make condefs a
'const u32 *' instead of overriding the compiler warning.

Pulling the uart configuration out of a console-defaults property in
the chosen node is not the way to do this.  Each uart device should
have its own node in the device tree, and the per-port configuration
belongs there.

g.

> +	if (condefs && (len / sizeof(unsigned int)) == 3) {
> +		for (i = 0; i < CONFIG_SERIAL_SAMSUNG_UARTS; i++) {
> +			cfg = s3c24xx_dev_to_cfg(&(*platdev_ptr)->dev);
> +			cfg->ucon = be32_to_cpu(condefs[0]);
> +			cfg->ulcon = be32_to_cpu(condefs[1]);
> +			cfg->ufcon = be32_to_cpu(condefs[2]);
> +			platdev_ptr++;
> +		}
> +	}
>  
> +	platdev_ptr = s3c24xx_uart_devs;
>  	for (i = 0; i < CONFIG_SERIAL_SAMSUNG_UARTS; i++, ptr++, platdev_ptr++) {
>  		s3c24xx_serial_init_port(ptr, info[i], *platdev_ptr);
>  	}
> -- 
> 1.6.6.rc2
> 
