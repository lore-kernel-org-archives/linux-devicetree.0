From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] ARM: dts: stm32: add stpmic1 support on stm32mp157c
 ed1 board
Date: Mon, 8 Apr 2019 15:06:52 +0200
Message-ID: <CACRpkdY1Vd_xDgoF8NaJ85Dy+ub0-GPTdU9sttB5uzmJnRXw2g@mail.gmail.com>
References: <1554298852-9955-1-git-send-email-p.paillet@st.com>
 <1554298852-9955-2-git-send-email-p.paillet@st.com> <CACRpkdZ9evBnvnmidQ2VW=dPUdGBM4Pkzo1VyMfDdQZFe6U7TA@mail.gmail.com>
 <5CAB3DF8.7020505@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5CAB3DF8.7020505@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pascal PAILLET-LME <p.paillet@st.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "olof@lixom.net" <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "biju.das@bp.renesas.com" <biju.das@bp.renesas.com>, Yannick FERTRE <yannick.fertre@st.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lis>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 8, 2019 at 2:26 PM Pascal PAILLET-LME <p.paillet@st.com> wrote:

> > I hope you are not trying to work around a bug in the driver by
> > stripping out DMA configuration from the device tree, because then
> > it is probably a better idea to fix the bug.

> This is not a workaround. The PMIC can use the DMA over I2C bus.
> Our goal is to avoid using a DMA channel for a consumer that generates a
> very few traffic. Dma channels may lack for other use cases.
>
> If you agree, you can add the to the commit message.

OK I understand, then also write it directly in the dts as a comment,
so people understand why it is being removed when they just look
in the device tree.

Yours,
Linus Walleij
