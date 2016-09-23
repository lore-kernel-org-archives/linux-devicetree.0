From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: drm/bridge: adv7511: Add regulator
 bindings
Date: Fri, 23 Sep 2016 17:31:53 -0500
Message-ID: <20160923223153.GA420@rob-hp-laptop>
References: <1472640730-24326-1-git-send-email-architt@codeaurora.org>
 <1474622430-6704-1-git-send-email-architt@codeaurora.org>
 <1474622430-6704-2-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1474622430-6704-2-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: andy.gross@linaro.org, laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 23, 2016 at 02:50:27PM +0530, Archit Taneja wrote:
> Add the regulator supply properties needed by ADV7511 and ADV7533. The
> regulator names are named after the pin names, except for DVDD_3V on
> ADV7511, which is left v3p3 to have the same name as it's on ADV7533.
> 
> ADV7511 has a BGVDD pin for which the voltage to be configured isn't
> clear. This needs to be updated in the document later.
> 
> The regulators are specified as optional properties since there can
> be boards which have a fixed supply directly routed to the pins, and
> these may not be modelled as regulator supplies.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---
> v2:
> - Specify regulator supplies for ADV7511 too.
> - Have separate supply entries for AVDD, DVDD, PVDD, A2VDD pins.
> - Add additional BGVDD supply for ADV7511.
> 
>  .../devicetree/bindings/display/bridge/adi,adv7511.txt     | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
