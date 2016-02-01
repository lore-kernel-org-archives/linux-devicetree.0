From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V13 08/10] dma: qcom_hidma: read the channel id from HW
Date: Mon, 1 Feb 2016 09:14:56 -0600
Message-ID: <20160201151455.GA10961@rob-hp-laptop>
References: <1454106914-15857-1-git-send-email-okaya@codeaurora.org>
 <1454106914-15857-9-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454106914-15857-9-git-send-email-okaya@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, marc.zyngier@arm.com, mark.rutland@arm.com, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com, shankerd@codeaurora.org, vikrams@codeaurora.org, eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 29, 2016 at 05:35:11PM -0500, Sinan Kaya wrote:
> Removing the flexibility to choose the event channel as there is no real
> use case right now. We have been using the values in ACPI that match the HW
> defaults. OS is reading the event-channel from the HW register now.
> 
> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
> ---
>  .../devicetree/bindings/dma/qcom_hidma_mgmt.txt    |  3 --
>  drivers/dma/qcom/hidma.c                           | 39 +---------------------
>  2 files changed, 1 insertion(+), 41 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
