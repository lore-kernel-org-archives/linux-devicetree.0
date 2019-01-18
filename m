From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add CPU topology
Date: Thu, 17 Jan 2019 18:50:46 -0800
Message-ID: <CAD=FV=Xac6FCx=scgm5BCBsHFgtvqBpHT1ziKzrOWR2y7+J-_A@mail.gmail.com>
References: <20190114184255.258318-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190114184255.258318-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Jan 14, 2019 at 10:43 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> The 8 CPU cores of the SDM845 are organized in two clusters of 4 big
> ("gold") and 4 little ("silver") cores. Add a cpu-map node to the DT
> that describes this topology.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 38 ++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)

Looks right to me and matches bindings examples.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
