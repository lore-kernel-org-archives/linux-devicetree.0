From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: Add Dragonboard 845c
Date: Wed, 27 Feb 2019 07:25:54 -0700
Message-ID: <60e2bea0-463c-7705-b9bf-a0380111156a@codeaurora.org>
References: <20190227074009.19248-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190227074009.19248-1-bjorn.andersson@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2/27/2019 12:40 AM, Bjorn Andersson wrote:
> This adds an initial dts for the Dragonboard 845. Supported
> functionality includes Debug UART, UFS, USB-C (peripheral), USB-A
> (host), Ethernet, microSD-card and Bluetooth.
> 
> Initializing the SMMU is clearing the mapping used for the splash screen
> framebuffer, which causes the baord to reboot. This can be worked around

baord -> board?

> using:
> 
>    fastboot oem select-display-panel none
> 
> Ethernet and the second USB-A port depends on a functional firmware
> loader for the uPD720201.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
