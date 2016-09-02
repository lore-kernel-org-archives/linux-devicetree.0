From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: drm/bridge: adv7511: Add regulators for
 ADV7533
Date: Fri, 2 Sep 2016 10:56:11 -0500
Message-ID: <20160902155611.GA4226@rob-hp-laptop>
References: <1472640730-24326-1-git-send-email-architt@codeaurora.org>
 <1472640730-24326-2-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1472640730-24326-2-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 31, 2016 at 04:22:08PM +0530, Archit Taneja wrote:
> Add the regulator supply properties needed for ADV7533. The regulator
> names are named after the pin names. The exact use of each supply isn't
> clear from the data sheets.
> 
> The regulators are specified as optional properties since there can
> be boards which have a fixed supply directly routed to the pins, and
> these may not be modelled as regulator supplies.
> 
> There might be a similar set of regulators for ADV7511, but we don't
> have the docs at the moment to find out what supplies it needs. The
> regulator properties needed by ADV7511 can be updated as we get more
> data on it.

The ADV7510 is available and there's a pinout comparison with the 7511:

http://www.analog.com/media/en/technical-documentation/evaluation-documentation/ADV7510_to_ADV7511_differences.pdf

These 2 seem to have the same supplies...

> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
> index 6532a59..669b6f2 100644
> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
> @@ -56,6 +56,12 @@ Optional properties:
>  - adi,disable-timing-generator: Only for ADV7533. Disables the internal timing
>    generator. The chip will rely on the sync signals in the DSI data lanes,
>    rather than generate its own timings for HDMI output.
> +- avdd-supply: Only for ADV7533. A 1.8V supply that powers up the AVDD, DVDD
> +  PVDD and A2VDD pins on the chip.

This sounds wrong. Each input to the chip should be a property even if 
they are typically from the same supply.

The 7511 has DVDD, AVDD, and PVDD.

> +- v1p2-supply: Only for ADV7533. A supply that powers up the V1P2 pin on the
> +  chip. Can be either 1.2V or 1.8V.

This appears to be 7533 specific.

> +- v3p3-supply: Only for ADV7533. A 3.3V supply that powers up the V3P3 pin on
> +  the chip.

DVDD_3V on 7511

7510/7511 also have BGVDD (for Bandgap). Not clear what the voltage is.

Rob
