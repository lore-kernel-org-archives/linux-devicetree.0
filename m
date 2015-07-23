From: Andy Gross <agross@codeaurora.org>
Subject: Re: [PATCH v2 01/11] soc: qcom: Add device tree binding for SMEM
Date: Thu, 23 Jul 2015 15:49:03 -0500
Message-ID: <20150723204903.GC13658@qualcomm.com>
References: <1435355419-23602-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1435355419-23602-2-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1435355419-23602-2-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: bjorn@kryo.se
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jeffrey Hugo <jhugo@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 26, 2015 at 02:50:09PM -0700, bjorn@kryo.se wrote:
> From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> 
> Add device tree binding documentation for the Qualcom Shared Memory
> Manager.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

<snip>

> +	smem@fa00000 {
> +		compatible = "qcom,smem";
> +
> +		memory-region = <&smem_region>;
> +		reg = <0xfc428000 0x4000>;

I'll fixup the address here before applying.

Applied, thanks!

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
