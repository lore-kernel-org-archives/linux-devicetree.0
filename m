From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/4] pinctrl: qcom: Support dispersed tiles
Date: Wed, 26 Sep 2018 09:31:12 +0200
Message-ID: <CACRpkdamu83JidqT89iLOfqsuW_UxAUVxU=Faq_QownNb-R10Q@mail.gmail.com>
References: <20180924221748.21584-1-bjorn.andersson@linaro.org> <20180924221748.21584-3-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180924221748.21584-3-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 25, 2018 at 12:15 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> On some new platforms the tiles have been placed too far apart to be
> covered in a single ioremap. Turn "regs" into an array of base addresses
> and make the pingroup carry the information about which tile the pin
> resides in.
>
> For existing platforms we map the first entry regs and the existing
> pingroups will all use tile 0, meaning that there's no functional
> change.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied.

Yours,
Linus Walleij
