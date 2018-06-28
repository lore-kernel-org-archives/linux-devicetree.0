From: Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v7 1/4] phy: Update PHY power control sequence
Date: Thu, 28 Jun 2018 09:19:39 +0530
Message-ID: <bd1ceedd-25db-7105-6005-c38678b10584@codeaurora.org>
References: <20180619083647.10116-1-cang@codeaurora.org>
 <20180619083647.10116-2-cang@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619083647.10116-2-cang@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Can Guo <cang@codeaurora.org>, subhashj@codeaurora.org, asutoshd@codeaurora.org, vivek.gautam@codeaurora.org, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 6/19/2018 2:06 PM, Can Guo wrote:
> All PHYs should be powered on before register configuration starts. And
> only PCIe PHYs need an extra power control before deasserts reset state.
> 
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)

Reviewed-by: Manu Gautam <mgautam@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
