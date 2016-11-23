From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v4 3/3] dmaengine: sun6i: share the dma driver with sun50i
Date: Wed, 23 Nov 2016 09:42:37 +0530
Message-ID: <20161123041237.GE2698@localhost>
References: <1479638740-20520-1-git-send-email-hao5781286@gmail.com>
 <1479638740-20520-4-git-send-email-hao5781286@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1479638740-20520-4-git-send-email-hao5781286@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hao Zhang <hao5781286@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, dmaengine@vger.kernel.org, maxime.ripard@free-electrons.com, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Nov 20, 2016 at 06:45:40PM +0800, Hao Zhang wrote:
> Changes the limited buswith to 8 bytes,and add
> the test in sun6i_dma_config function
> 
> Accroding to sun6i dma driver, i think ,if the client
  ^^^^^^^^
typo and other grammatical mistakes here..


> doesn't configure the address width with dmaengine_slave_config
> function, it would use the default width. So we can add the test
> in sun6i_dma_config function called by dmaengine_slave_config,
> and test the configuration whether is support for the device.
> 
> Signed-off-by: Hao Zhang <hao5781286@gmail.com>
> ---
>  drivers/dma/sun6i-dma.c | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index a235878..f7c90b6 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -250,7 +250,7 @@ static inline s8 convert_burst(u32 maxburst)
>  static inline s8 convert_buswidth(enum dma_slave_buswidth addr_width)
>  {
>  	if ((addr_width < DMA_SLAVE_BUSWIDTH_1_BYTE) ||
> -	    (addr_width > DMA_SLAVE_BUSWIDTH_4_BYTES))
> +	    (addr_width > DMA_SLAVE_BUSWIDTH_8_BYTES))
>  		return -EINVAL;
>  
>  	return addr_width >> 1;
> @@ -758,6 +758,18 @@ static int sun6i_dma_config(struct dma_chan *chan,
>  {
>  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
>  
> +	if ((BIT(config->src_addr_width) | chan->device->src_addr_widths) !=
> +		chan->device->src_addr_widths) {

First I dont like coding style here

Second, this is not driver specific, should be move to core..

-- 
~Vinod
