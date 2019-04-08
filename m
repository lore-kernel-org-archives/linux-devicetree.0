From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] ARM: dts: stm32: add stpmic1 support on stm32mp157a
 dk1 board
Date: Mon, 8 Apr 2019 14:06:14 +0200
Message-ID: <CACRpkdb-ePddcJJLiFfOrP2QbxsNG2xQ17b5etrMHNGE3sFBmA@mail.gmail.com>
References: <1554298852-9955-1-git-send-email-p.paillet@st.com> <1554298852-9955-3-git-send-email-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554298852-9955-3-git-send-email-p.paillet@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pascal PAILLET-LME <p.paillet@st.com>
Cc: "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "olof@lixom.net" <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "biju.das@bp.renesas.com" <biju.das@bp.renesas.com>, Yannick FERTRE <yannick.fertre@st.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 3, 2019 at 3:41 PM Pascal PAILLET-LME <p.paillet@st.com> wrote:

> This patch adds stpmic1 support on stm32mp157a dk1 board.
> The STPMIC1 is a PMIC from STMicroelectronics. The STPMIC1 integrates 10
> regulators, 3 power switches, a watchdog and an input for a power on key.
>
> Signed-off-by: Pascal Paillet <p.paillet@st.com>
(...)
> +       status = "okay";
> +       /delete-property/dmas;
> +       /delete-property/dma-names;

Same comment here. Is the I2C DMA not working?
Why?

Yours,
Linus Walleij
