From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v2 1/4] drivers: soc: Add broadcast base for Last Level
 Cache Controller (LLCC)
Date: Thu, 23 Aug 2018 16:01:36 -0700
Message-ID: <CAE=gft64sF7APE490guRHo7PS9XsFkPn9-ZKcMB4_wPE5FXONQ@mail.gmail.com>
References: <1534550915-18230-1-git-send-email-vnkgutta@codeaurora.org> <1534550915-18230-2-git-send-email-vnkgutta@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1534550915-18230-2-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vnkgutta@codeaurora.org
Cc: robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, bp@alien8.de
List-Id: devicetree@vger.kernel.org

On Fri, Aug 17, 2018 at 5:08 PM Venkata Narendra Kumar Gutta
<vnkgutta@codeaurora.org> wrote:
>
> Currently, boradcast base is set to end of the LLCC banks, which may

s/boradcast/broadcast/

> not be correct always. As the number of banks may vary for each chipset
> and the broadcast base could be at a different address as well. This info
> depends on the chipset, so get the broadcast base info from the device
> tree (DT). Add broadcast base in LLCC driver and use this for broadcast
> writes.
>
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> ---
>  drivers/soc/qcom/llcc-slice.c      | 55 +++++++++++++++++++++++---------------
>  include/linux/soc/qcom/llcc-qcom.h |  4 +--
>  2 files changed, 35 insertions(+), 24 deletions(-)
>

Reviewed-by: Evan Green <evgreen@chromium.org>
