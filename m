From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] dma: qcom_hidma: read the channel id from HW
Date: Fri, 18 Mar 2016 15:06:17 -0500
Message-ID: <20160318200617.GA28108@rob-hp-laptop>
References: <1457732994-11175-1-git-send-email-okaya@codeaurora.org>
 <1457732994-11175-5-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457732994-11175-5-git-send-email-okaya@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com, shankerd@codeaurora.org, vikrams@codeaurora.org, marc.zyngier@arm.com, mark.rutland@arm.com, eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 11, 2016 at 04:49:54PM -0500, Sinan Kaya wrote:
> Removing the flexibility to choose the event channel as there is no real
> use case right now. We have been using the values in ACPI that match the HW
> defaults. OS is reading the event-channel from the HW register now.
> 
> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
> ---
>  .../devicetree/bindings/dma/qcom_hidma_mgmt.txt    |  3 --

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/dma/qcom/hidma.c                           | 39 +---------------------
>  2 files changed, 1 insertion(+), 41 deletions(-)
