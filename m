From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/8] pinctrl: qcom: spmi-mpp: Add support for setting
 analog output level
Date: Tue, 14 Jul 2015 13:04:00 +0200
Message-ID: <CACRpkdZ+8Ct1sfi2yh1uBM1Q5vonkm8M5Aw4rL70OGqcCBDKqw@mail.gmail.com>
References: <1434610052-602-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1434610052-602-6-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1434610052-602-6-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 18, 2015 at 8:47 AM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:

> When the MPP is configured for analog output the output level is selected by
> the AOUT_CTL register, this patch makes it possible to control this.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Holding the application of patches here until Ivan's
comment is addressed, its OK to resend just the patches that need
alterations, just preserve the 5/8 please so I don't get too confused...

Yours,
Linus Walleij
