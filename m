From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] usb: dwc3: add quirk to handle DWC_USB3_NUM ==
 DWC_USB3_NUM_IN_EPS
Date: Mon, 23 Jan 2017 09:38:16 -0600
Message-ID: <20170123153815.qxridbif7dg4k23z@rob-hp-laptop>
References: <1484855882-4936-1-git-send-email-pure.logic@nexus-software.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484855882-4936-1-git-send-email-pure.logic-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bryan O'Donoghue <pure.logic-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 19, 2017 at 07:58:02PM +0000, Bryan O'Donoghue wrote:
> - DWC_USB3_NUM indicates the number of Device mode single directional
>   endpoints, including OUT and IN endpoint 0.
> 
> - DWC_USB3_NUM_IN_EPS indicates the maximum number of Device mode IN
>   endpoints active at any time, including control endpoint 0.
> 
> It's possible to configure RTL such that DWC_USB3_NUM_EPS is equal to
> DWC_USB3_NUM_IN_EPS.
> 
> dwc3-core calculates the number of OUT endpoints as DWC_USB3_NUM minus
> DWC_USB3_NUM_IN_EPS. If RTL has been configured with DWC_USB3_NUM_IN_EPS
> equal to DWC_USB3_NUM then dwc3-core will calculate the number of OUT
> endpoints as zero.
> 
> For example a from dwc3_core_num_eps() shows:
> [    1.565000]  /usb0@f01d0000: found 8 IN and 0 OUT endpoints
> 
> This patch fixes this case by adding a snps,num_in_eps quirk and an
> over-ride value for DWC_USB3_NUM_IN_EPS snps,num_in_eps_override. When the
> quirk is declared then snps,num_in_eps_override will be used instead of
> DWC_USB3_NUM_IN_EPS as the value of the number active IN endpoints.
> 
> The minimum value specified for DWC_USB3_NUM_IN_EPS in the Designware
> data-book is two, if snps,num_in_eps_quirk is declared but
> snps,num_in_eps_override is omitted, then the minimum value will be used as
> the default.
> 
> Signed-off-by: Bryan O'Donoghue <pure.logic-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt |  3 +++
>  drivers/usb/dwc3/core.c                        | 11 +++++++++++
>  drivers/usb/dwc3/core.h                        |  6 ++++++
>  3 files changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index e3e6983..bb383bf 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -55,6 +55,9 @@ Optional properties:
>  	fladj_30mhz_sdbnd signal is invalid or incorrect.
>  
>   - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
> + - snps,num_in_eps_quirk: when set core will over-ride the num_in_eps value.
> + - snps,num_in_eps_override: the value that will be used for num_in_eps when
> +			num_in_eps_quirk is true

Why do you need 2 properties? Presence of the prop eanbles the override 
and the value of the prop provides the value.

Use '-' rather than '_'.

>  
>  This is usually a subnode to DWC3 glue to which it is connected.
>  
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
