From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: meson8b: describe the
 embedded reset controller
Date: Thu, 3 Aug 2017 18:08:22 -0500
Message-ID: <20170803230822.5kd6y46pqnpxezms@rob-hp-laptop>
References: <20170728211313.10603-1-martin.blumenstingl@googlemail.com>
 <20170728211313.10603-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170728211313.10603-2-martin.blumenstingl@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org, narmstrong@baylibre.com, jbrunet@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 28, 2017 at 11:13:11PM +0200, Martin Blumenstingl wrote:
> The Amlogic Meson8/Meson8b/Meson8m2 clock controller provides some reset
> lines. These are used for example to boot the secondary CPU cores.
> 
> This patch describes the reset controller which is embedded into the
> clock controller on these SoCs.
> A header file is provided which provides preprocessor macros for each
> reset line (to make the .dts files easier to read).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/clock/amlogic,meson8b-clkc.txt        |  9 +++++++-
>  .../dt-bindings/reset/amlogic,meson8b-clkc-reset.h | 27 ++++++++++++++++++++++
>  2 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/reset/amlogic,meson8b-clkc-reset.h

Acked-by: Rob Herring <robh@kernel.org>
