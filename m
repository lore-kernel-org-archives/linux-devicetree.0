From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/3] pinctrl: msm: add support to configure ipq40xx
 GPIO_PULL bits
Date: Mon, 31 Jul 2017 15:19:01 +0200
Message-ID: <CACRpkdaWXmWiEp0dRHKDJ9mT5qVi_6mTvKaM2Gfc1Qrjm_Xapg@mail.gmail.com>
References: <941e3869bdeddb2bebcc52ebfd57efe014887bc6.1500038134.git.chunkeey@googlemail.com>
 <d45ae31e888ad858d9f4396cabb4dc32a3f0365e.1500038134.git.chunkeey@googlemail.com>
 <895bbe5061fe2a6825503f57263a4eff9bb78a3c.1500038134.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <895bbe5061fe2a6825503f57263a4eff9bb78a3c.1500038134.git.chunkeey@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ram Chandra Jangir <rjangir@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 14, 2017 at 4:14 PM, Christian Lamparter
<chunkeey@googlemail.com> wrote:

> From: Ram Chandra Jangir <rjangir@codeaurora.org>
>
> GPIO_PULL bits configurations in TLMM_GPIO_CFG register
> differs for IPQ40xx from rest of the other qcom SoCs.
> As it does not support the keeper state and therefore can't
> support bias-bus-hold property.
>
> This patch adds a pull_no_keeper setting which configures the
> msm_gpio_pull bits for ipq40xx. This is required to fix the
> proper configurations of gpio-pull bits for nand pins mux.
>
> IPQ40xx SoC:
> 2'b10: Internal pull up enable.
> 2'b11: Unsupport
>
> For other SoC's:
> 2'b10: Keeper
> 2'b11: Pull-Up
>
> Note: Due to pull_no_keeper length, all kerneldoc entries
> in the msm_pinctrl_soc_data struct had to be realigned.
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Ram Chandra Jangir <rjangir@codeaurora.org>
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>

Patch applied.

Yours,
Linus Walleij
