From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/8 v3] Documentation: bindings: k3dma: Extend the k3dma
 driver binding to support hisi-asp
Date: Thu, 17 Jan 2019 10:06:37 -0600
Message-ID: <20190117160637.GA3498@bogus>
References: <1547141652-8660-1-git-send-email-john.stultz@linaro.org>
 <1547141652-8660-2-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547141652-8660-2-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: lkml <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Tanglei Han <hantanglei@huawei.com>, Ryan Grachek <ryan@edited.us>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Youlin Wang <wwx575822@notesmail.huawei.com>, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, 10 Jan 2019 09:34:05 -0800, John Stultz wrote:
> From: Youlin Wang <wwx575822@notesmail.huawei.com>
> 
> Extend the k3dma driver binding to support hisi-asp hardware
> variants.
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Zhuangluan Su <suzhuangluan@hisilicon.com>
> Cc: Tanglei Han <hantanglei@huawei.com>
> Cc: Ryan Grachek <ryan@edited.us>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: dmaengine@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Youlin Wang <wwx575822@notesmail.huawei.com>
> Signed-off-by: Tanglei Han <hantanglei@huawei.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
> v2: Simplify patch, removing extranious examples
> ---
>  Documentation/devicetree/bindings/dma/k3dma.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
