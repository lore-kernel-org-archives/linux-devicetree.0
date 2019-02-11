From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add dynamic CPU power coefficients
Date: Mon, 11 Feb 2019 11:29:32 -0800
Message-ID: <CAD=FV=UhbuaVkSgeXA75d7+Aw68cNaaiewaSZR+psqfUU+avTg@mail.gmail.com>
References: <20190211190019.171583-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211190019.171583-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Amit Kucheria <amit.kucheria@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Feb 11, 2019 at 11:00 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Add dynamic power coefficients for the Silver and Gold CPU cores of
> the Qualcomm SDM845.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)

Matches the numbers I saw reported.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
