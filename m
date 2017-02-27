From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] ARM64: dts: meson-gx: add clock CLKID_RNG0 to
 hwrng node
Date: Mon, 27 Feb 2017 16:16:31 -0600
Message-ID: <20170227221631.g77uphvikrxf7zkh@rob-hp-laptop>
References: <daf765e2-1a60-8dea-fee0-8af6ddecdf8e@gmail.com>
 <8bf052e3-de8f-dbdf-be76-369a7bb1ed15@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8bf052e3-de8f-dbdf-be76-369a7bb1ed15@gmail.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Herbert Xu <herbert@gondor.apana.org.au>, Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-crypto@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 21, 2017 at 09:18:16PM +0100, Heiner Kallweit wrote:
> Add clock CLKID_RNG0 to HW randon number generator node and
> extend the DT binding documentation accordingly.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - splitted first version of patch into two
> - add DT binding documentation
> - mention that clock is optional
> - replace spaces with tabs in DT binding example
> ---
>  Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt | 8 ++++++--
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi                   | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                 | 5 +++++
>  3 files changed, 12 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
