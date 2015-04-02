From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 0/5] Refactor Qualcomm RPM regulator to single platform_device
Date: Thu, 02 Apr 2015 15:00:37 -0700
Message-ID: <551DBC05.2090301@codeaurora.org>
References: <1427928946-31291-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1427928946-31291-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Andy Gross <agross@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/01/15 15:55, Bjorn Andersson wrote:
> Stephen Boyd pointed out that the current design of the Qualcomm RPM and
> regulator driver consumes 12-20kB of ram just for the platform_device structs.
>
> This series starts with a new revision of the dt binding documentation for the
> rpm regulators, introduces the regulator-allow-drms property, remove the
> flagging of DRMS support from the qcom-rpm regulator driver, refactor the
> qcom_rpm-regulator driver to move all custom parse code to a function suitable
> for usage as of_parse_cb. The final patch defines the tables of registers and
> change the probe function to register the appropriate regulators based on pmic.
>
> As Stephen pointed out in his PATCH/RFC/argument [1], this gives a more
> accurate representation of input supplies, as they are now named as in the
> specification.
>
> Note that for platforms with multiple pmics (e.g. 8660 and 8974) will have
> multiple regulator subnodes to the rpm node - something that will be clearer
> with this binding than the previously suggested.

What happens with debugfs when you have multiple pmics with the same
named regulator? I thought that in this case we needed to make the names
unique somehow or we would end up with the same directory for two
different regulators.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
