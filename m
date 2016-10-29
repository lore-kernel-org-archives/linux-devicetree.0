From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH V2] pinctrl: qcom: Add msm8994 pinctrl driver
Date: Sat, 29 Oct 2016 11:06:58 -0700
Message-ID: <20161029180658.GD25787@tuxbot>
References: <20161026233228.15219-1-michael.scott@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161026233228.15219-1-michael.scott@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Michael Scott <michael.scott@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Joonwoo Park <joonwoop@codeaurora.org>, Jeremy McNicoll <jeremymc@redhat.com>
List-Id: devicetree@vger.kernel.org

On Wed 26 Oct 16:32 PDT 2016, Michael Scott wrote:

> Initial pinctrl driver for QCOM msm8994 platforms.
> 
> In order to continue the initial board support for QCOM msm8994/msm8992
> presented in patches from Jeremy McNicoll <jeremymc@redhat.com>, let's put
> a proper pinctrl driver in place.
> 
> Currently, the DT for these platforms uses the msm8x74 pinctrl driver to enable
> basic UART.  Beyond the first few pins the rest are different enough to justify
> it's own driver.
> 
> Note: This driver is also be used by QCOM's msm8992 platform as it's TLM block
> is the same.
> 

I'm not up to speed on the 8992/8994 story, but please add a
"qcom,msm8992-pinctrl" compatible to the list as well.

> - Initial formatting and style was taken from the msm8x74 pinctrl driver added
>   by Björn Andersson <bjorn.andersson@linaro.org>
> - Data was then adjusted per QCOM MSM8994 documentation for Top Level Multiplexing

I think this is good enough. It looks reasonable and you based it on the
data sheet. Any fixes to the tables can be added incrementally.

> - Bindings documentation was based on qcom,msm8996-pinctrl.txt by
>   Joonwoo Park <joonwoop@codeaurora.org> and then modified for msm8994 content
> 
> Signed-off-by: Michael Scott <michael.scott@linaro.org>

Please add the compatible and you have my

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
