From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: sn65dsi86: Add panel-hpd-delay
Date: Sun, 21 Oct 2018 12:06:56 +0300
Message-ID: <7337055.Mnli2TfP4b@avalon>
References: <20181019201940.138179-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181019201940.138179-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Sandeep Panda <spanda@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, linux-arm-msm@vger.kernel.org, jsanka@codeaurora.org, ryandcase@chromium.org, Andrzej Hajda <a.hajda@samsung.com>, Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Douglas,

Thank you for the patch.

On Friday, 19 October 2018 23:19:39 EEST Douglas Anderson wrote:
> The timing diagram of some eDP panels says that you're supposed to
> wait for HPD to be asserted before the aux channel is operational.
> 
> In some cases, however, it's better to just hardcode the max delay
> instead of trying to use HPD.  Why?
> 
> The sn65dsi86 datasheet says that it only reports the debounced
> HPD signal to software.  It will tell software about HPD assertion
> as quickly as 100 ms after it's asserted, but sometimes it might
> take 400 ms because it's timed with a very inaccurate ring
> oscillator.  In practice it was measured at 200 ms on at least
> one system.
> 
> On a particular panel, HPD was asserted 84 ms after power was given.
> This same panel specified that HPD would always be asserted within
> 200 ms of applying power.  Thus on this panel with the measured
> 84 ms to assert HPD + the 200 ms measured debounce we'd wait 284 ms
> which is 84 ms longer than just hardcoding the sleep.
> 
> Let's allow boards to explicitly choose the hardcoded delay by adding
> a device tree attribute for it.  A few notes:
> a) This delay can't easily be in the panel bindings because the delay
>    wouldn't actually be needed if the same panel were hooked somewhere
>    else (someplace with more sane HPD behavior).

The delay shouldn't be handled in the panel driver, but I think it's still a 
property of the panel, and should thus be specified in the panel DT node. The 
panel driver should parse it from DT (or, if the panel driver knows about the 
specific panel model, just hardcode it), and then report it to the bridge 
driver which can then decide, based on its knowledge if the bridge internal 
HPD processing delays, to just wait for a fixed delay or use regular HPD 
handling.

> b) The nice thing about being able to set this delay is that it's also
>    useful on boards where HPD wasn't hooked up at all (for whatever
>    reason).
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  .../bindings/display/bridge/ti,sn65dsi86.txt          | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt index
> 0a3fbb53a16e..1a1ca0f7a1d8 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
> @@ -33,6 +33,15 @@ Optional properties:
> 
>  - suspend-gpios: specification for GPIO1 pin on bridge (active low)
> 
> +- ti,panel-hpd-delay-ms: Assume that HPD from the panel will be asserted
> within
> +			 this many milliseconds after giving power to the panel.
> +			 With this number we can ignore the HPD signal from
> +			 the panel and just hardcode a delay.  This is useful
> +			 to do because the bridge chip only provides the
> +			 debounced HPD signal to software and the timing of the
> +			 debounce is very inaccurate so it's often faster to
> +			 hardcode the max from the panel spec.
> +
>  Required nodes:
>  This device has two video ports. Their connections are modelled using the
>  OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> @@ -62,6 +71,8 @@ edp-bridge@2d {
>  	clock-names = "refclk";
>  	clocks = <&input_refclk>;
> 
> +	ti,panel-hpd-delay-ms = <200>;
> +
>  	ports {
>  		#address-cells = <1>;
>  		#size-cells = <0>;

-- 
Regards,

Laurent Pinchart
