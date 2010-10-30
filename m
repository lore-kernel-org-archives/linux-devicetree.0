From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: mtd: fix build error in m25p80.c
Date: Sat, 30 Oct 2010 06:57:37 +0100
Message-ID: <20101030055737.GA2456@angua.secretlab.ca>
References: <20101029210419.70f99e96@queued.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101029210419.70f99e96-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mingkai Hu <Mingkai.hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 29, 2010 at 09:04:19PM -0700, Andres Salomon wrote:
> 
> While building an x86 distro kernel, I hit the following:
> 
> Kernel: arch/x86/boot/bzImage is ready  (#7)
> ERROR: "of_mtd_parse_partitions" [drivers/mtd/devices/m25p80.ko]
> undefined!
> 
> of_mtd_parse_partitions is defined with MTD_OF_PARTS, and that's only
> built on PPC and microblaze.  The code in question should be wrapped w/
> a stricter #ifdef.
> 
> Signed-off-by: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
> ---
>  drivers/mtd/devices/m25p80.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index ea22520..184ddd5 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -924,7 +924,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
>  			nr_parts = data->nr_parts;
>  		}
>  
> -#ifdef CONFIG_OF
> +#ifdef CONFIG_MTD_OF_PARTS
>  		if (nr_parts <= 0 && spi->dev.of_node) {
>  			nr_parts = of_mtd_parse_partitions(&spi->dev,
>  					spi->dev.of_node, &parts);

True; but CONFIG_MTD_OF_PARTS should be built on all architectures
when CONFIG_OF & CONFIG_MTD_PARTITIONS is set.  I'll craft a patch.

g.
