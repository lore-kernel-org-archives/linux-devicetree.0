From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/5] dmaengine: qcom: bam_dma: add controlled remotely
 dt property
Date: Thu, 7 Apr 2016 12:57:52 -0500
Message-ID: <20160407175752.GM32257@rob-hp-laptop>
References: <1459896982-30171-1-git-send-email-stanimir.varbanov@linaro.org>
 <1459896982-30171-4-git-send-email-stanimir.varbanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1459896982-30171-4-git-send-email-stanimir.varbanov@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Sinan Kaya <okaya@codeaurora.org>, dmaengine@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Pramod Gurav <gpramod@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 06, 2016 at 01:56:20AM +0300, Stanimir Varbanov wrote:
> Some of the peripherals has bam which is controlled by remote
> processor, thus the bam dma driver must avoid register writes
> which initialise bam hw block. Those registers are protected
> from xPU block and any writes to them will lead to secure
> violation and system reboot.
> 
> Adding the contolled_remotely flag in bam driver to avoid
> not permitted register writes in bam_init function.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Reviewed-by: Andy Gross <andy.gross@linaro.org>
> ---
>  Documentation/devicetree/bindings/dma/qcom_bam_dma.txt | 2 ++
>  drivers/dma/qcom/bam_dma.c                             | 7 +++++++
>  2 files changed, 9 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>

On being a separate patch, yes that is always the preference. However, 
this change is so small it doesn't matter to me. But this is going in 
thru Vinod's tree, so it is his call.

Rob
