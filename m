From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] clk: g12a-aoclk: re-export CLKID_AO_SAR_ADC_SEL clock id
Date: Tue, 19 Mar 2019 11:02:58 +0100
Message-ID: <697115c457a70b458bf7514df72e802fc78e467e.camel@baylibre.com>
References: <20190304105358.4987-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304105358.4987-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 2019-03-04 at 11:53 +0100, Neil Armstrong wrote:
> When submitted v2 of the G12A AO-CLK IDs, the SAR_ADC_SEL ID was moved
> to the internal non-exported bindings, but this clock is necessary and
> mandatory for the SAR ADC bindings.
> 
> Export it back to the public bindings.
> 
> Fixes: be3d960b0aeb ("dt-bindings: clk: add G12A AO Clock and Reset Bindings")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/g12a-aoclk.h          | 1 -
>  include/dt-bindings/clock/g12a-aoclkc.h | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)

Acked-by: Jerome Brunet <jbrunet@baylibre.com>
