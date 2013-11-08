From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 01/11] devicetree: bindings: Document cpu enable-method for ARM CPUs
Date: Fri, 08 Nov 2013 10:12:27 +0100
Message-ID: <2530561.EJ90QlWNJQ@flatron>
References: <1383343739-23080-1-git-send-email-sboyd@codeaurora.org> <1383343739-23080-2-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1383343739-23080-2-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org, David Brown <davidb@codeaurora.org>, Rohit Vaswani <rvaswani@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 01 of November 2013 15:08:49 Stephen Boyd wrote:
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
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt
> b/Documentation/devicetree/bindings/arm/cpus.txt index f32494d..37258f9
> 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> @@ -45,6 +45,14 @@ For the ARM architecture every CPU node must contain
> the following properties: "marvell,xsc3"
>  		"marvell,xscale"
> 
> +And the following optional properties:
> +
> +- enable-method: Specifies the method used to enable or take the
> secondary cores +		 out of reset. This allows different reset 
sequence
> for
> +		 different types of cpus.
> +		 This should be one of:
> +		 "spin-table"

What about saying a word or two (other than property value) about each 
method?

Best regards,
Tomasz
