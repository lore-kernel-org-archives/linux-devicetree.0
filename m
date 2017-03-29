From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: Document STM32 IWDG bindings
Date: Tue, 28 Mar 2017 20:40:26 -0500
Message-ID: <20170329014026.fxrv7hwoueh6tplm@rob-hp-laptop>
References: <1490195083-25117-1-git-send-email-yannick.fertre@st.com>
 <1490195083-25117-2-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490195083-25117-2-git-send-email-yannick.fertre-qxv4g6HH51o@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 22, 2017 at 04:04:39PM +0100, Yannick Fertre wrote:
> From: Yannick Fertre <yfertre.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

"dt-bindings: watchdog: ..." for subject.
> 
> This adds documentation of device tree bindings for the STM32 IWDG
> (Independent WatchDoG).
> 
> Change-Id: Idadacc806d00205fe9af2e8606af229b4b760558
> Signed-off-by: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>
> ---
>  .../devicetree/bindings/watchdog/st,stm32-iwdg.txt        | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
> new file mode 100644
> index 0000000..036b040
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
> @@ -0,0 +1,15 @@
> +STM32 Independent WatchDoG (IWDG)
> +---------------------------------
> +
> +Required properties:
> +- compatible: "st,stm32-iwdg"
> +- reg: physical base address and length of the registers set for the device
> +- clocks: must contain a single entry describing the clock input
> +
> +Example:
> +
> +iwdg@40003000 {

watchdog@...

> +	compatible = "st,stm32-iwdg";
> +	reg = <0x40003000 0x400>;
> +	clocks = <&clk_lsi>;
> +};
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
