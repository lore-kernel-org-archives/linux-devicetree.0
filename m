From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 4/7] dt-bindings: phy-qcom-qmp: Update bindings for
 sdm845
Date: Mon, 7 May 2018 09:08:15 -0500
Message-ID: <20180507140815.GA22684@rob-hp-laptop>
References: <1525295174-15995-1-git-send-email-mgautam@codeaurora.org>
 <1525295174-15995-5-git-send-email-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1525295174-15995-5-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, sboyd@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org, evgreen@chromium.org, Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, May 03, 2018 at 02:36:11AM +0530, Manu Gautam wrote:
> Update compatible strings for USB3 PHYs on SDM845.
> One is QMPv3 DisplayPort-USB combo PHY and other one
> is USB UNI PHY which is single lane USB3 PHY without
> DP capability. While at it also remove "qcom,qmp-v3-usb3-phy"
> compatible string which was earlier added for sdm845
> only as there wouldn't be any user of same.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
