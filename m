From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 2/5] phy: qcom-qmp: Utilize fully-specified DT registers
Date: Thu, 18 Oct 2018 16:51:08 -0700
Message-ID: <CAD=FV=VMnTEUgPoDnfF-Oh8FDj9hy+ohz6oViJOtZCD_K-t_Dg@mail.gmail.com>
References: <20181018210933.113592-1-evgreen@chromium.org> <20181018210933.113592-3-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018210933.113592-3-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Manu Gautam <mgautam@codeaurora.org>, cang@codeaurora.org, Vivek Gautam <vivek.gautam@codeaurora.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Oct 18, 2018 at 2:09 PM Evan Green <evgreen@chromium.org> wrote:
>
> This change utilizes the newly fixed up DT bindings to get the tx2
> and rx2 register regions for the second lane of dual-lane PHYs. Before
> this change, the driver was simply using lane one's register region and
> adding 0x400, which reached well beyond the DT-specified register
> allocation. This would have been a crash were it not for the page size on
> ARM64. Fix the driver not to rely on the magic of virtual memory by using
> the newly specified DT register regions for tx2 and rx2.
>
> In order to support existing device trees, this change also contains a
> fallback mode for when those new register regions don't exist, which
> reverts to the original behavior of overreaching and prints a complaint.
>
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 51 +++++++++++++++++++++++++++----------
>  1 file changed, 38 insertions(+), 13 deletions(-)

Looks good to me.  This seems like the right compromise for moving
forward to fix the problem.

A few notes:

* The only current SoC that uses tx2/rx2 is SDM845 and the support of
that SoC is in its infancy in mainline.  Thus I don't mind that using
existing device trees with this new patch will print a warning and
continue to take advantage of the Linux "bug" that the whole page
could be accessed.  We should fix the old DTS files ASAP and then
remove the nod to backward compatibility in the code.

* This should land _before_ dts patches land.  If dts changes land
without this change then the old code will end up mapping tx2 and
using it as pcsmisc.  ...so either we'll need to delay landing the
device tree patch by one major version or Andy / Kishon will need to
coordinate.


Reviewed-by: Douglas Anderson <dianders@chromium.org>
