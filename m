From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/2] gpio: sn65hvs885: Add DT binding documentation
Date: Fri, 22 Jan 2016 10:01:35 -0600
Message-ID: <20160122160135.GA12320@rob-hp-laptop>
References: <1453358496-4902-1-git-send-email-sean.nyekjaer@prevas.dk>
 <1453358496-4902-2-git-send-email-sean.nyekjaer@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453358496-4902-2-git-send-email-sean.nyekjaer@prevas.dk>
Sender: linux-gpio-owner@vger.kernel.org
To: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 21, 2016 at 07:41:36AM +0100, Sean Nyekjaer wrote:
> Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
> ---
> Changes since v3:
> - Added gpio-controller and gpio cells flags
> 
>  Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt b/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt
> new file mode 100644
> index 0000000..6d99c9e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt
> @@ -0,0 +1,11 @@
> +* TI SN65HVS885 digital-input serializer
> +
> +Example:

The example does not serve as documentation. You need to list the 
properties and allowed values, required vs. optional, and point to 
common bindings you are using as appropriate (i.e. gpio).

> +	sn65hvs885@3 {
> +		compatible = "sn65hvs885";

Also, this needs a vendor prefix, so "ti,sn65hvs885".

> +		spi-max-frequency = <10000000>;
> +		reg = <0>;
> +		gpio-controller;
> +		#gpio-cells = <1>;
> +	};
> +
> -- 
> 2.7.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
