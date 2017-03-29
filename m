From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] clk: qcom: Elaborate on "active" clocks in the RPM
 clock bindings
Date: Tue, 28 Mar 2017 19:59:43 -0500
Message-ID: <20170329005943.xqs6ouqbqwdzaayf@rob-hp-laptop>
References: <20170322081842.20495-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170322081842.20495-1-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 22, 2017 at 09:18:42AM +0100, Linus Walleij wrote:
> The concept of "active" clocks is just explained in a bried comment in the
> device driver, let's explain it a bit more in the device tree bindings
> so everyone understands this.
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> index d470a0187035..cf80a00b7ff2 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> @@ -18,6 +18,14 @@ Required properties :
>  
>  - #clock-cells : shall contain 1
>  
> +The clock enumerators are defined in <dt-bindings/clock/qcom,rpmcc.h>
> +and come in pairs: FOO_CLK followed by FOO_A_CLK. The latter clock
> +is an "active" clock, which means that the consumer only care that the
> +clock is available when the system is active, i.e. not suspended. If
> +it is important that the clock keeps running during system suspend,
> +you need to specify the non-active clock, the one not containing
> +*_A_* in the enumerator name.
> +

Sounds like abuse as the clock id is encoding policy into it. The number 
of clocks should be the number of inputs to a block. I wouldn't be 
opposed to some flags for clocks, but that should be a separate cell.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
