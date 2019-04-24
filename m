From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: tsl2772: convert bindings to
 YAML format
Date: Wed, 24 Apr 2019 08:26:48 -0400
Message-ID: <20190424122648.GA15745@basecamp>
References: <20190424092238.6381-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190424092238.6381-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org
Cc: lars@metafoo.de, pmeerw@pmeerw.net, mark.rutland@arm.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 24, 2019 at 05:22:37AM -0400, Brian Masney wrote:
> Convert the tsl2772 device tree bindings to the new YAML format.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since v1:
> - Dropped description from reg and interrupts properties.
> - Dropped $ref from led-max-microamp, vdd-supply, and vddio-supply.
> - Changed 'tsl2772@39' in example to 'proximity-sensor@39'

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        proximity-sensor@39 {

I didn't think of this until after I sent out that patch, but I think
this example should be 'als-proximity-sensor@39' instead of
'proximity-sensor@39'.

Brian
