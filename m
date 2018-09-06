From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH v4 3/4] drivers: edac: Add EDAC driver support for QCOM
 SoCs
Date: Thu, 6 Sep 2018 18:08:45 +0530
Message-ID: <105f8339-61bc-072e-0498-ed44470a5fb8@codeaurora.org>
References: <1536103345-1919-1-git-send-email-vnkgutta@codeaurora.org>
 <1536103345-1919-4-git-send-email-vnkgutta@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536103345-1919-4-git-send-email-vnkgutta@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>, Borislav Petkov <bp@alien8.de>, evgreen@chromium.org, robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, swboyd@chromium.org, bjorn.andersson@linaro.org
List-Id: devicetree@vger.kernel.org

On 9/5/2018 4:52 AM, Venkata Narendra Kumar Gutta wrote:
> +static const struct of_device_id qcom_llcc_edac_match_table[] = {
> +	{ .compatible = "qcom,llcc-edac" },
> +	{ },
> +};
> +
> 
Hi Venkata,

Devicetree binding for llcc is updated, but what about this compatible?

Regards,
Sai
