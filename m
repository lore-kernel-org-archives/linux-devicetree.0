From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH/TRIVIAL] devicetree: bindings: designware-pcie: Fix unit
 address
Date: Tue, 19 Apr 2016 17:24:33 -0500
Message-ID: <20160419222433.GA32298@rob-hp-laptop>
References: <1460491294-32437-1-git-send-email-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460491294-32437-1-git-send-email-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Joao Pinto <jpinto-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 12, 2016 at 01:01:34PM -0700, Stephen Boyd wrote:
> Remove the 0x in the unit address because it shouldn't be there.
> 
> Cc: Joao Pinto <jpinto-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/pci/designware-pcie.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/designware-pcie.txt b/Documentation/devicetree/bindings/pci/designware-pcie.txt
> index 64f2fff12128..6c5322c55411 100644
> --- a/Documentation/devicetree/bindings/pci/designware-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/designware-pcie.txt
> @@ -31,7 +31,7 @@ Optional properties:
>  
>  Example configuration:
>  
> -	pcie: pcie@0xdffff000 {
> +	pcie: pcie@dffff000 {
>  		compatible = "snps,dw-pcie";
>  		reg = <0xdffff000 0x1000>, /* Controller registers */
>  		      <0xd0000000 0x2000>; /* PCI config space */
> -- 
> 2.8.0.rc4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
