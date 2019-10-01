From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: thermal: Introduce monitor-falling
 parameter to thermal trip point binding
Date: Tue, 01 Oct 2019 17:09:08 -0500
Message-ID: <5d93ce86.1c69fb81.70b0d.ba56@mx.google.com>
References: <1568859503-19725-1-git-send-email-thara.gopinath@linaro.org>
 <1568859503-19725-2-git-send-email-thara.gopinath@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1568859503-19725-2-git-send-email-thara.gopinath@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thara Gopinath <thara.gopinath@linaro.org>
Cc: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, vincent.guittot@linaro.org, bjorn.andersson@linaro.org, amit.kucheria@verdurent.com, mark.rutland@arm.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2019 at 10:18:20PM -0400, Thara Gopinath wrote:
> Introduce a new binding parameter to thermal trip point description
> to indicate whether the temperature level specified by the trip point
> is monitored for a rise or fall in temperature.

What if it is both?

When do you need this? Seems like you'd always want to monitor both 
directions to undo any action done on rising temp. Unless you want a 
hysteresis, but this doesn't seem like the best way to implement that.

> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
>  Documentation/devicetree/bindings/thermal/thermal.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/thermal.txt b/Documentation/devicetree/bindings/thermal/thermal.txt
> index ca14ba9..849a2a9 100644
> --- a/Documentation/devicetree/bindings/thermal/thermal.txt
> +++ b/Documentation/devicetree/bindings/thermal/thermal.txt
> @@ -90,6 +90,14 @@ Required properties:
>  	"critical":	Hardware not reliable.
>    Type: string
>  
> +Optional property:
> +- monitor-falling: 	Indicate whether the system action is kick
> +  Type: boolean		started when the temperature falls below or rises
> +			above the trip temperature level indicated in
> +			"temperature".If true, the trip point is monitored
> +			for falling temperature else the trip point is
> +			monitored for rising temperature.
> +
>  * Cooling device maps
>  
>  The cooling device maps node is a node to describe how cooling devices
> -- 
> 2.1.4
> 
