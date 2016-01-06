From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] drm: bridge: add sil902x DT bindings doc
Date: Wed, 6 Jan 2016 07:19:59 -0600
Message-ID: <20160106131959.GA18121@rob-hp-laptop>
References: <1452079551-30914-1-git-send-email-boris.brezillon@free-electrons.com>
 <1452079551-30914-2-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452079551-30914-2-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 06, 2016 at 12:25:51PM +0100, Boris Brezillon wrote:
> Add Sil9022 DT bindings description.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../devicetree/bindings/display/bridge/sil902x.txt | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/sil902x.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/sil902x.txt b/Documentation/devicetree/bindings/display/bridge/sil902x.txt
> new file mode 100644
> index 0000000..7f1339f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/sil902x.txt
> @@ -0,0 +1,31 @@
> +sil902x HDMI bridge bindings
> +
> +Required properties:
> +	- compatible: "sil,sil9022"
> +	- reg: i2c address of the bridge
> +	- reset-gpios: OF device-tree gpio specification for RST_N pin.
> +
> +Optional properties:
> +	- interrupts-extended or interrupt-parent + interrupts: describe
> +	  the interrupt line used to inform the host about hotplug events.
> +
> +Optional subnodes:
> +	- video input: Device node can contain video input port node to
> +	  connect the bridge to a display controller output (See this
> +	  documentation [1]).
> +
> +[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +Example:
> +	hdmi-bridge@39 {
> +		compatible = "sil,sil9022";
> +		reg = <0x39>;
> +		reset-gpios = <&gpx1 5 1 0 0>;

4 GPIO cells? Valid, but unusual.

> +		ports {
> +			port@0 {

Either need a reg property here or drop the unit address. You could 
remove ports as well.

> +				bridge_in: endpoint {
> +					remote-endpoint = <&dc_out>;
> +				};
> +			};
> +		};
> +	};
> -- 
> 2.1.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
