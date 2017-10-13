From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974: Add Sony Xperia Z2 Tablet
Date: Fri, 13 Oct 2017 14:05:08 +0200
Message-ID: <CACRpkdba8+NibBQ35Yupwy6aFcHwbyoF+gw_ZyYsc1=jAt0kpA@mail.gmail.com>
References: <20171004185857.24510-1-bjorn.andersson@linaro.org> <20171004185857.24510-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171004185857.24510-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 4, 2017 at 8:58 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
>
> This adds a basic DTS file for the Sony Xperia Z2 Tablet, containing
> definitions for regulators, eMMC/SD-card, USB, WiFi, Touchscreen,
> charger, backlight, coincell and buttons.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

This looks like a nice start to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Just bluetooth, audio and a panel driver for the graphics and
you're there, right? Piece if cake ;)

Yours,
Linus Walleij
