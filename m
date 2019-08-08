From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: amlogic,meson-vpu: convert
 to yaml
Date: Thu, 8 Aug 2019 08:22:39 -0600
Message-ID: <CAL_JsqJgjjPzb4uWaJ-M=11-LRjByyRcHmot6iRyK-dXMOnkxg@mail.gmail.com>
References: <20190808085522.21950-1-narmstrong@baylibre.com> <20190808085522.21950-3-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808085522.21950-3-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, linux-amlogic@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 8, 2019 at 2:55 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic Display Controller over to YAML schemas.
>
> The original example has a leftover "dmc" memory cell, that has been
> removed in the yaml rewrite.
>
> The port connection table has been dropped in favor of a description
> of each port.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/display/amlogic,meson-vpu.txt    | 121 ----------------
>  .../bindings/display/amlogic,meson-vpu.yaml   | 137 ++++++++++++++++++
>  2 files changed, 137 insertions(+), 121 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
