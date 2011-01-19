From: Thomas Chou <thomas-SDxUXYEhEBiCuPEqFHbRBg@public.gmane.org>
Subject: Re: [PATCH] mtd/of: allow MTD_OF_PARTS and MTD_PHYSMAP_OF config
	to others
Date: Wed, 19 Jan 2011 12:17:07 +0800
Message-ID: <4D3665C3.5080604@wytron.com.tw>
References: <1295408639-14742-1-git-send-email-thomas@wytron.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1295408639-14742-1-git-send-email-thomas-SDxUXYEhEBiCuPEqFHbRBg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Chou <thomas-SDxUXYEhEBiCuPEqFHbRBg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/19/2011 11:43 AM, Thomas Chou wrote:
> As devicetree support is added to more arch, these config should
> be allowed to other arch.

Please ignore this patch, as it is already fixed by Rob Herring.

- Thomas


>
> Signed-off-by: Thomas Chou<thomas-SDxUXYEhEBiCuPEqFHbRBg@public.gmane.org>
> ---
>   drivers/mtd/Kconfig      |    2 +-
>   drivers/mtd/maps/Kconfig |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index 1e2cbf5..b1f7689 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -159,7 +159,7 @@ config MTD_AFS_PARTS
>
>   config MTD_OF_PARTS
>   	tristate "Flash partition map based on OF description"
> -	depends on (MICROBLAZE || PPC_OF)&&  MTD_PARTITIONS
> +	depends on OF&&  MTD_PARTITIONS
>   	help
>   	  This provides a partition parsing function which derives
>   	  the partition map from the children of the flash node,
> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> index a0dd7bb..5d37d31 100644
> --- a/drivers/mtd/maps/Kconfig
> +++ b/drivers/mtd/maps/Kconfig
> @@ -72,7 +72,7 @@ config MTD_PHYSMAP_BANKWIDTH
>
>   config MTD_PHYSMAP_OF
>   	tristate "Flash device in physical memory map based on OF description"
> -	depends on (MICROBLAZE || PPC_OF)&&  (MTD_CFI || MTD_JEDECPROBE || MTD_ROM)
> +	depends on OF&&  (MTD_CFI || MTD_JEDECPROBE || MTD_ROM)
>   	help
>   	  This provides a 'mapping' driver which allows the NOR Flash and
>   	  ROM driver code to communicate with chips which are mapped
