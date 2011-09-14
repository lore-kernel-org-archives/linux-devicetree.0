From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2 v3] power: bq20z75: Add Device Tree Binding
Date: Wed, 14 Sep 2011 09:55:18 -0600
Message-ID: <20110914155518.GE3134@ponder.secretlab.ca>
References: <1315948899-21536-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1315948899-21536-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 13, 2011 at 02:21:39PM -0700, Rhyland Klein wrote:
> Adding the binding for the TI bq20z75 fuel gadge and the
> bq20z75 driver.

Squash this patch into the first patch.  There is no reason to keep
them separate.

> 
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> 	v2: Fixed typo in binding description
> 	v3: Changed unique properties to be use "ti,"
> 	    Changed to use single gpio entry for gpio info
> 
>  .../bindings/power_supply/ti_bq20z75.txt           |   23 ++++++++++++++++++++
>  1 files changed, 23 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/power_supply/ti_bq20z75.txt
> 
> diff --git a/Documentation/devicetree/bindings/power_supply/ti_bq20z75.txt b/Documentation/devicetree/bindings/power_supply/ti_bq20z75.txt
> new file mode 100644
> index 0000000..7571294
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power_supply/ti_bq20z75.txt
> @@ -0,0 +1,23 @@
> +TI bq20z75
> +~~~~~~~~~~
> +
> +Required properties :
> + - compatible : "ti,bq20z75"
> +
> +Optional properties :
> + - ti,i2c-retry-count : The number of times to retry i2c transactions on i2c
> +   IO failure.
> + - ti,poll-retry-count : The number of times to try looking for new status
> +   after an external change notification.
> + - ti,battery-detect-gpios : The gpio which signals battery detection and
> +   a flag specifying its polarity.
> +
> +Example:
> +
> +	bq20z75@b {
> +		compatible = "ti,bq20z75";
> +		reg = < 0xb >;
> +		ti,i2c-retry-count = <2>;
> +		ti,poll-retry-count = <10>;
> +		ti,battery-detect-gpios = <&gpio-controller 122 1>;
> +	}
> -- 
> 1.7.6
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
