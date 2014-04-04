From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] clk: qcom: Add basic support for APQ8064 global clock
 controller clocks
Date: Fri, 04 Apr 2014 11:15:33 -0700
Message-ID: <533EF6C5.3040301@codeaurora.org>
References: <1396629089-7358-1-git-send-email-galak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1396629089-7358-1-git-send-email-galak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>, Mike Turquette <mturquette@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/04/14 09:31, Kumar Gala wrote:
> The APQ8064 and MSM8960 share a significant amount of clock data and
> code between the two SoCs.  Rather than duplicating the data we just add
> support for a unqiue APQ8064 clock table into the MSM8960 code.
>
> For now add just enough clocks to get a basic serial port going on an
> APQ8064 device.
>
> Signed-off-by: Kumar Gala <galak@codeaurora.org>
>


Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
