From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: thermal: Add generic power domain
 warming device binding
Date: Mon, 30 Sep 2019 09:42:05 -0500
Message-ID: <20190930144205.GA11539@bogus>
References: <1568135676-9328-1-git-send-email-thara.gopinath@linaro.org>
 <1568135676-9328-4-git-send-email-thara.gopinath@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1568135676-9328-4-git-send-email-thara.gopinath@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thara Gopinath <thara.gopinath@linaro.org>
Cc: edubezval@gmail.com, rui.zhang@intel.com, ulf.hansson@linaro.org, daniel.lezcano@linaro.org, bjorn.andersson@linaro.org, agross@kernel.org, amit.kucheria@verdurent.com, mark.rutland@arm.com, rjw@rjwysocki.net, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2019 at 01:14:34PM -0400, Thara Gopinath wrote:
> Add binding to define power domains as thermal warming
> devices.
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
>  .../bindings/thermal/pwr-domain-warming.txt        | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/pwr-domain-warming.txt
> 
> diff --git a/Documentation/devicetree/bindings/thermal/pwr-domain-warming.txt b/Documentation/devicetree/bindings/thermal/pwr-domain-warming.txt
> new file mode 100644
> index 0000000..25fc568
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/pwr-domain-warming.txt
> @@ -0,0 +1,32 @@
> +* Generic power domain based thermal warming device.
> +
> +This binding describes the power domains that can be used as a
> +thermal warming device.

This looks like just a gathering of properties and way to instantiate 
some driver.

I think this all belongs in the power domain provider. Make it a cooling 
device and you should know which domains are relevant based on the 
compatible (though perhaps we could consider a list in DT). If you want 
to instantiate a separate driver to handle this, then make the power 
domain driver do that.

Rob

> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be "thermal-power-domain-wdev"
> +
> +- #temp-reg-cells:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: Must be 2
> +
> +- power-domains:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: reference to power-domains that match power-domain-names
> +
> +- power-domain-names:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: The power-domains that can behave as warming devices
> +
> +Example 1
> +thermal_wdev: rpmhpd_mx_wdev {
> +		compatible = "thermal-power-domain-wdev";
> +		#cooling-cells = <2>;
> +		power-domains =  <&rpmhpd SDM845_MX>;
> +		power-domain-names = "mx";
> +	};
> -- 
> 2.1.4
> 
