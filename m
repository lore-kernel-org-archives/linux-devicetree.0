From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: [RESEND][PATCH] device-tree: nexus7: Remove power gpio key entry and use
 pmic8xxx-pwrkey
Date: Mon, 27 Jun 2016 12:36:11 -0700
Message-ID: <146705617133.30684.6377761340335782468@sboyd-linaro>
References: <1466639150-27814-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1466639150-27814-1-git-send-email-john.stultz@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting John Stultz (2016-06-22 16:45:50)
> Since the pmic8xxx-pwrkey driver is already supported in the
> qcom-apq8064.dtsi, and the pmic8xxx-pwrkey supports logic to
> configure proper device shutdown when ps_hold goes low, it is
> better to use that driver then a generic gpio button.
> 
> Thus this patch remove the gpio power key entry here, so we
> don't get double input events from having two drivers enabled.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andy Gross <agross@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Stephen Boyd <stephen.boyd@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Reviewed-by: Stephen Boyd <stephen.boyd@linaro.org>
