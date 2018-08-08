From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add dispcc node
Date: Wed, 8 Aug 2018 13:39:43 -0700
Message-ID: <CAD=FV=VwRp4ip_icn5bUWBbE0XatZrmu5m3pyfifm-s8cS0ShA@mail.gmail.com>
References: <20180803222059.146666-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180803222059.146666-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Aug 3, 2018 at 3:20 PM, Matthias Kaehlcke <mka@chromium.org> wrote:
> This adds the display clock controller node to sdm845 based on the
> examples in the bindings.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> The dispcc driver and DT bindings landed in the clk-qcom-dispcc-845
> branch of the clk tree.
>
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)

Peachy keen.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
