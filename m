From: cang@codeaurora.org
Subject: Re: [PATCH v1 0/2] Support for Qualcomm UFS QMP PHY on SDM845
Date: Wed, 21 Mar 2018 10:42:21 +0800
Message-ID: <c14de7cf5c497de1d3ee1b0217438116@codeaurora.org>
References: <20180320113051.14444-1-cang@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180320113051.14444-1-cang@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: subhashj@codeaurora.org, asutoshd@codeaurora.org, vivek.gautam@codeaurora.org, mgautam@codeaurora.org, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2018-03-20 19:30, Can Guo wrote:
> This patch series adds support for UFS QMP PHY on SDM845 and updates 
> the
> compitable string for it.
> 
> Can Guo (2):
>   phy: Add QMP phy based UFS phy support for sdm845
>   dt-bindings: phy-qcom-qmp: Update UFS phy compitable string for 
> sdm845
> 
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt       |   3 +-
>  drivers/phy/qualcomm/phy-qcom-qmp.c                | 120 
> ++++++++++++++++++++-
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   8 ++
>  3 files changed, 128 insertions(+), 3 deletions(-)
