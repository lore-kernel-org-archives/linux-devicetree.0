From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: add stub of_get_child_by_name for non-OF builds
Date: Mon, 08 Oct 2012 08:47:45 -0500
Message-ID: <5072D981.7090801@gmail.com>
References: <1349631654-20931-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1349631654-20931-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/07/2012 12:40 PM, Olof Johansson wrote:
> Fixes build error on s3c6400_defconfig, introduced by commit
> 06455bbcab76e5f5225de5f38ab948d37a1c3587, "dt/s3c64xx/spi: Use
> of_get_child_by_name to get a named child".
> 
> drivers/spi/spi-s3c64xx.c: In function 's3c64xx_get_slave_ctrldata':
> drivers/spi/spi-s3c64xx.c:838:2: error: implicit declaration of function
>     'of_get_child_by_name' [-Werror=implicit-function-declaration]
> 
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> ---

Applied, thanks.

Rob

>  include/linux/of.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 72843b7..b4e50d5 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -331,6 +331,13 @@ static inline bool of_have_populated_dt(void)
>  #define for_each_child_of_node(parent, child) \
>  	while (0)
>  
> +static inline struct device_node *of_get_child_by_name(
> +					const struct device_node *node,
> +					const char *name)
> +{
> +	return NULL;
> +}
> +
>  static inline int of_get_child_count(const struct device_node *np)
>  {
>  	return 0;
> 
