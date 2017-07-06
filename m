From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] input: keyboard: Add lm8333 devicetree bindings
Date: Thu, 6 Jul 2017 11:09:40 -0500
Message-ID: <20170706160940.ljunxsk2y7ok55c6@rob-hp-laptop>
References: <20170629122220.12425-3-gordan.markus@gmail.com>
 <20170629122220.12425-4-gordan.markus@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170629122220.12425-4-gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gordan =?utf-8?Q?Marku=C5=A1?= <gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 29, 2017 at 02:22:20PM +0200, Gordan Markuš wrote:
> This adds LM8333 devicetree bindings documentation.
> 
> Signed-off-by: Gordan Markuš <gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/input/ti,lm8333.txt        | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/ti,lm8333.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/ti,lm8333.txt b/Documentation/devicetree/bindings/input/ti,lm8333.txt
> new file mode 100644
> index 0000000..dda01e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/ti,lm8333.txt
> @@ -0,0 +1,45 @@
> +LM8333 Keypad
> +
> +Required properties:
> +- compatible: Compatible property value should be "ti,lm8333".
> +
> +- reg: Physical base address of the peripheral and length of memory mapped
> +  region.

Isn't this I2C based?

With that fixed,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
