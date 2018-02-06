From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add sdm845 pinctrl driver
Date: Tue, 6 Feb 2018 14:37:49 +0100
Message-ID: <CACRpkdYvLnWxQcF3188PnrCmsmSqPQPicT7HvPknOe4Akt8uKg@mail.gmail.com>
References: <20180111060004.9333-1-bjorn.andersson@linaro.org> <20180111060004.9333-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20180111060004.9333-2-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 11, 2018 at 7:00 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> From: Kyle Yan <kyan@codeaurora.org>
>
> This adds the pinctrl definitions for the TLMM of SDM845.
>
> Signed-off-by: Kyle Yan <kyan@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied for v4.17.

> Changes since v1:
> - Corrected the authorship of the patch
> - Updated pin list to v2 hardware

Does that mean the v1 hardware is some prototype, only existing inside
Qualcomm & associates, all of which needs to be trashed now?

I hope it doesn't mean "oh yeah we shipped a few
million phones with that but they need to have a different kernel
and will never work with upstream".

Yours,
Linus Walleij
