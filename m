From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 27/28] venus: add sdm845 compatible and resource data
Date: Tue, 1 May 2018 08:42:42 -0500
Message-ID: <20180501134242.GA31402@rob-hp-laptop>
References: <20180424124436.26955-1-stanimir.varbanov@linaro.org>
 <20180424124436.26955-28-stanimir.varbanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180424124436.26955-28-stanimir.varbanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vikash Garodia <vgarodia@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 24, 2018 at 03:44:35PM +0300, Stanimir Varbanov wrote:
> This adds sdm845 DT compatible string with it's resource
> data table.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../devicetree/bindings/media/qcom,venus.txt       |  1 +
>  drivers/media/platform/qcom/venus/core.c           | 22 ++++++++++++++++++++++
>  2 files changed, 23 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
