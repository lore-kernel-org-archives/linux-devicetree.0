From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 5/6] ARM: rockchip: Add pmu-sram binding
Date: Wed, 22 Oct 2014 17:09:44 -0700
Message-ID: <CAD=FV=U9rk3_T-yVaYnB0JDxTmYt_+=rxf+-wAS5UwroSZrvnQ@mail.gmail.com>
References: <1413933461-25602-1-git-send-email-zyw@rock-chips.com>
	<1413933960-25839-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413933960-25839-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Mike Turquette <mturquette@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Tony Xie <xxx@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Chris,

On Tue, Oct 21, 2014 at 4:26 PM, Chris Zhong <zyw@rock-chips.com> wrote:
> The pmu-sram is used to store resume code, suspend/resume need get the
> address of it. Therefore add a binding and documentation for it.
>
> Signed-off-by: Tony Xie <xxx@rock-chips.com>
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> ---
>
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>
>  .../devicetree/bindings/arm/rockchip/pmu-sram.txt  |   15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/rockchip/pmu-sram.txt
>
> diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu-sram.txt b/Documentation/devicetree/bindings/arm/rockchip/pmu-sram.txt
> new file mode 100644
> index 0000000..77284c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/rockchip/pmu-sram.txt
> @@ -0,0 +1,15 @@
> +Rockchip SRAM for pmu:
> +------------------------------
> +
> +The sram of pmu is used to store the function of resume from maskrom(the 1st
> +level loader).

It's probably best in this document to say that this is a common use
of the "pmu-sram" because it keeps power even in low power states in
the system.  ...this SRAM could be used for other things as well.


> +Required node properties:
> +- compatible : should be "rockchip,rk3288-pmu-sram"
> +- reg : physical base address and the size of the registers window
> +
> +Example:
> +       pmu_intmem@ff720000 {
> +               compatible = "rockchip,rk3288-pmu-sram", "mmio-sram";
> +               reg = <0xff720000 0x4000>;

As with the other patch, should probably change the size in the
example to 0x1000 (4K).

Otherwise this looks good to me.

-Doug
