From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: phy-qcom-qmp: Fix register underspecification
Date: Thu, 18 Oct 2018 16:50:34 -0700
Message-ID: <CAD=FV=XM9uG8EfamXmEp2-g5tgagir0KHpdMZMtL6ckqt+Jjsg@mail.gmail.com>
References: <20181018210933.113592-1-evgreen@chromium.org> <20181018210933.113592-2-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018210933.113592-2-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Manu Gautam <mgautam@codeaurora.org>, cang@codeaurora.org, Vivek Gautam <vivek.gautam@codeaurora.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Oct 18, 2018 at 2:09 PM Evan Green <evgreen@chromium.org> wrote:
>
> This change adds register regions for the second lane of dual-lane nodes.
> This additional specification is needed so that the driver can stop
> reaching beyond the tx and rx register allocations to get at the
> second lane registers in a dual-lane PHY.
>
> While in there, document #clock-cells as optional for PHYs that don't
> provide a pipe clock. Also, document the pcs_misc register region, which
> was being quietly supplied and used.
>
> Signed-off-by: Evan Green <evgreen@chromium.org>
>
> ---
> This applies atop linux-next 20181018 with the addition of Doug's
> changes [1] and [2].
>
> [1] https://lore.kernel.org/lkml/20181012213632.252346-1-dianders@chromium.org/
> [2] https://lore.kernel.org/lkml/20181012213926.253765-1-dianders@chromium.org/
>
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 73 +++++++++++++++++++---
>  1 file changed, 65 insertions(+), 8 deletions(-)

This all makes sense to me and seems like the right compromise to make

The only current SoC that uses tx2/rx2 is SDM845 and the support of
that SoC is in its infancy in mainline.  Thus I don't mind that we say
that all 5 registers are "required" even though there is an existing
device tree out there that don't include tx2/rx2 for USB.  Currently
patch #2 in this series still makes old device trees "work" (as well
as they used to) but I'm all for that being very temporary code and
that officially tx2/rx2 are not optional.


Reviewed-by: Douglas Anderson <dianders@chromium.org>
