From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/4] soc: amlogic: clk-measure: add axg and g12a
 support
Date: Fri, 18 Jan 2019 11:52:23 +0100
Message-ID: <bc1aa147-e08a-5bb2-9a3b-cf3dad3c0235@baylibre.com>
References: <20190118103423.15075-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118103423.15075-1-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 18/01/2019 11:34, Jerome Brunet wrote:
> This patchset adds support for the axg and g12a SoC family in amlogic's
> clock measure driver and enable it on the related devices
> 
> Changes since v1 [0]:
> * re-order node in the g12a.dtsi
> * change node name
> 
> [0]: https://lkml.kernel.org/r/20190117164838.8008-1-jbrunet@baylibre.com
> 
> Jerome Brunet (4):
>   dt-bindings: amlogic: add new compatible devices to clk_measure
>   soc: amlogic: clk-measure: add axg and g12a support
>   arm64: dts: meson: axg: add clk measure support
>   arm64: dts: meson: g12a: add clk measure support
> 
>  .../bindings/soc/amlogic/clk-measure.txt      |   2 +
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   5 +
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |   5 +
>  drivers/soc/amlogic/meson-clk-measure.c       | 194 ++++++++++++++++++
>  4 files changed, 206 insertions(+)
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
