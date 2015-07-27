From: Andy Gross <agross@codeaurora.org>
Subject: Re: [PATCH v1 0/7] APQ8064 dt patches.
Date: Mon, 27 Jul 2015 14:06:40 -0500
Message-ID: <20150727190640.GA12739@qualcomm.com>
References: <1438004945-16175-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438004945-16175-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 27, 2015 at 02:49:05PM +0100, Srinivas Kandagatla wrote:
> Hi Andy,
> 
> Here are some DT patches which are fixes + pmic gpio/mpp nodes for APQ8064.
> I tested these patches on APQ8064 based IFC6410 board. These patches are
> on top of your qcom/dt branch.
> 
> I got few more DT patches which depend on the pmic gpio and mpp dt-bindings header file,
> this header file is already available in the linux-next, Should I send those patches too?
> Or wait till it appears on 4.3-rc1?

Send em.  I can at least add them to my next branch.

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
