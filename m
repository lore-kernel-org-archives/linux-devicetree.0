From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] ARM: dts: stm32: add stpmic1 support on
 stm32mp157c ed1 board
Date: Thu, 11 Apr 2019 15:33:02 +0200
Message-ID: <CACRpkdZBkLHfPdNjeVWwg5Nv23gxY2wFeXa2GAX=1pvL7bXw5g@mail.gmail.com>
References: <1554800820-5412-1-git-send-email-p.paillet@st.com> <1554800820-5412-2-git-send-email-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554800820-5412-2-git-send-email-p.paillet@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pascal PAILLET-LME <p.paillet@st.com>
Cc: "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "olof@lixom.net" <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "biju.das@bp.renesas.com" <biju.das@bp.renesas.com>, Yannick FERTRE <yannick.fertre@st.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 9, 2019 at 11:08 AM Pascal PAILLET-LME <p.paillet@st.com> wrote:

> This patch adds stpmic1 support on stm32mp157c ed1 board.
> The STPMIC1 is a PMIC from STMicroelectronics. The STPMIC1 integrates 10
> regulators, 3 power switches, a watchdog and an input for a power on key.
> The DMAs are disabled because the PMIC generates a very few traffic and
> DMA channels may lack for other usage.
>
> Signed-off-by: Pascal Paillet <p.paillet@st.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
