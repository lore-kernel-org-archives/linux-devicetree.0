From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 0/3] dt-bindings: Convert Arm Mali GPUs to DT schema
Date: Wed, 21 Aug 2019 19:24:19 +0200
Message-ID: <174045783.D6yh98NvXX@phil>
References: <20190820195959.6126-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820195959.6126-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Neil Armstrong <narmstrong@baylibre.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 20. August 2019, 21:59:56 CEST schrieb Rob Herring:
> This series converts the various Arm Mali GPU bindings to use the DT
> schema format.
> 
> The Midgard and Bifrost bindings generate warnings on 'interrupt-names'
> because there's all different ordering. The Utgard binding generates 
> warnings on Rockchip platforms because 'clock-names' order is reversed.

Are you planning on sending fixes for these, should I just change the
ordering myself?


> Rob Herring (3):
>   dt-bindings: Convert Arm Mali Midgard GPU to DT schema
>   dt-bindings: Convert Arm Mali Bifrost GPU to DT schema
>   dt-bindings: Convert Arm Mali Utgard GPU to DT schema

Acked-by: Heiko Stuebner <heiko@sntech.de>


Thanks for doing the conversion
Heiko


>  .../bindings/gpu/arm,mali-bifrost.txt         |  92 ----------
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 115 ++++++++++++
>  .../bindings/gpu/arm,mali-midgard.txt         | 119 -------------
>  .../bindings/gpu/arm,mali-midgard.yaml        | 165 +++++++++++++++++
>  .../bindings/gpu/arm,mali-utgard.txt          | 129 --------------
>  .../bindings/gpu/arm,mali-utgard.yaml         | 166 ++++++++++++++++++
>  6 files changed, 446 insertions(+), 340 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
> 
> 
