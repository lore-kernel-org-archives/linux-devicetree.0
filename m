From: Andy Gross <agross@codeaurora.org>
Subject: Re: [RFC/PATCH] pinctrl: qcom: Add generic ssbi and spmi GPIO/MPP
 bindings
Date: Tue, 17 Nov 2015 22:09:18 -0600
Message-ID: <20151118040918.GA7327@qualcomm.com>
References: <1447808426-21834-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447808426-21834-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 17, 2015 at 05:00:26PM -0800, Stephen Boyd wrote:
> The drivers don't really need to know which PMIC they're for, so
> make a generic binding for them. This alleviates us from updating
> the drivers every time a new PMIC comes out. It's still
> recommended that we update the binding with new PMIC models and
> always specify the specific model for the MPPs and gpios before
> the generic compatible string in devicetree, but this at least
> cuts down on adding more and more compatible strings to the
> drivers until we actually need them.
> 
> Cc: <devicetree@vger.kernel.org>
> Cc: "Ivan T. Ivanov" <iivanov@mm-sol.com>
> Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Reviewed-by: Andy Gross <agross@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
