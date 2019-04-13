From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 11/12] brcmfmac: Loading the correct firmware for brcm43456
Date: Sat, 13 Apr 2019 11:06:20 +0000 (UTC)
Message-ID: <20190413110621.0EA6F61790@smtp.codeaurora.org>
References: <20190405234514.6183-12-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190405234514.6183-12-megous@megous.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Ondrej Jirman <megous@megous.com>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com, linux-stm32@st-md-mailman.stormreply.com, brcm80211-dev-list@cypress.com, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Arend van Spriel <arend.vanspriel@broadcom.com>, Alexandre Torgue <alexandre.torgue@st.com>, Hante Meuleman <hante.meuleman@broadcom.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Wright Feng <wright.feng@cypress.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Naveen Gupta <naveen.gupta@cypress.com>, Franky Lin <franky.lin@broadcom.com>Maxime Coquelin <m>
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
