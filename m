From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: Add Dragonboard 845c
Date: Thu, 6 Jun 2019 12:57:59 +0100
Message-ID: <64d89d4e-df71-1204-42cf-be5c93617a06@linaro.org>
References: <20190606043851.18050-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606043851.18050-1-bjorn.andersson@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 06/06/2019 05:38, Bjorn Andersson wrote:
> This adds an initial dts for the Dragonboard 845. Supported
> functionality includes Debug UART, UFS, USB-C (peripheral), USB-A
> (host), microSD-card and Bluetooth.
> 
> Initializing the SMMU is clearing the mapping used for the splash screen
> framebuffer, which causes the board to reboot. This can be worked around
> using:
> 
>    fastboot oem select-display-panel none
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
