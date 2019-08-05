From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: net: meson-dwmac: convert to yaml
Date: Mon, 5 Aug 2019 16:09:43 -0600
Message-ID: <CAL_Jsq+efvvb1UK-Nas0G5XefLWwN7ebnqoevi+W=jj4r3E2dg@mail.gmail.com>
References: <20190805122558.5130-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190805122558.5130-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, netdev <netdev@vger.kernel.org>, linux-amlogic@lists.infradead.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 5, 2019 at 6:26 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Synopsys DWMAC Glue for Amlogic SoCs over to a YAML schemas.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> Rob,
>
> I keep getting :
> .../devicetree/bindings/net/amlogic,meson-dwmac.example.dt.yaml: ethernet@c9410000: reg: [[3376480256, 65536], [3364046144, 8]] is too long

Because snps,dwmac.yaml has:

  reg:
    maxItems: 1

The schemas are applied separately and all have to be valid. You'll
need to change snps,dwmac.yaml to:

reg:
  minItems: 1
  maxItems: 2


The schema error messages leave something to be desired. I wish the
error messages said which schema is throwing the error.

> for the example DT
>
> and for the board DT :
> ../amlogic/meson-gxl-s905x-libretech-cc.dt.yaml: ethernet@c9410000: reg: [[0, 3376480256, 0, 65536, 0, 3364046144, 0, 4]] is too short
> ../amlogic/meson-gxl-s905x-nexbox-a95x.dt.yaml: soc: ethernet@c9410000:reg:0: [0, 3376480256, 0, 65536, 0, 3364046144, 0, 4] is too long
>
> and I don't know how to get rid of it.

The first issue is the same as the above. The 2nd issue is the use of
<> in dts files becomes stricter with the schema. Each entry in an
array needs to be bracketed:

reg = <0x0 0xc9410000 0x0 0x10000>,
          <0x0 0xc8834540 0x0 0x4>;

Rob
