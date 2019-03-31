From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RFC 1/6] dt-bindings: clk: meson: add g12b periph clock controller bindings
Date: Sun, 31 Mar 2019 01:42:33 -0500
Message-ID: <5ca0615a.1c69fb81.26b1d.7b52@mx.google.com>
References: <20190327103308.25058-1-narmstrong@baylibre.com> <20190327103308.25058-2-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190327103308.25058-2-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 27 Mar 2019 11:33:03 +0100, Neil Armstrong wrote:
> This patch adds the specific Amlogic G12B clock driver compatible.
> 
> G12B clock driver is very close, the main differences are :
> - the clock tree is duplicated for the both clusters, and the
>   SYS_PLL are swapped between the clusters
> - G12A has additional clocks like for CSI an other components
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
