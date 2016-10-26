From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V6 01/10] Documentation: DT: qcom_hidma: update binding
 for MSI
Date: Wed, 26 Oct 2016 16:45:12 -0500
Message-ID: <20161026214512.ofwbxnl2d46n6ef5@rob-hp-laptop>
References: <1476899512-20431-1-git-send-email-okaya@codeaurora.org>
 <1476899512-20431-2-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1476899512-20431-2-git-send-email-okaya@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 19, 2016 at 01:51:43PM -0400, Sinan Kaya wrote:
> Adding a new binding for qcom,hidma-1.1 to distinguish HW supporting
> MSI interrupts from the older revision.
> 
> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Please add acks when posting new versions.

Rob
