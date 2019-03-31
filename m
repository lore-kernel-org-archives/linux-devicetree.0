From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: g12a-aoclk: expose CLKID_AO_CTS_OSCIN
Date: Sun, 31 Mar 2019 01:41:04 -0500
Message-ID: <5ca06102.1c69fb81.44711.7b74@mx.google.com>
References: <20190321092010.14382-1-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321092010.14382-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 21 Mar 2019 10:20:10 +0100, Neil Armstrong wrote:
> When submitted v2 of the G12A AO-CLK IDs, the CLKID_AO_CTS_OSCIN was moved
> to the internal non-exported bindings, but this clock is necessary for
> the second AO-CEC-B module since it embeds the 32768Hz dual-divider
> clock generator unlike the AO-CEC-A module.
> 
> Export it back to the public bindings.
> 
> Fixes: be3d960b0aeb ("dt-bindings: clk: add G12A AO Clock and Reset Bindings")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/g12a-aoclk.h          | 1 -
>  include/dt-bindings/clock/g12a-aoclkc.h | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
