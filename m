From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/1] mtd: m25p80 -- parse partitions from OF tree
Date: Fri, 15 Oct 2010 09:31:45 -0600
Message-ID: <20101015153145.GD2429@angua.secretlab.ca>
References: <1287147208-11588-1-git-send-email-jonas@southpole.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1287147208-11588-1-git-send-email-jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 15, 2010 at 02:53:28PM +0200, Jonas Bonn wrote:
> It needs to be possible to define the partitions of an MTD device from an OF
> devicetree.  This patch adds a call to of_mtd_parse_partitions if:

Thanks Jonas.  I've actually already got a patch that does the exact
ame thing in my private tree.  However, it requires an ugly #ifdef
statement because the of_node pointer is not available when CONFIG_OF
is not selected.  Before I commit to this patch, I want to see if I
can come up with a cleaner way for drivers to reference of_node when
CONFIG_OF is not set.  I could use a macro, but I'd rather not have to
wrap every reference with a macro.

Regardless, it is on my radar, and I hope to settle on a solution
sometime in the next week.

g.

> 
> i)   there are no commandline partitions defined
> ii)  there are no partitions set up by platform_data
> iii) and an of_node is present on the device
> 
> This permits the following devicetree structure:
> 
> flash0: mtd@0 {
> 	compatible = "st,m25p10";
> 	reg = <0>;
> 	spi-max-frequency = <100000000>;
> 
> 	#address-cells = <1>;
> 	#size-cells = <1>;
> 
> 	partition@0 {
> 		label = "bootloader";
> 		reg = <0x00000000 0x00018000>;
> 		read-only;
> 	}
> 
> 	partition@18000 {
> 		label = "data";
> 		reg = <0x00018000 0x00008000>;
> 	};
> };
> 
> Signed-off-by: Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>
> ---
>  drivers/mtd/devices/m25p80.c |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 6f512b5..a349498 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -924,6 +924,10 @@ static int __devinit m25p_probe(struct spi_device *spi)
>  			nr_parts = data->nr_parts;
>  		}
>  
> +		if (nr_parts <= 0 && spi->dev.of_node) {
> +			nr_parts = of_mtd_parse_partitions(&spi->dev, spi->dev.of_node, &parts);
> +		}
> +
>  		if (nr_parts > 0) {
>  			for (i = 0; i < nr_parts; i++) {
>  				DEBUG(MTD_DEBUG_LEVEL2, "partitions[%d] = "
> -- 
> 1.7.1
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
