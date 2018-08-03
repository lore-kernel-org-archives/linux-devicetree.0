From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/4] gpio: syscon: rockchip: add GRF GPIO support for rk3328
Date: Fri, 3 Aug 2018 19:13:21 +0200
Message-ID: <CACRpkdZapWq6t772Hy0COSZ0n4+qR5sd26E9QuQ6_exNeupEXA@mail.gmail.com>
References: <1533016762-5268-1-git-send-email-djw@t-chip.com.cn> <1533016762-5268-2-git-send-email-djw@t-chip.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533016762-5268-2-git-send-email-djw@t-chip.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: Levin Du <djw@t-chip.com.cn>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Wayne Chou <zxf@t-chip.com.cn>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 31, 2018 at 8:00 AM <djw@t-chip.com.cn> wrote:

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

Patch applied with Rob's and Heiko's ACKs.

Yours,
Linus Walleij
