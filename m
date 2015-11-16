From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/5] devicetree: Add bindings for the ATH79 USB phy
Date: Mon, 16 Nov 2015 17:18:25 -0600
Message-ID: <20151116231825.GA18204@rob-hp-laptop>
References: <1447708924-15076-1-git-send-email-albeu@free.fr>
 <1447708924-15076-3-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447708924-15076-3-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 16, 2015 at 10:22:01PM +0100, Alban Bedel wrote:
> Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  .../devicetree/bindings/phy/phy-ath79-usb.txt          | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-ath79-usb.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-ath79-usb.txt b/Documentation/devicetree/bindings/phy/phy-ath79-usb.txt
> new file mode 100644
> index 0000000..cafe219
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-ath79-usb.txt
> @@ -0,0 +1,18 @@
> +* Atheros AR71XX/9XXX USB PHY
> +
> +Required properties:
> +- compatible: "qca,ar7100-usb-phy"
> +- #phys-cells: should be 0
> +- reset-names: "usb-phy"[, "usb-suspend-override"]
> +- resets: references to the reset controllers
> +
> +Example:
> +
> +	usb-phy {
> +		compatible = "qca,ar7100-usb-phy";
> +
> +		reset-names = "usb-phy", "usb-suspend-override";
> +		resets = <&rst 4>, <&rst 3>;
> +
> +		#phy-cells = <0>;
> +	};
> -- 
> 2.0.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
