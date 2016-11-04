From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V5] pinctrl: qcom: Add msm8994 pinctrl driver
Date: Fri, 4 Nov 2016 23:58:15 +0100
Message-ID: <CACRpkdZ4EyicXz0rR6cm6xvRmsk4r5=jxyZ4Nn6rmgHt2QL0aA@mail.gmail.com>
References: <20161103211526.6095-1-michael.scott@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20161103211526.6095-1-michael.scott@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Michael Scott <michael.scott@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Joonwoo Park <joonwoop@codeaurora.org>, Jeremy McNicoll <jeremymc@redhat.com>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 3, 2016 at 10:15 PM, Michael Scott <michael.scott@linaro.org> w=
rote:

> Initial pinctrl driver for QCOM msm8994 platforms.
>
> In order to continue the initial board support for QCOM msm8994/msm8992
> presented in patches from Jeremy McNicoll <jeremymc@redhat.com>, let's pu=
t
> a proper pinctrl driver in place.
>
> Currently, the DT for these platforms uses the msm8x74 pinctrl driver to
> enable basic UART.  Beyond the first few pins the rest are different enou=
gh
> to justify it's own driver.
>
> Note: This driver is also used by QCOM's msm8992 platform as it's TLM blo=
ck
> is the same.
>
> - Initial formatting and style was taken from the msm8x74 pinctrl driver
>   added by Bj=C3=B6rn Andersson <bjorn.andersson@linaro.org>
> - Data was then adjusted per QCOM MSM8994v2 documentation for Top Level
>   Multiplexing
> - Bindings documentation was based on qcom,msm8996-pinctrl.txt by
>   Joonwoo Park <joonwoop@codeaurora.org> and then modified for msm8994
>   content
>
> Signed-off-by: Michael Scott <michael.scott@linaro.org>
> Tested-by: Jeremy McNicoll <jeremymc@redhat.com>
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> V5:

This v5 version applied.

Yours,
Linus Walleij
