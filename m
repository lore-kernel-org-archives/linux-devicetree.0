From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Correct apr-domain property
Date: Tue, 18 Jun 2019 22:41:31 +0100
Message-ID: <b0036d9f-eec1-7531-545f-67b651ded729@linaro.org>
References: <20190618052547.32376-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618052547.32376-1-bjorn.andersson@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>
Cc: David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 18/06/2019 06:25, Bjorn Andersson wrote:
> The domain specifier was changed from using "reg" to "qcom,apr-domain",
> update the dts accordingly.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
LGTM
Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
