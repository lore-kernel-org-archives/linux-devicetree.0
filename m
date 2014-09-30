From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [RFC 1/7] soc: qcom: Add device tree binding for SMEM
Date: Tue, 30 Sep 2014 12:03:21 -0700
Message-ID: <542AFE79.6030304@codeaurora.org>
References: <1412037291-16880-1-git-send-email-bjorn.andersson@sonymobile.com> <1412037291-16880-2-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1412037291-16880-2-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Suman Anna <s-anna@ti.com>
List-Id: devicetree@vger.kernel.org

On 09/29/14 17:34, Bjorn Andersson wrote:
> +
> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: base address and size pair for each area representing the
> +		    shared memory. The first pair will must represent the "main"
> +		    area, where the shared memory header and table-of-content
> +		    can be found.
>
> +
> += EXAMPLE
> +
> +        smem: smem@fa00000 {
> +                compatible = "qcom,smem";
> +                reg = <0x0fa00000 0x200000>,
> +                      <0xfc428000 0x4000>;

Isn't this second entry rpm message ram? That isn't the same as smem.
Plus smem is part of ram (and rpm message ram is not) so we need to do
memory reservations or something.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
