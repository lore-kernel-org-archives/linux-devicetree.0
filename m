From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: stm32: remove dependency with interrupt controller
Date: Mon, 24 Oct 2016 01:55:23 +0200
Message-ID: <CACRpkdZVDod=FVnNa1+Kqre8QdrmPwM8mM2YcioSgJDR5AT=Ng@mail.gmail.com>
References: <1476970012-7838-1-git-send-email-alexandre.torgue@st.com> <1476970012-7838-2-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1476970012-7838-2-git-send-email-alexandre.torgue@st.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre TORGUE <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 20, 2016 at 3:26 PM, Alexandre TORGUE
<alexandre.torgue@st.com> wrote:

> This patch allows to probe stm32 pinctrl driver even if no interrupt
> controller is defined to manage gpio irqs.
>
> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

Patch applied for fixes.

Yours,
Linus Walleij
