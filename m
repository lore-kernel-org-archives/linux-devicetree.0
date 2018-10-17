Return-Path: <robherring2@gmail.com>
Date: Wed, 17 Oct 2018 13:42:47 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RFC v2 2/4] dt-bindings: introduce System PM domain
 bindings for Qualcomm SoCs
Message-ID: <20181017184247.GA28562@bogus>
References: <1539186879-10009-1-git-send-email-rplsssn@codeaurora.org>
 <1539186879-10009-3-git-send-email-rplsssn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1539186879-10009-3-git-send-email-rplsssn@codeaurora.org>
To: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
Cc: ilina@codearuroa.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Oct 10, 2018 at 09:24:37PM +0530, Raju P.L.S.S.S.N wrote:
> Add device binding documentation for Qualcomm Technology Inc's System PM
> domain driver. The driver is used for managing system sleep activities
> that are required when application processor is going to deepest low
> power mode.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
> ---
>  .../bindings/soc/qcom/system_pm_domain.txt         | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/system_pm_domain.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/system_pm_domain.txt b/Documentation/devicetree/bindings/soc/qcom/system_pm_domain.txt
> new file mode 100644
> index 0000000..9f913c3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/system_pm_domain.txt
> @@ -0,0 +1,38 @@
> +Qualcomm Technologies system power domain
> +-----------------------------------------
> +
> +System pm domain handles the tasks that need to be performed during application
> +processor deeper low power mode entry for QCOM SoCs which have hardened IP blocks
> +combinedly called as RPMH (Resource Power Manager Hardened) for shared resource
> +management. Flushing the buffered requests to TCS (Triggered Command Set) in RSC
> +(Resource State Coordinator) and programming the wakeup timer in PDC (Power
> +Domain Controller) for timer based wakeup are handled as part of domain power
> +down.
> +
> +The bindings for System PM domain is specified in the RSC section in devicetree.
> +
> +Properties:
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be "qcom,system-pm-domain".
> +
> +- #power-domain-cells: number of cells in power domain specifier;
> +    must be 0.
> +
> +Node of a device using power domains must have a power-domains property
> +defined with a phandle to respective power domain.
> +
> +Example:
> +
> +	apps_rsc: rsc@179c0000 {
> +		[...]
> +		system_pd: system-power-domain {
> +			compatible = "qcom,system-pm";
> +            #power-domain-cells = <0>;

I don't understand why this is split from "qcom,cpu-pm-domain". Just 
make the parent (RSC) a power domain provider with multiple domains. As 
long as each domain doesn't have its own resources, you don't need child 
nodes here.

Rob
