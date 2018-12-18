From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v3] clk: qcom: smd: Add support for MSM8998 rpm clocks
Date: Mon, 17 Dec 2018 17:57:33 -0700
Message-ID: <83f726d7-97c9-8fe3-229a-d68f59fb347a@codeaurora.org>
References: <1545092467-31485-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545092467-31485-1-git-send-email-jhugo@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/17/2018 5:21 PM, Jeffrey Hugo wrote:
> Add rpm smd clocks, PMIC and bus clocks which are required on MSM8998
> for clients to vote on.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
> v3
> -Ensure Marc's hang was addressed by GCC fixes
> -Renamed the bb clks to ln_bb to match the schematics
> 
> v2
> -fix compatible ordering nits per Stephen
> 

Sorry, I missed a build error.  Ignore this.  Will spin a v4.

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
