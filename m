From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sdm845: add UFS controller
Date: Thu, 18 Oct 2018 16:52:12 -0700
Message-ID: <CAD=FV=VFRxsa5CeUcKSx-Ar4sGDWCUkO1cQgHtfHjHCnfwpHTA@mail.gmail.com>
References: <20181018210933.113592-1-evgreen@chromium.org> <20181018210933.113592-4-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018210933.113592-4-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Manu Gautam <mgautam@codeaurora.org>, cang@codeaurora.org, Vivek Gautam <vivek.gautam@codeaurora.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,
On Thu, Oct 18, 2018 at 2:10 PM Evan Green <evgreen@chromium.org> wrote:
>
> This change adds the UFS controller and PHY to SDM845.
>
> Signed-off-by: Evan Green <evgreen@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 67 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)

I'm already in the Signed-off-by since I did some touching of this
patch, so not sure it makes sense to provide my Reviewed-by on this
patch.  ...but I'll at least make the note that it seems good and
matches my understanding


As mentioned in patch #2 ideally this patch should land after the
driver fix so the old driver doesn't try to use the "tx2" range as
"pcs_misc".

-Doug
