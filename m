From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: tda998x: Document the required 'port' node.
Date: Fri, 4 Dec 2015 12:54:31 -0600
Message-ID: <20151204185431.GA9463@rob-hp-laptop>
References: <1449056139-31222-1-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449056139-31222-1-git-send-email-Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 02, 2015 at 11:35:39AM +0000, Liviu Dudau wrote:
> All the users of the tda998x driver are component based and bind the
> driver via the device graph method described in
> Documentation/devicetree/bindings/graph.txt. Add the fact that the
> 'port' node is required to the bindings.
> 
> Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/display/bridge/tda998x.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/tda998x.txt b/Documentation/devicetree/bindings/display/bridge/tda998x.txt
> index e9e4bce..e178e6b 100644
> --- a/Documentation/devicetree/bindings/display/bridge/tda998x.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/tda998x.txt
> @@ -5,6 +5,10 @@ Required properties;
>  
>    - reg: I2C address
>  
> +Required node:
> +  - port: Input port node with endpoint definition, as described
> +        in Documentation/devicetree/bindings/graph.txt
> +
>  Optional properties:
>    - interrupts: interrupt number and trigger type
>  	default: polling
> -- 
> 2.6.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
