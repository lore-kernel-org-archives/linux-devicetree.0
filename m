From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm, davinci: configure davinci aemif chipselects through
 OF
Date: Sun, 04 Dec 2011 16:25:45 +0400
Message-ID: <4EDB66C9.9050302@mvista.com>
References: <1322991679-20947-1-git-send-email-hs@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322991679-20947-1-git-send-email-hs-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 04-12-2011 13:41, Heiko Schocher wrote:

> Signed-off-by: Heiko Schocher<hs-ynQEQJNshbs@public.gmane.org>
> Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
> Cc: Sekhar Nori<nsekhar-l0cyMroinI0@public.gmane.org>
> Cc: Kevin Hilman<khilman-l0cyMroinI0@public.gmane.org>
> Cc: Wolfgang Denk<wd-ynQEQJNshbs@public.gmane.org>

> diff --git a/arch/arm/mach-davinci/aemif.c b/arch/arm/mach-davinci/aemif.c
> index 1ce70a9..12c559f 100644
> --- a/arch/arm/mach-davinci/aemif.c
> +++ b/arch/arm/mach-davinci/aemif.c
[...]
> @@ -131,3 +138,99 @@ int davinci_aemif_setup_timing(struct davinci_aemif_timing *t,
>   	return 0;
>   }
>   EXPORT_SYMBOL(davinci_aemif_setup_timing);
> +
> +#if defined(CONFIG_OF)
> +static int dv_get_value(struct device_node *np, const char *name)
> +{
> +	const u32 *data;
> +	int len;
> +
> +	data = of_get_property(np, name,&len);
> +	if (data)
> +		return be32_to_cpu(readl(data));

    Why readl() here?! Device tree is not a peripheral device...

> +
> +	return -EINVAL;
> +}

    Isn't there already a standard helper for that, of_property_read_u32()?

WBR, Sergei
