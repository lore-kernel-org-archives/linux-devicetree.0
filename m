From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v4 4/4] phy: qcom-qmp: new qmp phy driver for
 qcom-chipsets
Date: Wed, 11 Jan 2017 09:06:11 +0530
Message-ID: <08a0fd4f-fc53-55f7-dd24-87b7798e2e2f@codeaurora.org>
References: <1484045519-19030-1-git-send-email-vivek.gautam@codeaurora.org>
 <1484045519-19030-5-git-send-email-vivek.gautam@codeaurora.org>
 <20170110232045.GE5710@hector.attlocal.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170110232045.GE5710@hector.attlocal.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: robh+dt@kernel.org, kishon@ti.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, sboyd@codeaurora.org, bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,


On 01/11/2017 04:50 AM, Andy Gross wrote:
> On Tue, Jan 10, 2017 at 04:21:59PM +0530, Vivek Gautam wrote:
>> Qualcomm SOCs have QMP phy controller that provides support
>> to a number of controller, viz. PCIe, UFS, and USB.
>> Add a new driver, based on generic phy framework, for this
>> phy controller.
>>
>> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
>> Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
> < snip>
>
>> +static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
>> +	{
>> +		.compatible = "qcom,msm8996-qmp-pcie-phy",
>> +		.data = &msm8996_pciephy_cfg,
>> +	}, {
>> +		.compatible = "qcom,msm8996-qmp-usb3-phy",
>> +		.data = &msm8996_usb3phy_cfg,
>> +	},
> Which other chips would this driver support?

msm8998 has the same combo PHY IP. We may need
minor changes in the initialization tables to support that.


Regards
Vivek

>
>
> Regards,
>
> Andy Gross
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
