From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 03/10] media: dt-bindings: vpif: extend the example with
 an output port
Date: Wed, 15 Feb 2017 16:08:22 -0600
Message-ID: <20170215220822.nsws6kzrd6ihvmqt@rob-hp-laptop>
References: <1486485683-11427-1-git-send-email-bgolaszewski@baylibre.com>
 <1486485683-11427-4-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486485683-11427-4-git-send-email-bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Patrick Titiano <ptitiano-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lad Prabhakar <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 07, 2017 at 05:41:16PM +0100, Bartosz Golaszewski wrote:
> This makes the example more or less correspond with the da850-evm
> hardware setup.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/media/ti,da850-vpif.txt    | 35 ++++++++++++++++++----
>  1 file changed, 29 insertions(+), 6 deletions(-)

Spoke too soon...

> 
> diff --git a/Documentation/devicetree/bindings/media/ti,da850-vpif.txt b/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
> index 9c7510b..543f6f3 100644
> --- a/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
> +++ b/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
> @@ -28,19 +28,27 @@ I2C-connected TVP5147 decoder:
>  		reg = <0x217000 0x1000>;
>  		interrupts = <92>;
>  
> -		port {
> -			vpif_ch0: endpoint@0 {
> +		port@0 {
> +			vpif_input_ch0: endpoint@0 {
>  				reg = <0>;
>  				bus-width = <8>;
> -				remote-endpoint = <&composite>;
> +				remote-endpoint = <&composite_in>;
>  			};
>  
> -			vpif_ch1: endpoint@1 {
> +			vpif_input_ch1: endpoint@1 {
>  				reg = <1>;
>  				bus-width = <8>;
>  				data-shift = <8>;
>  			};
>  		};
> +
> +		port@1 {

The binding doc says nothing about supporting a 2nd port. 


> +			vpif_output_ch0: endpoint@0 {
> +				reg = <0>;

Don't need reg here.

> +				bus-width = <8>;
> +				remote-endpoint = <&composite_out>;
> +			};
> +		};
>  	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
