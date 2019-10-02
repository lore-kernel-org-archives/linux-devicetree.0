From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: clock: meson8b: add the clock inputs
Date: Wed, 02 Oct 2019 09:19:09 -0500
Message-ID: <5d94b1e0.1c69fb81.4e2f9.3e79@mx.google.com>
References: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
 <20190921151223.768842-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190921151223.768842-2-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

On Sat, 21 Sep 2019 17:12:19 +0200, Martin Blumenstingl wrote:
> The clock controller on Meson8/Meson8b/Meson8m2 has three (known)
> inputs:
> - "xtal": the main 24MHz crystal
> - "ddr_pll": some of the audio clocks use the output of the DDR PLL as
>   input
> - "clk_32k": an optional clock signal which can be connected to GPIOAO_6
>   (which then has to be switched to the CLK_32K_IN function)
> 
> Add the inputs to the documentation so we can wire up these inputs in a
> follow-up patch.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../devicetree/bindings/clock/amlogic,meson8b-clkc.txt       | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
