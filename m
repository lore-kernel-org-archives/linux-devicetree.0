From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/3] mfd: syscon: Add optional clock support
Date: Wed, 16 Jan 2019 13:14:13 +0100
Message-ID: <CAK8P3a1MucNG86=bXwVVsasGBOLJ67kuRSpoeneF6M5aB6GmQA@mail.gmail.com>
References: <1544604495-4082-1-git-send-email-fabrice.gasnier@st.com> <1544604495-4082-3-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544604495-4082-3-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

(sorry for the late reply, I just realized that I had never sent out the
mail after Lee asked me for a review last year and I had drafted
my reply).

On Wed, Dec 12, 2018 at 9:48 AM Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
>
> Some system control registers need to be clocked, so the registers can
> be accessed. Add an optional clock and attach it to regmap.
>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>

This looks ok to me in principle, but I have one question: When we
do a clk_get() and clk_prepare() as part of regmap_mmio_attach_clk(),
does that change the behavior of syscon nodes that are otherwise
unused?

I think we have a bunch of devices that started out as a syscon but
then we added a proper driver for them, which would handle the
clocks explicitly. Is it guaranteed that this will keep working (including
shutting down the clocks when they are unused) if we have two drivers
that call clk_get() on the same device node?

       Arnd
