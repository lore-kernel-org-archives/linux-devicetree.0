From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2] tty: use of_match_ptr() for of_match_table entry
Date: Thu, 29 Sep 2011 19:33:19 -0600
Message-ID: <20110930013319.GA13799@ponder.secretlab.ca>
References: <1312362703-10189-1-git-send-email-ben-linux@fluff.org>
	<1312362703-10189-3-git-send-email-ben-linux@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1312362703-10189-3-git-send-email-ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 03, 2011 at 10:11:43AM +0100, Ben Dooks wrote:
> Use the new of_match_ptr() macro for the of_match_table
> pointer entry to avoid having to #dfine match NULL
> 
> Signed-off-by: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>

Took me a while, but applied both, thanks.

g.

> ---
>  drivers/tty/serial/altera_jtaguart.c |    4 +---
>  drivers/tty/serial/altera_uart.c     |    4 +---
>  drivers/tty/serial/uartlite.c        |    4 +---
>  3 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/tty/serial/altera_jtaguart.c b/drivers/tty/serial/altera_jtaguart.c
> index 60e049b..2075200 100644
> --- a/drivers/tty/serial/altera_jtaguart.c
> +++ b/drivers/tty/serial/altera_jtaguart.c
> @@ -472,8 +472,6 @@ static struct of_device_id altera_jtaguart_match[] = {
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, altera_jtaguart_match);
> -#else
> -#define altera_jtaguart_match NULL
>  #endif /* CONFIG_OF */
>  
>  static struct platform_driver altera_jtaguart_platform_driver = {
> @@ -482,7 +480,7 @@ static struct platform_driver altera_jtaguart_platform_driver = {
>  	.driver	= {
>  		.name		= DRV_NAME,
>  		.owner		= THIS_MODULE,
> -		.of_match_table	= altera_jtaguart_match,
> +		.of_match_table	= of_match_ptr(altera_jtaguart_match),
>  	},
>  };
>  
> diff --git a/drivers/tty/serial/altera_uart.c b/drivers/tty/serial/altera_uart.c
> index 50bc5a5..0abd31d 100644
> --- a/drivers/tty/serial/altera_uart.c
> +++ b/drivers/tty/serial/altera_uart.c
> @@ -616,8 +616,6 @@ static struct of_device_id altera_uart_match[] = {
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, altera_uart_match);
> -#else
> -#define altera_uart_match NULL
>  #endif /* CONFIG_OF */
>  
>  static struct platform_driver altera_uart_platform_driver = {
> @@ -626,7 +624,7 @@ static struct platform_driver altera_uart_platform_driver = {
>  	.driver	= {
>  		.name		= DRV_NAME,
>  		.owner		= THIS_MODULE,
> -		.of_match_table	= altera_uart_match,
> +		.of_match_table	= of_match_ptr(altera_uart_match),
>  	},
>  };
>  
> diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
> index 8af1ed8..0aed022 100644
> --- a/drivers/tty/serial/uartlite.c
> +++ b/drivers/tty/serial/uartlite.c
> @@ -568,8 +568,6 @@ static struct of_device_id ulite_of_match[] __devinitdata = {
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, ulite_of_match);
> -#else /* CONFIG_OF */
> -#define ulite_of_match NULL
>  #endif /* CONFIG_OF */
>  
>  static int __devinit ulite_probe(struct platform_device *pdev)
> @@ -609,7 +607,7 @@ static struct platform_driver ulite_platform_driver = {
>  	.driver = {
>  		.owner = THIS_MODULE,
>  		.name  = "uartlite",
> -		.of_match_table = ulite_of_match,
> +		.of_match_table = of_match_ptr(ulite_of_match),
>  	},
>  };
>  
> -- 
> 1.7.1
> 
