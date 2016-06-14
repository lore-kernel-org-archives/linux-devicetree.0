From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 08/10] dt-bindings: msm/dsi: Modify port and PHY
 bindings
Date: Tue, 14 Jun 2016 07:31:36 -0500
Message-ID: <20160614123136.GA23365@rob-hp-laptop>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
 <1465555600-25742-1-git-send-email-architt@codeaurora.org>
 <1465555600-25742-9-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465555600-25742-9-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: robdclark@gmail.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, heiko@sntech.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 10, 2016 at 04:16:38PM +0530, Archit Taneja wrote:
> The DSI node now has two ports that describe the connection between the
> MDP interface output and the DSI input, and the connection between the DSI
> output and the connected panel/bridge. Update the properties and the
> example.
> 
> Also, use generic PHY bindings instead of the custom one.
> 
> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---
> v2:
> - Use hyphen for dsi phy name
> 
>  .../devicetree/bindings/display/msm/dsi.txt        | 45 ++++++++++++++++------
>  1 file changed, 34 insertions(+), 11 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
