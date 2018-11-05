From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/7] dt-bindings: Add bindings for the
 LeMaker BL035-RGB-002 LCD panel
Date: Mon, 5 Nov 2018 16:09:09 -0600
Message-ID: <20181105220909.GA24283@bogus>
References: <20181101200045.6078-1-contact@paulk.fr>
 <20181101200045.6078-5-contact@paulk.fr>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDJIP47K7MERBB77QLPQKGQEHUNACAY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181101200045.6078-5-contact-W9ppeneeCTY@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 01, 2018 at 09:00:42PM +0100, Paul Kocialkowski wrote:
> This adds the device-tree bindings for the LeMaker BL035-RGB-002 3.5"
> QVGA TFT LCD panel, compatible with simple-panel.
> 
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  .../bindings/display/panel/lemaker,bl035-rgb-002.txt       | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lemaker,bl035-rgb-002.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/lemaker,bl035-rgb-002.txt b/Documentation/devicetree/bindings/display/panel/lemaker,bl035-rgb-002.txt
> new file mode 100644
> index 000000000000..22cff3eb1b8f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/lemaker,bl035-rgb-002.txt
> @@ -0,0 +1,7 @@
> +LeMaker BL035-RGB-002 3.5" QVGA TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "lemaker,bl035-rgb-002"

No power supply or backlight? You need to enumerate exactly which 
properties you are using.

> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.
> -- 
> 2.19.1
> 
