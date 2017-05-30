From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RfC v3 7/7] pinctrl: meson: add interrupt controller to
 GPIO DT nodes
Date: Tue, 30 May 2017 16:44:29 -0500
Message-ID: <20170530214429.pulyr4hnhss4cmcr@rob-hp-laptop>
References: <16950080-b19d-e25c-fb48-bc79cfe4acc0@gmail.com>
 <1c8aa228-c1da-ed48-52a5-184332eecf26@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1c8aa228-c1da-ed48-52a5-184332eecf26@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 17, 2017 at 10:17:10PM +0200, Heiner Kallweit wrote:
> Add interrupt controller properties to the gpio controller nodes and
> extend the gpio controller DT binding documentation.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v3:
> - added to the patch series
> ---
>  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 4 ++++
>  arch/arm/boot/dts/meson8.dtsi                               | 2 ++
>  arch/arm/boot/dts/meson8b.dtsi                              | 2 ++
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                 | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                  | 4 ++++
>  5 files changed, 16 insertions(+)

Bindings and dts changes should be separate patches. With that,

Acked-by: Rob Herring <robh@kernel.org>
