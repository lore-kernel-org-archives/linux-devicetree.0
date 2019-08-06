From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: amlogic,meson-dw-hdmi:
 convert to yaml
Date: Tue, 6 Aug 2019 09:06:36 -0600
Message-ID: <CAL_JsqKZoS-nsH56BdcUYe-4sw1=ESZJH_3S2Y0mMwT701wuyw@mail.gmail.com>
References: <20190806124416.15561-1-narmstrong@baylibre.com> <20190806124416.15561-2-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190806124416.15561-2-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, linux-amlogic@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 6, 2019 at 6:44 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic Synopsys DW-HDMI specifics over to YAML schemas.
>
> The original example and usage of clock-names uses a reversed "isfr"
> and "iahb" clock-names, the rewritten YAML bindings uses the reversed
> instead of fixing the device trees order.
>
> The #sound-dai-cells optional property has been added to match this node
> as a sound dai.
>
> The port connection table has been dropped in favor of a description
> of each port.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../display/amlogic,meson-dw-hdmi.txt         | 119 --------------
>  .../display/amlogic,meson-dw-hdmi.yaml        | 150 ++++++++++++++++++
>  2 files changed, 150 insertions(+), 119 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
