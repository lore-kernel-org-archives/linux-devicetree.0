From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/8] pinctrl: qcom: spmi-mpp: Transpose pinmux function
Date: Fri, 17 Jul 2015 14:31:55 +0200
Message-ID: <CACRpkdaNoDCPApobubTSHF+N-3Nots3iOx0_zGPPyJcrGG==9g@mail.gmail.com>
References: <1434610052-602-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1434610052-602-7-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1434610052-602-7-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 18, 2015 at 8:47 AM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:

> The "function" of the MPP driver was inherited from the GPIO driver, but the
> differences between the two hardware blocks makes both the driver and the
> device tree binding to be awkward.
>
> Instead of overloading the "normal" function with various modes this patch
> transposes the pinmux function to represent the three operating modes of the
> MPP (digital, analog and current sink). The properties of pin pairing and DTEST
> routing is moved to separate properties.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Patch applied.

Yours,
Linus Walleij
