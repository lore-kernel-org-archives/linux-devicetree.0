From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] pinctrl: sunxi: Add H3 R_PIO controller support
Date: Mon, 1 Feb 2016 08:09:31 -0600
Message-ID: <20160201140931.GA7238@rob-hp-laptop>
References: <20160201101225.GA19687@box2.japko.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160201101225.GA19687@box2.japko.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Adamski <k@japko.eu>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vishnu Patekar <vishnupatekar0510@gmail.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Jens Kuske <jenskuske@gmail.com>, linux-gpio@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 01, 2016 at 11:12:26AM +0100, Krzysztof Adamski wrote:
> H3 has additional PIO controller similar to what we can find on A23.
> It's a 12 pin port, described in H3 Datasheet rev 1.1, pages 345-350.
> 
> Signed-off-by: Krzysztof Adamski <k@japko.eu>
> ---
> .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   1 +
> arch/arm/boot/dts/sun8i-h3.dtsi                    |  12 +++

Acked-by: Rob Herring <robh@kernel.org>

> drivers/pinctrl/sunxi/Kconfig                      |   4 +
> drivers/pinctrl/sunxi/Makefile                     |   1 +
> drivers/pinctrl/sunxi/pinctrl-sun8i-h3-r.c         | 105 +++++++++++++++++++++
> 5 files changed, 123 insertions(+)
> create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-h3-r.c
