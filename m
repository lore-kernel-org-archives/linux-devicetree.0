From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 3/3] mtd: add SMEM parser for QCOM platforms
Date: Mon, 24 Aug 2015 17:35:21 -0700
Message-ID: <20150825003521.GD19120@codeaurora.org>
References: <1439931860-7473-1-git-send-email-mathieu@codeaurora.org>
 <1439931860-7473-4-git-send-email-mathieu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439931860-7473-4-git-send-email-mathieu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Olivari <mathieu@codeaurora.org>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dwmw2@infradead.org, computersforpeace@gmail.com, agross@codeaurora.org, bjorn.andersson@sonymobile.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/18, Mathieu Olivari wrote:
> On QCOM platforms using MTD devices storage (such as IPQ806x), SMEM is
> used to store partition layout. This new parser can now be used to read
> SMEM and use it to register an MTD layout according to its content.
> 
> Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
