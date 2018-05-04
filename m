From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 1/7] clk: msm8996-gcc: Mark halt check as no-op for
 USB/PCIE pipe_clk
Date: Fri, 4 May 2018 12:46:51 -0700
Message-ID: <CAD=FV=WNa=k__pymaTWEGtHn+QaHW7ezPb+ZsO4Z9UtLKYQQSg@mail.gmail.com>
References: <1525295174-15995-1-git-send-email-mgautam@codeaurora.org> <1525295174-15995-2-git-send-email-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525295174-15995-2-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Evan Green <evgreen@chromium.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, May 2, 2018 at 2:06 PM, Manu Gautam <mgautam@codeaurora.org> wrote:
> The USB and PCIE pipe clocks are sourced from external clocks
> inside the QMP USB/PCIE PHYs. Enabling or disabling of PIPE RCG
> clocks is dependent on PHY initialization sequence hence
> update halt_check to BRANCH_HALT_SKIP for these clocks so
> that clock status bit is not polled when enabling or disabling
> the clocks. It allows to simplify PHY client driver code which
> is both user and source of the pipe_clk and avoid error logging
> related status check on clk_disable/enable.
>
> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---
>  drivers/clk/qcom/gcc-msm8996.c | 4 ++++
>  1 file changed, 4 insertions(+)

FWIW this matches my understanding of what Stephen and you agreed upon.  Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
