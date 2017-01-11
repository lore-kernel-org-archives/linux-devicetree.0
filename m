From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: Add msm8998 pinctrl driver
Date: Wed, 11 Jan 2017 16:12:47 +0100
Message-ID: <CACRpkdZKd5AOPGwr3k2R5U3dOYEmbrmrZG3WiDNBOYnpU9Snyw@mail.gmail.com>
References: <1483974019-8235-1-git-send-email-kimran@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1483974019-8235-1-git-send-email-kimran@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Imran Khan <kimran@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 9, 2017 at 4:00 PM, Imran Khan <kimran@codeaurora.org> wrote:

> Add initial pinctrl driver to support pin configuration with
> pinctrl framework for msm8998.
>
> Signed-off-by: Imran Khan <kimran@codeaurora.org>

You need review from the Qcom pinctrl maintainer Bjorn Andersson
for this patch.


+#define NORTH  0x500000
+#define WEST   0x100000
+#define EAST   0x900000
(...)
> +static const struct msm_pingroup msm8998_groups[] = {
> +       PINGROUP(0, EAST, blsp_spi1, blsp_uart1_a, blsp_uim1_a, NA, NA, NA, NA,
(...)
> +       PINGROUP(6, WEST, blsp_spi8, blsp_uart8_a, blsp_i2c8, NA, NA, NA, NA,
(...)
> +       PINGROUP(35, NORTH, pci_e0, jitter_bist, NA, NA, NA, NA, NA, NA, NA),
(...)

No south? :)

Are these the left/right/top edges of the chip or a reference
to x86 bridges terminology? It warrants that you add a comment
to the driver file explaining what it means.

Yours,
Linus Walleij
