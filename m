From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/6] ARM: dts: stm32: add MFX support on I2C1 on
 stm32746g-eval
Date: Thu, 22 Feb 2018 14:54:31 +0100
Message-ID: <CACRpkdZFrRXEBW6KnqZ=h_7BxYn-RaAzhP4ovwC_DQSbAGZCVw@mail.gmail.com>
References: <1518100057-23234-1-git-send-email-amelie.delaunay@st.com>
 <1518100057-23234-5-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1518100057-23234-5-git-send-email-amelie.delaunay@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 8, 2018 at 3:27 PM, Amelie Delaunay <amelie.delaunay@st.com> wrote:

> MFX is used as gpio expander on stm32746g-eval.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

(...)
> +       mfx: mfx@42 {
> +               compatible = "st,mfx";
> +               reg = <0x42>;
> +               interrupts = <8 1>;
> +               interrupt-parent = <&gpioi>;
> +               interrupt-controller;
> +               #interrupt-cells = <1>;
> +
> +               mfxgpio: mfx_gpio {
> +                       compatible = "st,mfx-gpio";
> +                       interrupts = <0>;
> +                       interrupt-parent = <&mfx>;
> +                       gpio-controller;
> +                       #gpio-cells = <2>;

So I think this node should contain some pin config states
that can  be referenced by the drivers to set up push/pull
etc. Probably it can use just standard pin config properties
like sx150x.

Yours,
Linus Walleij
