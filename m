Return-Path: <robherring2@gmail.com>
Date: Tue, 18 Dec 2018 10:38:58 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] usb: dwc3: Add property snps,refclk-period-ns
Message-ID: <20181218163858.GA12336@bogus>
References: <cover.1544235317.git.thinhn@synopsys.com>
 <83adc98adc1760a0fad87d81d171e1dac783e7e5.1544235317.git.thinhn@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83adc98adc1760a0fad87d81d171e1dac783e7e5.1544235317.git.thinhn@synopsys.com>
To: Thinh Nguyen <thinh.nguyen@synopsys.com>
Cc: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Dec 07, 2018 at 06:27:30PM -0800, Thinh Nguyen wrote:
> This patch introduces property "snps,refclk-period-ns" to inform the
> controller of the reference clock period. If the reference clock period
> is different from the default Core Consultant setting, then this
> property can be set to the reference clock period.
> 
> This property does not control the reference clock rate. The controller
> uses this value to perform internal timing calculations that are based
> on the reference clock.
> 
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
> Changes in v2:
> - Split from "usb: dwc3: Add reference clock properties"
> - Revise commit message and property description
> 
>  Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 8e5265e9f658..b7e67edff9b2 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -99,6 +99,8 @@ Optional properties:
>  			this and tx-thr-num-pkt-prd to a valid, non-zero value
>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
>  			enable periodic ESS TX threshold.
> + - snps,refclk-period-ns: if set, this value informs the controller of the
> +			reference clock period in nanoseconds.

Shouldn't you be able to retrieve the refclk frequency and then 
calculate the period?

Rob
