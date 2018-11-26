Return-Path: <SRS0=1nz3=OF=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
References: <20181120054522.18698-1-shawn.guo@linaro.org>
In-Reply-To: <20181120054522.18698-1-shawn.guo@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Nov 2018 09:12:43 +0100
Message-ID: <CACRpkdbwsJra4OYQXJtEY6KuXebe8YBJHUi64-i4+1uPxHK+Uw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: fix qcom-pmic-gpio for pms405
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, vkoul@kernel.org, linux-arm-msm@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Nov 20, 2018 at 6:45 AM Shawn Guo <shawn.guo@linaro.org> wrote:

> Rather than gpio1-gpio11 for pms405, there are 12 GPIOs for pms405.
> But gpio1, gpio9 and gpio10 are not available.  Fix the bindings doc
> to make it correct for pms405.
>
> Fixes: ed80f6eb799a ("dt-bindings: pinctrl: qcom-pmic-gpio: Add pms405 su=
pport")
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Patch applied (unless Bj=C3=B6rn has objections).

Yours,
Linus Walleij
