From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/4] gpio: syscon: rockchip: add GRF GPIO support for
 rk3328
Date: Tue, 31 Jul 2018 13:36:44 -0600
Message-ID: <20180731193644.GA10459@rob-hp-laptop>
References: <1533016762-5268-1-git-send-email-djw@t-chip.com.cn>
 <1533016762-5268-2-git-send-email-djw@t-chip.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1533016762-5268-2-git-send-email-djw@t-chip.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: djw@t-chip.com.cn
Cc: linux-rockchip@lists.infradead.org, Wayne Chou <zxf@t-chip.com.cn>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 31, 2018 at 01:59:19PM +0800, djw@t-chip.com.cn wrote:
> From: Levin Du <djw@t-chip.com.cn>
> 
> In Rockchip RK3328, the output only GPIO_MUTE pin, originally for codec
> mute control, can also be used for general purpose. It is manipulated by
> the GRF_SOC_CON10 register in GRF. Aside from the GPIO_MUTE pin, the HDMI
> pins can also be set in the same way.
> 
> Currently this GRF GPIO controller only supports the mute pin. If needed
> in the future, the HDMI pins support can also be added.
> 
> Signed-off-by: Levin Du <djw@t-chip.com.cn>
> 
> ---
> 
> Changes in v4:
> - Rename the GPIO binding to "rockchip,rk3328-grf-gpio"
> 
> Changes in v3:
> - Change from general gpio-syscon to specific rk3328-gpio-mute
> 
> Changes in v2:
> - Rename gpio_syscon10 to gpio_mute in doc
> 
> Changes in v1:
> - Refactured for general gpio-syscon usage for Rockchip SoCs.
> - Add doc rockchip,gpio-syscon.txt
> 
>  .../bindings/gpio/rockchip,rk3328-grf-gpio.txt     | 32 ++++++++++++++++++++++
>  drivers/gpio/gpio-syscon.c                         | 31 +++++++++++++++++++++
>  2 files changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.txt

Reviewed-by: Rob Herring <robh@kernel.org>
