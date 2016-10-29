From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2] pinctrl: qcom: Add msm8994 pinctrl driver
Date: Sat, 29 Oct 2016 10:27:00 +0200
Message-ID: <CACRpkda9fcUjtEuezEa-DdU_Q_OcE-kArRpY7RGp+aTFWWf=rA@mail.gmail.com>
References: <20161026233228.15219-1-michael.scott@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161026233228.15219-1-michael.scott@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Scott <michael.scott@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Joonwoo Park <joonwoop@codeaurora.org>, Jeremy McNicoll <jeremymc@redhat.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 27, 2016 at 1:32 AM, Michael Scott <michael.scott@linaro.org> w=
rote:

> Initial pinctrl driver for QCOM msm8994 platforms.
>
> In order to continue the initial board support for QCOM msm8994/msm8992
> presented in patches from Jeremy McNicoll <jeremymc@redhat.com>, let's pu=
t
> a proper pinctrl driver in place.
>
> Currently, the DT for these platforms uses the msm8x74 pinctrl driver to =
enable
> basic UART.  Beyond the first few pins the rest are different enough to j=
ustify
> it's own driver.
>
> Note: This driver is also be used by QCOM's msm8992 platform as it's TLM =
block
> is the same.
>
> - Initial formatting and style was taken from the msm8x74 pinctrl driver =
added
>   by Bj=C3=B6rn Andersson <bjorn.andersson@linaro.org>
> - Data was then adjusted per QCOM MSM8994 documentation for Top Level Mul=
tiplexing
> - Bindings documentation was based on qcom,msm8996-pinctrl.txt by
>   Joonwoo Park <joonwoop@codeaurora.org> and then modified for msm8994 co=
ntent
>
> Signed-off-by: Michael Scott <michael.scott@linaro.org>
> ---
>
> V1 -> V2: fixed missing FUNCTION(nav_pps) and removed 3 odd newlines betw=
een blsp_i2c4_groups and cci_timer0_groups

Looks fine to me, just like the other Qcom drivers.

I just want Bj=C3=B6rn Andersson's ACK before merging, Bj=C3=B6rn?

Yours,
Linus Walleij
