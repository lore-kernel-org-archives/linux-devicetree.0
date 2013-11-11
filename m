From: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH 01/11] devicetree: bindings: Document cpu enable-method
 for ARM CPUs
Date: Mon, 11 Nov 2013 14:35:32 +0000
Message-ID: <20131111143532.GB3166@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, David Brown <davidb@codeaurora.org>, Rohit Vaswani <rvaswani@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 01, 2013 at 03:08:49PM -0700, Stephen Boyd wrote:
> From: Rohit Vaswani <rvaswani@codeaurora.org>
> 
> According to the ePAPR CPUs should have an enable method. On ARM
> the enable-method property has not been used so far, so document
> this property as an optional property and add the spin-table
> method as one value
> 
> Cc: <devicetree@vger.kernel.org>
> Signed-off-by: Rohit Vaswani <rvaswani@codeaurora.org>
> [sboyd: Split off into separate patch]
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
> index f32494d..37258f9 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> @@ -45,6 +45,14 @@ For the ARM architecture every CPU node must contain the following properties:
>  		"marvell,xsc3"
>  		"marvell,xscale"
>  
> +And the following optional properties:
> +
> +- enable-method: Specifies the method used to enable or take the secondary cores
> +		 out of reset. This allows different reset sequence for
> +		 different types of cpus.
> +		 This should be one of:
> +		 "spin-table"
> +

If you've not already done so, take a look at the changes to this
documentation in linux-next.

There is some documentation about what the spin-table should actually
mean for ARM in Documentation/arm64/booting.txt.

We might need to add pointers from Documentation/arm/Booting?

Cheers
---Dave
