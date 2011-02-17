From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 4/7] watchdog: s3c2410: Add support for device tree
	based probe
Date: Wed, 16 Feb 2011 17:17:32 -0700
Message-ID: <20110217001732.GA14124@angua.secretlab.ca>
References: <1297514825-10345-1-git-send-email-thomas.abraham@linaro.org>
	<1297514825-10345-5-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1297514825-10345-5-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 12, 2011 at 06:17:02PM +0530, Thomas Abraham wrote:
> This patch adds the of_match_table to enable s3c2410-wdt driver
> to be probed when watchdog device node is found in the device tree.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/watchdog/s3c2410_wdt.c |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)

Need to add documentation for compatible = "samsung,s3c2410-wdt" to
Documentation/devicetree/bindings/wdt before this patch can be merged.

A couple more comments below, but I'm okay with this one.  I'd go
ahead and submit it to the linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org list and cc:
Wim.  It can be mainlined right away after fixing up the comments.
I'll ack it when you repost and then work out with Wim if it should be
merged through his tree or through mine.

> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index ae53662..a9edd50 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -592,6 +592,13 @@ static int s3c2410wdt_resume(struct platform_device *dev)
>  #define s3c2410wdt_resume  NULL
>  #endif /* CONFIG_PM */
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id s3c2410_wdt_match[] = {
> +	{ .compatible = "samsung,s3c2410-wdt" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
> +#endif

#else
#define s3c2410_wdt_match NULL
#endif

>  
>  static struct platform_driver s3c2410wdt_driver = {
>  	.probe		= s3c2410wdt_probe,
> @@ -602,6 +609,9 @@ static struct platform_driver s3c2410wdt_driver = {
>  	.driver		= {
>  		.owner	= THIS_MODULE,
>  		.name	= "s3c2410-wdt",
> +#ifdef CONFIG_OF
> +		.of_match_table	= s3c2410_wdt_match,
> +#endif

The #ifdef can be dropped here now.  .of_match_table is no longer conditional.


>  	},
>  };
>  
> -- 
> 1.6.6.rc2
> 
