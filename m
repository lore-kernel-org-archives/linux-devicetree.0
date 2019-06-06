From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: Add Dragonboard 845c
Date: Thu, 6 Jun 2019 12:56:31 +0530
Message-ID: <CAFp+6iG66C-6ySw81bVsxbWqP+qCza0+QxuQ4Z-MXqB6DV2KZg@mail.gmail.com>
References: <20190606043851.18050-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606043851.18050-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On Thu, Jun 6, 2019 at 10:10 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> This adds an initial dts for the Dragonboard 845. Supported
> functionality includes Debug UART, UFS, USB-C (peripheral), USB-A
> (host), microSD-card and Bluetooth.
>
> Initializing the SMMU is clearing the mapping used for the splash screen
> framebuffer, which causes the board to reboot. This can be worked around
> using:
>
>   fastboot oem select-display-panel none

This works well with your SMR handoff RFC series too?

>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Patch looks good, so
Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>

Best Regards
Vivek

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
