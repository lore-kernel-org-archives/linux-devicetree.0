From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v4 2/2] dma: sprd: Add Spreadtrum DMA driver
Date: Mon, 23 Oct 2017 10:01:11 +0800
Message-ID: <CAMz4kuKTWz86rv1WsGNxcssfK_7uHxw0=XwcqFZEFM=vo0nuQg@mail.gmail.com>
References: <84d9f80ce9853ae8441ef91e8701ba516db8f697.1507612144.git.baolin.wang@spreadtrum.com>
 <6c3036ce14d776452bd8526c0ea9541880a43541.1507612144.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6c3036ce14d776452bd8526c0ea9541880a43541.1507612144.git.baolin.wang@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@spreadtrum.com>
Cc: Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

On 10 October 2017 at 13:23, Baolin Wang <baolin.wang@spreadtrum.com> wrote:
> This patch adds the DMA controller driver for Spreadtrum SC9860 platform.
>
> Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
> ---
> Changes since v3:
>  - Remove redundant local 'mask' and 'val' variables.
>  - Simplify sprd_dma_get_req_type() function.
>  - Change pm_runtime_put_sync() to pm_runtime_put() in probe function.
>  - Simplify sizeof function.
>  - Other coding style fixes.
>
> Changes since v2:
>  - Add COMPILE_TEST as dependency.
>  - Renamed DMA macro definition properly.
>  - Add sprd_dma_chn_update() helpers to save lots of code.
>  - Change pm_runtime_put_sync() to pm_runtime_put() when free resources.
>  - Re-implement the sprd_dma_tx_status() function.
>  - Free irq and kill tasklet when remove driver.
>  - Add some documentaion.
>  - Change to module_init() level and add MODULE_ALIAS().
>  - Other coding style fixes.
>
> Changes since v1:
>  - Use virt-dma to manage dma descriptors.
>  - Remove link-list and channel-start-channel Spreadtrum special features.
>  - Remove device_config implementation.
>  - Other optimization.
>
> Note: This patch just implemented the basic DMA_MEMCPY function, and in
> future we will send new patches to introduce some Speadtrum special features,
> that will be talk about how to handle these features easily instead of in one
> big patch which is hard to review.
> ---

Do you have any comments for this version patchset? If not, could you
apply this patchset into your branch? Thanks.

-- 
Baolin.wang
Best Regards
