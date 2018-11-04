From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] arm64: dts: sdm845-mtp: Reserve reserved gpios
Date: Sun, 4 Nov 2018 16:56:48 +0100
Message-ID: <CACRpkdaynN0hfHukkxd55VZj4a4qZY-GrTjVDjv8_N3dJ679-g@mail.gmail.com>
References: <20181102214532.17661-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181102214532.17661-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 2, 2018 at 10:42 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> With the introduction of commit 3edfb7bd76bd ("gpiolib: Show correct
> direction from the beginning") the gpiolib will attempt to read the
> direction of all pins, which triggers a read from protected register
> regions.
>
> The pins 0 through 3 and 81 through 84 are protected, so mark these as
> reserved.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for fixing this up so elegantly.

Yours,
Linus Walleij
