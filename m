From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC 05/14] dt-bindings/interrupt-controller: pdc: add SPI
 config register
Date: Wed, 11 Sep 2019 10:59:16 +0100
Message-ID: <CACRpkdaReFzjb_hcDbQwqMX+whzscLpeZpJPHKqOo+9tANzemA@mail.gmail.com>
References: <20190829181203.2660-1-ilina@codeaurora.org> <20190829181203.2660-6-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829181203.2660-6-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: Stephen Boyd <swboyd@chromium.org>, Evan Green <evgreen@chromium.org>, Marc Zyngier <marc.zyngier@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, mkshah@codeaurora.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 29, 2019 at 8:47 PM Lina Iyer <ilina@codeaurora.org> wrote:

> +- qcom,scm-spi-cfg:
> +       Usage: optional
> +       Value type: <bool>
> +       Definition: Specifies if the SPI configuration registers have to be
> +                   written from the firmware.
> +
>  Example:
>
>         pdc: interrupt-controller@b220000 {
>                 compatible = "qcom,sdm845-pdc";
> -               reg = <0xb220000 0x30000>;
> +               reg = <0xb220000 0x30000>, <0x179900f0 0x60>;
>                 qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
>                 #interrupt-cells = <2>;
>                 interrupt-parent = <&intc>;
>                 interrupt-controller;
> +               qcom,scm-spi-cfg;

You can probably drop this bool if you just give names to the registers.

Like
reg = <0xb220000 0x30000>, <0x179900f0 0x60>;
reg-names = "gic", "pdc";

Then jus check explicitly for a "pdc" register and in that case
initialize the PDC.

Yours,
Linus Walleij
