From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v8 2/4] soc: qcom: Add AOSS QMP driver
Date: Mon, 3 Jun 2019 21:04:40 +0530
Message-ID: <20190603153440.GT15118@vkoul-mobl>
References: <20190531030057.18328-1-bjorn.andersson@linaro.org>
 <20190531030057.18328-3-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190531030057.18328-3-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Doug Anderson <dianders@chromium.org>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 30-05-19, 20:00, Bjorn Andersson wrote:
> The Always On Subsystem (AOSS) Qualcomm Messaging Protocol (QMP) driver
> is used to communicate with the AOSS for certain side-channel requests,
> that are not available through the RPMh interface.
> 
> The communication is a very simple synchronous mechanism of messages
> being written in message RAM and a doorbell in the AOSS is rung. As the
> AOSS has processed the message length is cleared and an interrupt is
> fired by the AOSS as acknowledgment.
> 
> The driver exposes the QDSS clock as a clock and the low-power state
> associated with the remoteprocs in the system as a set of power-domains.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
