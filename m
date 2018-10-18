From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sdm845: Add UFS nodes for sdm845-mtp
Date: Thu, 18 Oct 2018 16:52:28 -0700
Message-ID: <CAD=FV=VFceh3gho4G48FWVk1mkN7GQSBWueeopbJj4PHiN-d0g@mail.gmail.com>
References: <20181018210933.113592-1-evgreen@chromium.org> <20181018210933.113592-5-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018210933.113592-5-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Manu Gautam <mgautam@codeaurora.org>, cang@codeaurora.org, Vivek Gautam <vivek.gautam@codeaurora.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Oct 18, 2018 at 2:10 PM Evan Green <evgreen@chromium.org> wrote:
>
> From: Can Guo <cang@codeaurora.org>
>
> This change enables the UFS host controller and PHY on sdm845-mtp.
>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Evan Green <evgreen@chromium.org>
> Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
