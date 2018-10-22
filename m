From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sdm845: Add USB PHY lane two
Date: Mon, 22 Oct 2018 15:09:00 -0700
Message-ID: <CAD=FV=W4mfsB35XSnhL=p-K4vNVQBwpuq_3mULc3MKta-wwv4Q@mail.gmail.com>
References: <20181022205102.74825-1-evgreen@chromium.org> <20181022205102.74825-6-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181022205102.74825-6-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,
On Mon, Oct 22, 2018 at 1:52 PM Evan Green <evgreen@chromium.org> wrote:
>
> Add the second lane registers for the USB PHY, now that the
> QMP phy bindings have been updated. This way the driver can stop
> reaching beyond its register region to get at the second lane.
>
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
>
> Changes in v3:
>  - Removed erroneous fixup for USB UniPro PHY, which is not dual lane (Doug)
>
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Super.  Thanks for doing this.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
