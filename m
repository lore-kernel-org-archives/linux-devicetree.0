From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH RESEND v2 1/6] dt-bindings: watchdog: Add YAML schemas
 for the generic watchdog bindings
Date: Fri, 30 Aug 2019 09:48:11 -0700
Message-ID: <20190830164811.GA7911@roeck-us.net>
References: <20190821143835.7294-1-mripard@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190821143835.7294-1-mripard@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>
Cc: wim@linux-watchdog.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 21, 2019 at 04:38:30PM +0200, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> 
> The watchdogs have a bunch of generic properties that are needed in a
> device tree. Add a YAML schemas for those.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> 
> ---
> 
> Changes from v1:
>   - New patch
> ---
>  .../bindings/watchdog/watchdog.yaml           | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/watchdog.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/watchdog.yaml b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> new file mode 100644
> index 000000000000..187bf6cb62bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> @@ -0,0 +1,26 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/watchdog.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Watchdog Generic Bindings
> +
> +maintainers:
> +  - Guenter Roeck <linux@roeck-us.net>
> +  - Wim Van Sebroeck <wim@linux-watchdog.org>
> +
> +description: |
> +  This document describes generic bindings which can be used to
> +  describe watchdog devices in a device tree.
> +
> +properties:
> +  $nodename:
> +    pattern: "^watchdog(@.*|-[0-9a-f])?$"
> +
> +  timeout-sec:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Contains the watchdog timeout in seconds.
> +
> +...
> -- 
> 2.21.0
> 
