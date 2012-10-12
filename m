From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: bcm476x: Add infrastructure
Date: Fri, 12 Oct 2012 09:06:51 +0200
Message-ID: <20121012070651.GA17511@glitch>
References: <20121007015300.828366635@gmail.com>
 <20121007015405.958959522@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121007015405.958959522-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thomas,

On Sun, Oct 07, 2012 at 03:53:01AM +0200, Domenico Andreoli wrote:
>
> Index: b/arch/arm/mach-bcm476x/bcm476x.c
> ===================================================================
> --- /dev/null
> +++ b/arch/arm/mach-bcm476x/bcm476x.c
...
> +
> +#define BCM476X_PERIPH_PHYS   0x00080000
> +#define BCM476X_PERIPH_VIRT   0xd0080000

Are you sure I should use IOMEM() here? The only place I use these macros
is here below, for which I should add a cast to silent the compiler. All
the other accesses go throught ioremap/readl/writel, if not I want to fix it.

> +
> +static struct map_desc io_map __initdata = {
> +	.virtual = BCM476X_PERIPH_VIRT,
> +	.pfn = __phys_to_pfn(BCM476X_PERIPH_PHYS),
> +	.length = BCM476X_PERIPH_SIZE,
> +	.type = MT_DEVICE,
> +};

Regards,
Domenico
