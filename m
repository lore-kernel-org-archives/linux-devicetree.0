From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Documentation: ti-syscon-reset: fix header path
Date: Mon, 12 Dec 2016 12:40:21 -0600
Message-ID: <20161212184021.hewybkfaygrle63a@rob-hp-laptop>
References: <1481278287-23842-1-git-send-email-yegorslists@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1481278287-23842-1-git-send-email-yegorslists@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yegorslists@googlemail.com
Cc: linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

On Fri, Dec 09, 2016 at 11:11:27AM +0100, yegorslists@googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> 'include' was missing from path.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  Documentation/devicetree/bindings/reset/ti-syscon-reset.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> index 164c7f3..5b20e20 100644
> --- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> +++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> @@ -44,7 +44,7 @@ Required properties:
>  			              reset status register
>  			    Cell #7 : Flags used to control reset behavior,
>  			              availible flags defined in the DT include
> -			              file <dt-bindings/reset/ti-syscon.h>
> +			              file <include/dt-bindings/reset/ti-syscon.h>

There's pretty much equal mixture of include or not. Not really much 
point in fixing 1 instance if there's no clear correct way. Given it is 
written with <...>, that matches how you write the include statement.

Rob
