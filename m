From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/14] pinctrl: sunxi: Add A83T R_PIO controller support
Date: Mon, 1 Feb 2016 09:00:58 -0600
Message-ID: <20160201150058.GA3209@rob-hp-laptop>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-2-git-send-email-vishnupatekar0510@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454203266-4450-2-git-send-email-vishnupatekar0510@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: corbet@lwn.net, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, maxime.ripard@free-electrons.com, linux@arm.linux.org.uk, emilio@elopez.com.ar, jenskuske@gmail.com, hdegoede@redhat.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, mturquette@baylibre.com, sboyd@codeaurora.org, patchesrdh@mveas.com, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 31, 2016 at 09:20:53AM +0800, Vishnu Patekar wrote:
> The A83T has R_PIO pin controller, it's same as A23, execpt A83T
> interrupt bit is 6th and A83T has one extra pin PL12.
> 
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
> ---
>  .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/sunxi/Kconfig                      |   5 +
>  drivers/pinctrl/sunxi/Makefile                     |   1 +
>  drivers/pinctrl/sunxi/pinctrl-sun8i-a83t-r.c       | 119 +++++++++++++++++++++
>  4 files changed, 126 insertions(+)
>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-a83t-r.c
