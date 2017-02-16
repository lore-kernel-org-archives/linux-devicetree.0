From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/9] dt-bindings: Add Ampire AM-480272H3TMQW-T01H panel
Date: Wed, 15 Feb 2017 20:34:08 -0600
Message-ID: <20170216023408.apqukipi5zzkrk7j@rob-hp-laptop>
References: <1486738489-22154-1-git-send-email-yannick.fertre@st.com>
 <1486738489-22154-5-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486738489-22154-5-git-send-email-yannick.fertre-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>
Cc: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>, Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 10, 2017 at 03:54:44PM +0100, Yannick Fertre wrote:
> Signed-off-by: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>
> ---
>  .../bindings/display/panel/ampire,am-480272h3tmqw-t01h.txt         | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.txt b/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.txt
> new file mode 100644
> index 0000000..f59e3c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.txt
> @@ -0,0 +1,7 @@
> +Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "ampire,am-480272h3tmqw-t01h"

No GPIO controls or power supply for this panel?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
