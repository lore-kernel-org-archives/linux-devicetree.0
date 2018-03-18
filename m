From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: phy-qcom-qmp: Update bindings for sdm845
Date: Sun, 18 Mar 2018 07:52:50 -0500
Message-ID: <20180318033246.5zwwhamrspaedbbf@rob-hp-laptop>
References: <1521193500-4696-1-git-send-email-mgautam@codeaurora.org>
 <1521193500-4696-4-git-send-email-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521193500-4696-4-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, Varadarajan Narayanan <varada@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 16, 2018 at 03:14:56PM +0530, Manu Gautam wrote:
> Update compatible strings for USB3 PHYs on SDM845.
> One is QMPv3 DisplayPort-USB combo PHY and other one
> is USB UNI PHY which is single lane USB3 PHY without
> DP capability.
> 
> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
