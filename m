From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 07/10] dt-bindings: msm/dsi: Use standard data lanes
 binding
Date: Mon, 13 Jun 2016 14:53:28 -0500
Message-ID: <20160613195328.GA22518@rob-hp-laptop>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
 <1465555600-25742-1-git-send-email-architt@codeaurora.org>
 <1465555600-25742-8-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465555600-25742-8-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: robdclark@gmail.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, heiko@sntech.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 10, 2016 at 04:16:37PM +0530, Archit Taneja wrote:
> The "qcom,data-lane-map" binding mentioned in the document is changed to
> the more generic "data-lanes" property specified in:
> 
> Documentation/devicetree/bindings/media/video-interfaces.txt
> 
> The previous binding expressed physical to logical data lane mappings,
> the standard "data-lanes" binding uses logical to physical data lane
> mappings. Update the docs to reflect this change. The example had the
> property incorrectly named as "lanes", update this too.
> 
> The MSM DSI DT bindings aren't used anywhere at the moment, so
> it's okay to update this property.
> 
> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---
>  .../devicetree/bindings/display/msm/dsi.txt        | 37 +++++++++++-----------
>  1 file changed, 19 insertions(+), 18 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
