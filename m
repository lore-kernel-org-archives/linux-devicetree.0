From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/8 v4] Documentation: bindings: dma: Add binding for
 dma-channel-mask
Date: Mon, 21 Jan 2019 19:13:28 -0600
Message-ID: <20190122011328.GA1422@bogus>
References: <1547658629-25378-1-git-send-email-john.stultz@linaro.org>
 <1547658629-25378-3-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547658629-25378-3-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: lkml <linux-kernel@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, Vinod Koul <vkoul@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tanglei Han <hantanglei@huawei.com>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Ryan Grachek <ryan@edited.us>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 16 Jan 2019 09:10:23 -0800, John Stultz wrote:
> Some dma channels can be reserved for secure mode or other
> hardware on the SoC, so provide a binding for a bitmask
> listing the available channels for the kernel to use.
> 
> This follows the pre-existing bcm,dma-channel-mask binding.
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Tanglei Han <hantanglei@huawei.com>
> Cc: Zhuangluan Su <suzhuangluan@hisilicon.com>
> Cc: Ryan Grachek <ryan@edited.us>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: dmaengine@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
> v3: Renamed to hisi-dma-avail-chan
> v4: Reworked to generic dma-channel-mask
> ---
>  Documentation/devicetree/bindings/dma/dma.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
