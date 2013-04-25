From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] of: Set the DMA mask to 64 bits on ARM LPAE systems
Date: Thu, 25 Apr 2013 14:33:15 +0100
Message-ID: <20130425133315.GA7157@localhost.cambridge.arm.com>
References: <1366764649-10342-1-git-send-email-lauraa@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1366764649-10342-1-git-send-email-lauraa@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Laura Abbott <lauraa@codeaurora.org>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 24, 2013 at 01:50:49AM +0100, Laura Abbott wrote:
> By default on ARM systems, the coherent DMA mask (lowest
> address) is set to ~0 or 0xFFFFFFFFFFFFFFFF. Currently,
> of_platform_device_create_pdata sets the coherent DMA mask to
> 32 bits. This prevents coherent dma allocations from working by default
> without clients setting the DMA mask. Rather than make every client
> on an LPAE system set the mask, set the mask to a 64 bit value on
> ARM LPAE systems.
> 
> Signed-off-by: Laura Abbott <lauraa@codeaurora.org>
> ---
>  drivers/of/platform.c |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 0970505..18b69c1 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -214,7 +214,11 @@ struct platform_device *of_platform_device_create_pdata(
>  #if defined(CONFIG_MICROBLAZE)
>  	dev->archdata.dma_mask = 0xffffffffUL;
>  #endif
> +#ifdef CONFIG_ARM_LPAE
> +	dev->dev.coherent_dma_mask = DMA_BIT_MASK(64);
> +#else
>  	dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
> +#endif

I wouldn't add CONFIG_ARM_LPAE checks in here, you can use
CONFIG_ARCH_DMA_ADDR_T_64BIT (types.h uses this for the dma_addr_t
definition).

-- 
Catalin
