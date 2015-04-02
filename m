From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 1/5] mfd: devicetree: bindings: Add Qualcomm RPM regulator
 subnodes
Date: Thu, 02 Apr 2015 15:02:28 -0700
Message-ID: <551DBC74.6050201@codeaurora.org>
References: <1427928946-31291-1-git-send-email-bjorn.andersson@sonymobile.com> <1427928946-31291-2-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1427928946-31291-2-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Andy Gross <agross@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/01/15 15:55, Bjorn Andersson wrote:
> @@ -52,6 +42,188 @@ frequencies.
>  		    - u32 representing the ipc bit within the register
>  
>  
> += SUBNODES
> +
> +The RPM exposes resources to its subnodes. The below bindings specify the set
> +of valid subnodes that can operate on these resources.
> +
> +== Regulators
> +
> +Regulator notes are identified by their compatible:

s/notes/nodes/

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
