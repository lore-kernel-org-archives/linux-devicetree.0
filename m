From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: gpu: add bindings for the ARM Mali
 Bifrost GPU
Date: Thu, 28 Feb 2019 12:21:41 -0600
Message-ID: <20190228182141.GA5362@bogus>
References: <20190212163838.22644-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190212163838.22644-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 12, 2019 at 05:38:38PM +0100, Neil Armstrong wrote:
> Add the bindings for the Bifrost family of ARM Mali GPUs.
> 
> The Bifrost GPU architecture is similar to the Midgard family,
> but with a different Shader Core & Execution Engine structures.
> 
> Bindings are based on the Midgard family bindings, but the inner
> architectural changes makes it a separate family needing separate
> bindings.
> 
> The Bifrost GPUs are present in a number of recent SoCs, like the
> Amlogic G12A Family, and many other vendors.
> The Amlogic vendor specific compatible is added to handle the
> specific IP integration differences and dependencies.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> Changes since v1:
> - adding missing G31 and G52
> - fixed example
> 
>  .../bindings/gpu/arm,mali-bifrost.txt         | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
> new file mode 100644
> index 000000000000..04a1d63ee578
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
> @@ -0,0 +1,96 @@
> +ARM Mali Bifrost GPU
> +====================
> +
> +Required properties:
> +
> +- compatible :
> +  * Must contain one of the following:
> +    + "arm,mali-g31"
> +    + "arm,mali-g51"
> +    + "arm,mali-g52"
> +    + "arm,mali-g71"
> +    + "arm,mali-g72"
> +    + "arm,mali-g76"

Given that these flavors are all fully disoverable, we could probably 
just have 1 compatible here. It's not often that I suggest this. :)

We allowed this with vivante as all the version and feature information 
is discoverable.

> +  * which must be preceded by one of the following vendor specifics:
> +    + "amlogic,meson-g12a-mali"

We should keep these for any integration differences though.

Rob
