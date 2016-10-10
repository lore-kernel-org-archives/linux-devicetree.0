From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V5 01/10] Documentation: DT: qcom_hidma: update binding
 for MSI
Date: Mon, 10 Oct 2016 10:05:25 -0500
Message-ID: <20161010150525.GA27057@rob-hp-laptop>
References: <1475817915-11976-1-git-send-email-okaya@codeaurora.org>
 <1475817915-11976-2-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1475817915-11976-2-git-send-email-okaya@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 07, 2016 at 01:25:06AM -0400, Sinan Kaya wrote:
> Adding a new binding for qcom,hidma-1.1 to distinguish HW supporting
> MSI interrupts from the older revision.
> 
> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
