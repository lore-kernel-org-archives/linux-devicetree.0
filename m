From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v4 1/4] gpio: syscon: rockchip: add GRF GPIO support for rk3328
Date: Wed, 01 Aug 2018 13:46:49 +0200
Message-ID: <4408660.D6TumT1hZf@phil>
References: <1533016762-5268-1-git-send-email-djw@t-chip.com.cn> <1533016762-5268-2-git-send-email-djw@t-chip.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533016762-5268-2-git-send-email-djw@t-chip.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: djw@t-chip.com.cn
Cc: linux-rockchip@lists.infradead.org, Wayne Chou <zxf@t-chip.com.cn>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 31. Juli 2018, 07:59:19 CEST schrieb djw@t-chip.com.cn:
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

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

It looks like Linus (Torvalds) is doing an -rc8 this time [0] so we might
still be in time for 4.19 , depending on when this patch is going to be
applied ;-) .


Heiko


[0] https://lore.kernel.org/lkml/CA+55aFzHRaNMHxLCEa5Zke-1FgbQ4rtHf8-HOu0zBzo4Liz88A@mail.gmail.com/
