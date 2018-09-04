Return-Path: <robherring2@gmail.com>
Message-ID: <5b8e8a7d.1c69fb81.f8a73.b384@mx.google.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RFC 2/6] dt-bindings: introduce System PM bindings for
 Qualcomm SoCs
References: <1535141188-29731-1-git-send-email-rplsssn@codeaurora.org>
 <1535141188-29731-3-git-send-email-rplsssn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1535141188-29731-3-git-send-email-rplsssn@codeaurora.org>
Date: Tue, 4 Sep 2018 08:14:16 -0500
To: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-pm@vger.kernel.org, rnayak@codeaurora.org, bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org, lorenzo.pieralisi@arm.com, rafael@kernel.org, drake@endlessm.com, sboyd@kernel.org, evgreen@chromium.org, dianders@chromium.org, mka@chromium.org, ilina@codeaurora.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sat, Aug 25, 2018 at 01:36:24AM +0530, Raju P.L.S.S.S.N wrote:
> Add device binding documentation for Qualcomm Technology Inc's System PM
> driver. The driver is used for managing system sleep activities that are
> required when application processor is going to deepest low power mode.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
> ---
>  .../devicetree/bindings/soc/qcom/system_pm.txt     | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/system_pm.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/system_pm.txt b/Documentation/devicetree/bindings/soc/qcom/system_pm.txt
> new file mode 100644
> index 0000000..0915760
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/system_pm.txt
> @@ -0,0 +1,28 @@
> +System PM
> +---------
> +
> +System PM device handles the tasks that need to be performed during application
> +processor deeper low power mode entry for QCOM SoCs which have hardened IP blocks
> +combinedly called as RPMH (Resource Power Manager Hardened) for shared resource
> +management. System PM is a client of APPS_RSC. Flushing the buffered requests to
> +TCSs in RSC and programming the wakeup timer in PDC for timer based wakeup are
> +handled by this device.
> +
> +The bindings for System PM is specified in the RSC section in devicetree.
> +
> +Properties:
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be "qcom,system-pm".

h/w devices have some sort of resources and this has nothing. Looks like 
you are just using DT to instantiate some sort of virtual driver. Don't 
do that.

Rob
