From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 4/4] venus: firmware: register separate
 platform_device for firmware loader
Date: Tue, 28 Aug 2018 17:15:14 -0500
Message-ID: <20180828221514.GA8820@bogus>
References: <1535034528-11590-1-git-send-email-vgarodia@codeaurora.org>
 <1535034528-11590-5-git-send-email-vgarodia@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1535034528-11590-5-git-send-email-vgarodia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vikash Garodia <vgarodia@codeaurora.org>
Cc: stanimir.varbanov@linaro.org, hverkuil@xs4all.nl, mchehab@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, arnd@arndb.de, bjorn.andersson@linaro.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, acourbot@chromium.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 23, 2018 at 07:58:48PM +0530, Vikash Garodia wrote:
> From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> 
> This registers a firmware platform_device and associate it with
> video-firmware DT subnode. Then calls dma configure to initialize
> dma and iommu.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../devicetree/bindings/media/qcom,venus.txt       | 13 +++++-

In the future, please split binding patches.

Reviewed-by: Rob Herring <robh@kernel.org>

>  drivers/media/platform/qcom/venus/core.c           | 14 +++++--
>  drivers/media/platform/qcom/venus/firmware.c       | 49 ++++++++++++++++++++++
>  drivers/media/platform/qcom/venus/firmware.h       |  2 +
>  4 files changed, 73 insertions(+), 5 deletions(-)
