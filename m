From: vnkgutta@codeaurora.org
Subject: Re: [PATCH v4 3/4] drivers: edac: Add EDAC driver support for QCOM
 SoCs
Date: Thu, 06 Sep 2018 15:31:36 -0700
Message-ID: <5d8f92b480e1b53e7e04da965d44f7ea@codeaurora.org>
References: <1536103345-1919-1-git-send-email-vnkgutta@codeaurora.org>
 <1536103345-1919-4-git-send-email-vnkgutta@codeaurora.org>
 <105f8339-61bc-072e-0498-ed44470a5fb8@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <105f8339-61bc-072e-0498-ed44470a5fb8@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Borislav Petkov <bp@alien8.de>, evgreen@chromium.org, robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, swboyd@chromium.org, bjorn.andersson@linaro.org
List-Id: devicetree@vger.kernel.org

On 2018-09-06 05:38, Sai Prakash Ranjan wrote:
> On 9/5/2018 4:52 AM, Venkata Narendra Kumar Gutta wrote:
>> +static const struct of_device_id qcom_llcc_edac_match_table[] = {
>> +	{ .compatible = "qcom,llcc-edac" },
>> +	{ },
>> +};
>> +
>> 
> Hi Venkata,
> 
> Devicetree binding for llcc is updated, but what about this compatible?

Does it need documentation too? I was not sure if I should add 
documentation for this or not!

> 
> Regards,
> Sai
