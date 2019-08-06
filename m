From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: net: meson-dwmac: convert to yaml
Date: Tue, 6 Aug 2019 21:11:15 +0200
Message-ID: <CAFBinCCw8sZnmWcHMtEGBrEGqok=3N0qBEaPBZ7_ixLFFtGnGw@mail.gmail.com>
References: <20190806125041.16105-1-narmstrong@baylibre.com> <20190806125041.16105-3-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190806125041.16105-3-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 6, 2019 at 2:50 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Synopsys DWMAC Glue for Amlogic SoCs over to a YAML schemas.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
thank you for taking care of this conversion!
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +        amlogic,tx-delay-ns:
> +          $ref: /schemas/types.yaml#definitions/uint32
> +          description:
> +            The internal RGMII TX clock delay (provided by this driver) in
> +            nanoseconds. Allowed values are 0ns, 2ns, 4ns, 6ns.
once I have more time I will try to see whether we can define an enum
with these values, then invalid values will yield a warning/error when
building the .dtb (which seems to be a good idea)
this comment shouldn't prevent this patch from being applied as the
initial conversion will already make life a lot easier


Martin
