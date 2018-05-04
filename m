From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 2/7] phy: qcom-qmp: Enable pipe_clk before PHY initialization
Date: Fri, 4 May 2018 12:47:01 -0700
Message-ID: <CAD=FV=XqRLLeFOfFZWscZf0U_y4_HHeGQMpEcS3FPCX6_YMcvw@mail.gmail.com>
References: <1525295174-15995-1-git-send-email-mgautam@codeaurora.org> <1525295174-15995-3-git-send-email-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525295174-15995-3-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Evan Green <evgreen@chromium.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, May 2, 2018 at 2:06 PM, Manu Gautam <mgautam@codeaurora.org> wrote:
> QMP PHY for USB/PCIE requires pipe_clk for locking of
> retime buffers at the pipe interface. Driver checks for
> PHY_STATUS without enabling pipe_clk due to which
> phy_init() fails with initialization timeout.
> Though pipe_clk is output from PHY (after PLL is programmed
> during initialization sequence) to GCC clock_ctl and then fed
> back to PHY but for PHY_STATUS register to reflect successful
> initialization pipe_clk from GCC must be present.
> Since, clock driver now ignores status_check for pipe_clk on
> clk_enable/disable, driver can safely enable/disable pipe_clk
> from phy_init/exit.
>
> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)

Given the agreement with Stephen Boyd that we'll just BRANCH_HALT_SKIP
for now, this all looks good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
