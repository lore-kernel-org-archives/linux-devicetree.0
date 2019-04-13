From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 11/12] brcmfmac: Loading the correct firmware for brcm43456
Date: Sat, 13 Apr 2019 11:06:21 +0000 (UTC)
Message-ID: <20190413110621.584FC61797@smtp.codeaurora.org>
References: <20190405234514.6183-12-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190405234514.6183-12-megous@megous.com>
Sender: netdev-owner@vger.kernel.org
Cc: linux-sunxi@googlegroups.com, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Ondrej Jirman <megous@megous.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, Naveen
List-Id: devicetree@vger.kernel.org

megous@megous.com wrote:

> From: Ondrej Jirman <megous@megous.com>
> 
> SDIO based brcm43456 is currently misdetected as brcm43455 and the wrong
> firmware name is used. Correct the detection and load the correct
> firmware file. Chiprev for brcm43456 is "9".
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Patch applied to wireless-drivers-next.git, thanks.

e3062e05e1cf brcmfmac: Loading the correct firmware for brcm43456

-- 
https://patchwork.kernel.org/patch/10888023/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
