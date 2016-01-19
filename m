From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv3 2/2] gpio: sn65hvs885: Add DT binding documentation
Date: Tue, 19 Jan 2016 11:20:40 -0600
Message-ID: <20160119172040.GA8857@rob-hp-laptop>
References: <1453198940-31410-1-git-send-email-sean.nyekjaer@prevas.dk>
 <1453198940-31410-2-git-send-email-sean.nyekjaer@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453198940-31410-2-git-send-email-sean.nyekjaer@prevas.dk>
Sender: linux-gpio-owner@vger.kernel.org
To: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 19, 2016 at 11:22:20AM +0100, Sean Nyekjaer wrote:
> Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt b/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt
> new file mode 100644
> index 0000000..56679ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt
> @@ -0,0 +1,9 @@
> +* TI SN65HVS885 digital-input serializer
> +
> +Example:
> +	sn65hvs885@3 {
> +		compatible = "sn65hvs885";
> +		spi-max-frequency = <10000000>;
> +		reg = <0>;

What about all the standard gpio controller properties?

> +	};
> +
> -- 
> 2.7.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
