From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: net: meson-dwmac: convert to yaml
Date: Tue, 6 Aug 2019 09:15:45 -0600
Message-ID: <CAL_JsqKnzNMittFbvmz+ELu9UVMkmPmFoVT8ydWOYtCST+MwVA@mail.gmail.com>
References: <20190806125041.16105-1-narmstrong@baylibre.com> <20190806125041.16105-3-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190806125041.16105-3-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, netdev <netdev@vger.kernel.org>, linux-amlogic@lists.infradead.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 6, 2019 at 6:50 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Synopsys DWMAC Glue for Amlogic SoCs over to a YAML schemas.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/net/amlogic,meson-dwmac.yaml     | 113 ++++++++++++++++++
>  .../devicetree/bindings/net/meson-dwmac.txt   |  71 -----------
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   5 +
>  3 files changed, 118 insertions(+), 71 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/meson-dwmac.txt

I don't love the compatible schema with 'additionalItems: true' and
contains, but I guess it is what it is. I'm hopeful schemas help limit
how many variations we end up with.

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
