From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: phy-qcom-qmp: Fix several mistakes from
 prior commits
Date: Wed, 17 Oct 2018 19:38:33 -0500
Message-ID: <20181018003833.GA573@bogus>
References: <20181012213632.252346-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181012213632.252346-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Can Guo <cang@codeaurora.org>, evgreen@chromium.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Manu Gautam <mgautam@codeaurora.org>, linux-arm-msm@vger.kernel.org, sayalil@codeaurora.org, Varadarajan Narayanan <varada@codeaurora.org>, asutoshd@codeaurora.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, 12 Oct 2018 14:36:32 -0700, Douglas Anderson wrote:
> Digging through the "phy-qcom-qmp" showed me many inconsistencies
> between the bindings and the reality of the driver.  Let's fix them
> all.
> 
> * In commit 2d66eab18375 ("dt-bindings: phy: qmp: Add support for QMP
>   phy in IPQ8074") we probably should have explicitly listed that
>   there are no clocks for this PHY and also added the reset names in
>   alphabetical order.  You can see that there are no clocks in the
>   driver where "clk_list" is NULL.
> 
> * In commit 8587b220f05e ("dt-bindings: phy-qcom-qmp: Update bindings
>   for QMP V3 USB PHY") we probably should have listed the resets for
>   this new PHY and also removed the "(Optional)" marking for the "cfg"
>   reset since PHYs that need "cfg" really do need it.  It's just that
>   not all PHYs need it.
> 
> * In commit 7f0802074120 ("dt-bindings: phy-qcom-qmp: Update bindings
>   for sdm845") we forgot to update one instance of the string
>   "qcom,qmp-v3-usb3-phy" to be "qcom,sdm845-qmp-usb3-phy".  Let's fix
>   that.  We should also have added "qcom,sdm845-qmp-usb3-uni-phy" to
>   the clock-names and reset-names lists.
> 
> * In commit 99c7c7364b71 ("dt-bindings: phy-qcom-qmp: Add UFS phy
>   compatible string for sdm845") we should have added the set of
>   clocks and resets for "qcom,sdm845-qmp-ufs-phy".  These were taken
>   from the driver.
> 
> * Cleanup the wording for what properties child nodes have to make it
>   more obvious which types of PHYs need clocks and resets.  This was
>   sorta implicit in the "-names" description but I found myself
>   confused.
> 
> * As per the code not all "pcie qmp phys" have resets.  Specifically
>   note that the "has_lane_rst" property in the driver is false for
>   "ipq8074-qmp-pcie-phy".  Thus make it clear exactly which PHYs need
>   child nodes with resets.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt  | 31 ++++++++++++++-----
>  1 file changed, 23 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
