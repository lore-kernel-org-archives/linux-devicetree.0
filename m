From: Andy Gross <agross@codeaurora.org>
Subject: Re: [PATCH v3 2/3] ARM: qcom: Add coincell charger driver
Date: Fri, 24 Jul 2015 16:14:06 -0500
Message-ID: <20150724211406.GH24646@qualcomm.com>
References: <1437090933-1232-1-git-send-email-tim.bird@sonymobile.com>
 <1437090933-1232-2-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437090933-1232-2-git-send-email-tim.bird@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Tim Bird <tim.bird@sonymobile.com>
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, bjorn.andersson@sonymobile.com
List-Id: devicetree@vger.kernel.org

On Thu, Jul 16, 2015 at 04:55:32PM -0700, Tim Bird wrote:
> This driver is used to configure the coincell charger found in
> Qualcomm PMICs.
> 
> The driver allows configuring the current-limiting resistor for
> the charger, as well as the voltage to apply to the coincell
> (or capacitor) when charging.
> 
> Signed-off-by: Tim Bird <tim.bird@sonymobile.com>
> ---

Looks fine.

Reviewed-by: Andy Gross <agross@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
