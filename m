From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 7/7] drm/msm/dsi: Parse DSI lanes via DT
Date: Wed, 2 Mar 2016 11:37:08 -0600
Message-ID: <20160302173708.GA5541@rob-hp-laptop>
References: <1456379388-14767-1-git-send-email-architt@codeaurora.org>
 <1456379388-14767-8-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456379388-14767-8-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: robdclark@gmail.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 25, 2016 at 11:19:48AM +0530, Archit Taneja wrote:
> The DSI driver is currently unaware of how the DSI physical data lanes
> are mapped to the logical lanes provided by the DSI controller.
> 
> Create a DT binding "qcom,data-lane-map" that provides this information
> on a given platform.
> 
> The MSM DSI controller is restricted in terms of what all mappings
> it can support. The lane polarity is fixed for all the lanes, the clock
> lanes are fixed, and the data lanes can be swapped among each other only
> for a few combinations. Apply these restrictions when we parse the DT
> data.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---
>  .../devicetree/bindings/display/msm/dsi.txt        |  32 +++++-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/gpu/drm/msm/dsi/dsi_host.c                 | 116 +++++++++++++++++----
>  2 files changed, 125 insertions(+), 23 deletions(-)
