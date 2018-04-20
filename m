From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 1/5] ARM: configs: multi_v7: Add I2C support
Date: Fri, 20 Apr 2018 12:07:44 +0200
Message-ID: <CAMuHMdWwmsOm_LjjhYBFseFa1HaWFCbGEGf+XbZxSSf3JC=vPQ@mail.gmail.com>
References: <1524215874-15093-1-git-send-email-pierre-yves.mordret@st.com> <1524215874-15093-2-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524215874-15093-2-git-send-email-pierre-yves.mordret@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, Marek Szyprowski <m.szyprowski@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Marc Zyngier <marc.zyngier@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Yangbo Lu <yangbo.lu@nxp.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Pierre-Yves,

On Fri, Apr 20, 2018 at 11:17 AM, Pierre-Yves MORDRET
<pierre-yves.mordret@st.com> wrote:
> This patch adds I2C F7 support to multi_v7_defconfig
>
> Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thanks for your patch!

I think the subject should be "ARM: multi_v7_defconfig: Add STM32F7
I2C support",
as generic I2C support is already enabled.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
