From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] watchdog: s3c2410: Add support for device tree based
	probe
Date: Mon, 07 Feb 2011 13:27:49 -0600
Message-ID: <4D5047B5.7090503@gmail.com>
References: <1296998250-21856-1-git-send-email-thomas.abraham@linaro.org>
	<1296998250-21856-5-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1296998250-21856-5-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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

Thomas,

On 02/06/2011 07:17 AM, Thomas Abraham wrote:
> This patch adds the of_match_table to enable s3c2410-wdt driver
> to be probed when watchdog device node is found in the device tree.
>
> Signed-off-by: Thomas Abraham<thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>   drivers/watchdog/s3c2410_wdt.c |   10 ++++++++++
>   1 files changed, 10 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index ae53662..a9edd50 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -592,6 +592,13 @@ static int s3c2410wdt_resume(struct platform_device *dev)
>   #define s3c2410wdt_resume  NULL
>   #endif /* CONFIG_PM */
>
> +#ifdef CONFIG_OF
> +static const struct of_device_id s3c2410_wdt_match[] = {
> +	{ .compatible = "samsung,s3c2410-wdt" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
> +#endif
>
>   static struct platform_driver s3c2410wdt_driver = {
>   	.probe		= s3c2410wdt_probe,
> @@ -602,6 +609,9 @@ static struct platform_driver s3c2410wdt_driver = {
>   	.driver		= {
>   		.owner	= THIS_MODULE,
>   		.name	= "s3c2410-wdt",
> +#ifdef CONFIG_OF
> +		.of_match_table	= s3c2410_wdt_match,
> +#endif

The ifdefs aren't necessary if you pick-up Grant's patch in 
devicetree/next branch.

Rob
