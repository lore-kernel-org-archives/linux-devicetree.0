From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: Add Qualcomm SDM845 TLMM binding
Date: Tue, 6 Feb 2018 14:34:07 +0100
Message-ID: <CACRpkdb19tbiCVeqnW=Z-6ZawxUk6NoeKFGoD28ZXMnFCmL43Q@mail.gmail.com>
References: <20180111060004.9333-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180111060004.9333-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 11, 2018 at 7:00 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> This adds the DeviceTree binding for the Qualcomm SDM845 TLMM block.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v1:
> - Added qspi related functions

Folded in the small fix requested by Rob and applied for v4.17 with his
review tag.

Yours,
Linus Walleij
