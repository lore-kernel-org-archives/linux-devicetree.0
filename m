From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] pinctrl: st: Add Interrupt support.
Date: Thu, 23 Jan 2014 08:22:53 +0100
Message-ID: <CACRpkdZV7TBP7Ac1MPVSAgJeqWtDQEuT3dHjUJHgDTeX9_datw@mail.gmail.com>
References: <1389886545-31498-1-git-send-email-srinivas.kandagatla@st.com>
	<1389886613-31945-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1389886613-31945-1-git-send-email-srinivas.kandagatla@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 16, 2014 at 4:36 PM,  <srinivas.kandagatla@st.com> wrote:

> From: Srinivas Kandagatla <srinivas.kandagatla@st.com>
>
> This patch add interrupt support to the pincontroller driver.
>
> ST Pincontroller GPIO bank can have one of the two possible types of
> interrupt-wirings.
>
> First type is via irqmux, single interrupt is used by multiple gpio
> banks. This reduces number of overall interrupts numbers required. All
> these banks belong to a single pincontroller.
>                   _________
>                  |         |----> [gpio-bank (n)    ]
>                  |         |----> [gpio-bank (n + 1)]
>         [irqN]-- | irq-mux |----> [gpio-bank (n + 2)]
>                  |         |----> [gpio-bank (...  )]
>                  |_________|----> [gpio-bank (n + 7)]
>
> Second type has a dedicated interrupt per gpio bank.
>
>         [irqN]----> [gpio-bank (n)]
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@st.com>

I've applied this patch so that it won't just sit idle.
Besides you've done a real good job on it Srinivas.

It'll be for v3.15 though and I'm still waiting to see if
the device tree people say something about it.

Yours,
Linus Walleij
