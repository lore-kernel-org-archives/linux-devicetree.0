From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/7] mmc: make the reference to sdhci_tegra_dt_pdata
	conditional
Date: Tue, 15 Mar 2011 01:58:59 -0600
Message-ID: <20110315075859.GL23050@angua.secretlab.ca>
References: <1300112759-3495-1-git-send-email-shawn.guo@linaro.org>
	<1300112759-3495-4-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1300112759-3495-4-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 14, 2011 at 10:25:55PM +0800, Shawn Guo wrote:
> Wrap tegra dt_id with CONFIG_MMC_SDHCI_TEGRA to make the reference to
> sdhci_tegra_dt_pdata conditional, otherwise it will stop build for
> other mmc driver when OF is enabled.
> 
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Looks right to me.

g.

> ---
>  drivers/mmc/host/sdhci-pltfm.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-pltfm.c b/drivers/mmc/host/sdhci-pltfm.c
> index ccc04ac..4125fbf 100644
> --- a/drivers/mmc/host/sdhci-pltfm.c
> +++ b/drivers/mmc/host/sdhci-pltfm.c
> @@ -52,7 +52,9 @@ static struct sdhci_ops sdhci_pltfm_ops = {
>  #if defined(CONFIG_OF)
>  #include <linux/of_device.h>
>  static const struct of_device_id sdhci_dt_ids[] = {
> +#ifdef CONFIG_MMC_SDHCI_TEGRA
>  	{ .compatible = "nvidia,tegra250-sdhci", .data = &sdhci_tegra_dt_pdata },
> +#endif
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, sdhci_dt_ids);
> -- 
> 1.7.1
> 
