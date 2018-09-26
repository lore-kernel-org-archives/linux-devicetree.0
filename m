From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] pinctrl: qcom: Introduce readl/writel accessors
Date: Wed, 26 Sep 2018 09:30:19 +0200
Message-ID: <CACRpkdazp0TNkaHufedgH5vBVjgy4DeA_Jw7XJj2b3cTJZJ8cg@mail.gmail.com>
References: <20180924221748.21584-1-bjorn.andersson@linaro.org> <20180924221748.21584-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180924221748.21584-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 25, 2018 at 12:15 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> In preparation for the support for dispersed tiles move all readl and
> writel calls to helper functions. This will allow us to isolate the
> added complexity of another indirection.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v1:
> - Rebased onto "devel"

Patch applied.

Yours,
Linus Walleij
