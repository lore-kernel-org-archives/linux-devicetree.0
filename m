From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] ARM: qcom: Add initial APQ8064 SoC and IFC6410 board
 device trees
Date: Tue, 8 Apr 2014 16:26:20 -0700
Message-ID: <20140408232619.GL9985@codeaurora.org>
References: <1396972391-11759-1-git-send-email-galak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1396972391-11759-1-git-send-email-galak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, David Brown <davidb@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/08, Kumar Gala wrote:
> Add basic APQ8064 SoC include device tree and support for basic booting on
> the IFC6410 board.
> 
> Signed-off-by: Kumar Gala <galak@codeaurora.org>
> ---
> v2:
> * created a v2.0 apq8064.dtsi to handle differences in Si rev in future
> * changed /include/ to #include
> * added PMU node
> * dropped interrupts from cpus node, not currently part of binding
> 
> 
>  arch/arm/boot/dts/Makefile                 |   1 +
>  arch/arm/boot/dts/qcom-apq8064-ifc6410.dts |  12 +++
>  arch/arm/boot/dts/qcom-apq8064-v2.0.dtsi   |   1 +
>  arch/arm/boot/dts/qcom-apq8064.dtsi        | 154 +++++++++++++++++++++++++++++
>  arch/arm/mach-qcom/board.c                 |   1 +

I suspect the arm-soc folks would like us to split the mach-qcom
changes from the dts changes.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
