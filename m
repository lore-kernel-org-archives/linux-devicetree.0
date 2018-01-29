From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 7/7] dt-bindings: display: msm/dsi: Add updates for SDM845
Date: Mon, 29 Jan 2018 11:16:24 -0600
Message-ID: <20180129171624.bgdivutm3ecbt3ed@rob-hp-laptop>
References: <20180117093448.4102-1-architt@codeaurora.org>
 <20180117093448.4102-8-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180117093448.4102-8-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: robdclark@gmail.com, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, latkinso@codeaurora.org, sibis@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 17, 2018 at 03:04:48PM +0530, Archit Taneja wrote:
> SDM845 uses a newer revision (v2.0+) of the 6G DSI controller. This
> revision has another clock input at the block boundary called the byte
> interface clock. Specify this new clock in the binding.
> 
> A 10nm DSI PHY is used along with the controller. Add a compatible
> string for it and specify its base address/regulator supply needs.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi.txt | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
