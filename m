From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845: Add qspi (quad SPI) node
Date: Wed, 28 Nov 2018 10:59:33 -0800
Message-ID: <CAD=FV=X-Y1q9-1EMAJmB+axwYb9yXz-vHq-3SLhwR18rTRstXg@mail.gmail.com>
References: <20181008201711.152038-1-dianders@chromium.org> <153904072826.119890.13295983146179211257@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <153904072826.119890.13295983146179211257@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, ryandcase@chromium.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Girish Mahadevan <girishm@codeaurora.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Andy,

On Mon, Oct 8, 2018 at 4:18 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2018-10-08 13:17:11)
> > This adds the Quad SPI controller to the main sdm845 device tree file.
> > Boards will be expected to assign the proper pinctrl depending on how
> > many chip selects they have hooked up and how many data lines.
> >
> > This depends on commit 48735597f7bd ("clk: qcom: Add qspi (Quad SPI)
> > clock defines for sdm845 to header") to add the needed defines.  It
> > also shouldn't land until the patch ("dt-bindings: spi: Qualcomm Quad
> > SPI(QSPI) documentation") [1] lands.
> >
> > [1] https://lkml.kernel.org/r/20181002214709.162330-1-ryandcase@chromium.org
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Any reason why this patch can't land?

Thanks!

-Doug
