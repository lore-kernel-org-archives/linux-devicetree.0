From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add sdm845 pinctrl driver
Date: Mon, 8 Jan 2018 07:44:04 -0800
Message-ID: <20180108154403.GO12655@minitux>
References: <20180106015104.19143-1-bjorn.andersson@linaro.org>
 <20180106015104.19143-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180106015104.19143-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 05 Jan 17:51 PST 2018, Bjorn Andersson wrote:

> From: Rajendra Nayak <rnayak@codeaurora.org>
> 
> This adds the pinctrl definitions for the TLMM of SDM845.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> [bjorn: consolidated functions]
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Linus,

This patch is missing some updates introduced between engineering and
production hardware, which I missed this while reviewing the patch.

So please don't merge this patch, and forgive me for noise.

Regards,
Bjorn
