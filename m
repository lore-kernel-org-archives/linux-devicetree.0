From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v4 3/4] drivers: edac: Add EDAC driver support for QCOM
 SoCs
Date: Fri, 7 Sep 2018 10:18:21 +0200
Message-ID: <20180907081820.GB12849@zn.tnic>
References: <1536103345-1919-1-git-send-email-vnkgutta@codeaurora.org>
 <1536103345-1919-4-git-send-email-vnkgutta@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1536103345-1919-4-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Cc: evgreen@chromium.org, robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, swboyd@chromium.org, bjorn.andersson@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 04, 2018 at 04:22:24PM -0700, Venkata Narendra Kumar Gutta wrote:
> From: Channagoud Kadabi <ckadabi@codeaurora.org>
> 
> Add error reporting driver for Single Bit Errors (SBEs) and Double Bit
> Errors (DBEs). As of now, this driver supports error reporting for
> Last Level Cache Controller (LLCC) of Tag RAM and Data RAM. Interrupts
> are triggered when the errors happen in the cache, the driver handles
> those interrupts and dumps the syndrome registers.
> 
> Signed-off-by: Channagoud Kadabi <ckadabi@codeaurora.org>
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> Co-developed-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> ---
>  MAINTAINERS                        |   8 +
>  drivers/edac/Kconfig               |  14 ++
>  drivers/edac/Makefile              |   1 +
>  drivers/edac/qcom_edac.c           | 420 +++++++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/llcc-qcom.h |  24 +++
>  5 files changed, 467 insertions(+)
>  create mode 100644 drivers/edac/qcom_edac.c

EDAC bits look ok now, feel free to carry it through the qualcomm tree:

Acked-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
