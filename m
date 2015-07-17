From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 5/8] pinctrl: qcom: spmi-mpp: Add support for setting
 analog output level
Date: Fri, 17 Jul 2015 14:30:28 +0200
Message-ID: <CACRpkdZ6dNEi1vQoCvg1fHVH3UsOswNL8KvpU2DZprGboJ2_9g@mail.gmail.com>
References: <1434610052-602-6-git-send-email-bjorn.andersson@sonymobile.com>
	<1436942435-25611-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436942435-25611-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 15, 2015 at 8:40 AM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:

> When the MPP is configured for analog output the output level is selected by
> the AOUT_CTL register, this patch makes it possible to control this.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>
> Changes since v1:
> - Assign aout_level in pmic_mpp_populate()

Applied this v2 version for v4.3 unless someone protests.

Yours,
Linus Walleij
