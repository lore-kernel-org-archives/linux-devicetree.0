From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: stm32: move gpio irqs binding to optional
Date: Mon, 24 Oct 2016 01:56:25 +0200
Message-ID: <CACRpkdYne7Kjk_Bw-j6E6SPvx4z7G_5AzfHwYJi70F=DvguAxw@mail.gmail.com>
References: <1476970012-7838-1-git-send-email-alexandre.torgue@st.com> <1476970012-7838-3-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1476970012-7838-3-git-send-email-alexandre.torgue@st.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre TORGUE <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 20, 2016 at 3:26 PM, Alexandre TORGUE
<alexandre.torgue@st.com> wrote:

> stm32 pinctrl driver could be probed even if no interrupt controller
> is defined to manage gpio irqs. Entries related to gpio irq management
> are moved to optional.
>
> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

Patch applied for fixes.

Yours,
Linus Walleij
