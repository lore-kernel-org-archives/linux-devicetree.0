From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: Re: [PATCH 5/8] pinctrl: qcom: spmi-mpp: Add support for setting
 analog output level
Date: Wed, 24 Jun 2015 11:17:07 +0300
Message-ID: <1435133827.2334.33.camel@linaro.org>
References: <1434610052-602-1-git-send-email-bjorn.andersson@sonymobile.com>
	 <1434610052-602-6-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1434610052-602-6-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn, 

On Wed, 2015-06-17 at 23:47 -0700, Bjorn Andersson wrote:
> When the MPP is configured for analog output the output level is selected by
> the AOUT_CTL register, this patch makes it possible to control this.
> 
<snip>

>         }
> @@ -748,6 +765,10 @@ static int pmic_mpp_populate(struct pmic_mpp_state *state,
> 
>         pad->drive_strength = val;
> 
> +       val = pmic_mpp_read(state, pad, PMIC_MPP_REG_AOUT_CTL);
> +       if (val < 0)
> +               return val;
> +

Missing 

        pad->aout_level = val;

>         val = pmic_mpp_read(state, pad, PMIC_MPP_REG_EN_CTL);
>         if (val < 0)
>                 return val;
> 

Regards,
Ivan
