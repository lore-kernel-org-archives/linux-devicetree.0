From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 09/12] pinctrl: sunxi: Prepare for alternative bias
 voltage setting methods
Date: Mon, 8 Apr 2019 14:53:58 +0200
Message-ID: <CACRpkdY=G0rpxVZL8TKJOQcf+Na8o5_FwG0EyBfb-ZCYXi=_oA@mail.gmail.com>
References: <20190405234514.6183-1-megous@megous.com> <20190405234514.6183-10-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190405234514.6183-10-megous@megous.com>
Sender: netdev-owner@vger.kernel.org
To: megous@megous.com
Cc: linux-sunxi <linux-sunxi@googlegroups.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, Kalle Valo <kvalo@codeaurora.org>, Naveen Gupta <naveen.gupta@cypress.com>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 6, 2019 at 1:45 AM <megous@megous.com> wrote:

> From: Ondrej Jirman <megous@megous.com>
>
> H6 has a different I/O voltage bias setting method than A80. Prepare
> existing code for using alternative bias voltage setting methods.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c |  2 +-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c     | 38 ++++++++++++-----------
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h     |  4 ++-

I need Maxime's ACK on these patches to merge.

Can the pinctrl parts be applied independently of the rest
of the changes when Maxime is happy with the patches?

Yours,
Linus Walleij
