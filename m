From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 3/5] ARM: davinci_all_defconfig: enable iio and ADS7950
Date: Mon, 9 Jan 2017 17:59:35 +0530
Message-ID: <cb9455bc-2658-9826-823b-2aa845237fed@ti.com>
References: <1483677228-2325-1-git-send-email-david@lechnology.com>
 <1483677228-2325-4-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1483677228-2325-4-git-send-email-david@lechnology.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Lechner <david@lechnology.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Friday 06 January 2017 10:03 AM, David Lechner wrote:
> This enables the iio subsystem and the TI ADS7950 driver. This is used by
> LEGO MINDSTORMS EV3, which has an ADS7957 chip.

Can you add your sign-off?

> ---
> 
> The CONFIG_TI_ADS7950 driver is currently in iio/testing, so some coordination
> may be needed before picking up this patch.
> 
>  arch/arm/configs/davinci_all_defconfig | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
> index 2b1967a..a899876 100644
> --- a/arch/arm/configs/davinci_all_defconfig
> +++ b/arch/arm/configs/davinci_all_defconfig
> @@ -200,6 +200,13 @@ CONFIG_TI_EDMA=y
>  CONFIG_MEMORY=y
>  CONFIG_TI_AEMIF=m
>  CONFIG_DA8XX_DDRCTL=y
> +CONFIG_IIO=m
> +CONFIG_IIO_BUFFER_CB=m
> +CONFIG_IIO_SW_DEVICE=m
> +CONFIG_IIO_SW_TRIGGER=m

> +CONFIG_TI_ADS7950=m

Can you separate this from rest of the patch. I would like to enable
this option only after I can find the symbol in linux-next.

> +CONFIG_IIO_HRTIMER_TRIGGER=m
> +CONFIG_IIO_SYSFS_TRIGGER=m

Need CONFIG_IIO_TRIGGER=y also for these two options to take effect.

Thanks,
Sekhar
