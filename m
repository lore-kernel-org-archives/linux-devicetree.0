From: Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v7 2/4] phy: General struct and field cleanup
Date: Thu, 28 Jun 2018 09:18:42 +0530
Message-ID: <142adec8-9d2c-e47d-3bb6-21334b0beb86@codeaurora.org>
References: <20180619083647.10116-1-cang@codeaurora.org>
 <20180619083647.10116-3-cang@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619083647.10116-3-cang@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Can Guo <cang@codeaurora.org>, subhashj@codeaurora.org, asutoshd@codeaurora.org, vivek.gautam@codeaurora.org, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 6/19/2018 2:06 PM, Can Guo wrote:
> Move MSM8996 specific PHY vreg list struct name to a genernal one as it is
> used by all PHYs. Add a specific field to handle dual lane situation.
> 
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)

Reviewed-by: Manu Gautam <mgautam@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
