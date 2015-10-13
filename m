From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: add support to LS and HS
 connectors
Date: Tue, 13 Oct 2015 11:13:43 -0700
Message-ID: <561D49D7.8030606@codeaurora.org>
References: <1444380825-1355-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1444380825-1355-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, agross@codeaurora.org
Cc: jorge.ramirez-ortiz@linaro.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/09/2015 01:53 AM, Srinivas Kandagatla wrote:
> Hi Andy, 
>
> This patchset adds support for i2c and spi on High-Speed and Low speed
> connectors on DB410c.
> One of the patch fixes the sleep state of existing i2c node.
>
> thanks,
> srini
>
> Changes since v1:
> 	- removed useless comment spotted by Stephen Boyd.
> 	- Use absolute names instead of lables for consistency suggested by Stephen Boyd.
>

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
