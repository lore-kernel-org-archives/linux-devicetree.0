From: Sagar Dharia <sdharia@codeaurora.org>
Subject: Re: [PATCH V4 4/6] slim: qcom: Add Qualcomm Slimbus controller driver
Date: Mon, 18 Apr 2016 16:42:15 -0600
Message-ID: <571562C7.8040806@codeaurora.org>
References: <1454784265-5194-1-git-send-email-sdharia@codeaurora.org>
 <1454784265-5194-5-git-send-email-sdharia@codeaurora.org>
 <20160305052315.GE18327@sirena.org.uk> <57111420.8060208@codeaurora.org>
 <20160418091939.GK3217@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160418091939.GK3217@sirena.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 4/18/2016 3:19 AM, Mark Brown wrote:
> On Fri, Apr 15, 2016 at 10:17:36AM -0600, Sagar Dharia wrote:
>
> Please leave blank lines between paragraphs, it makes things much easier
> to read than a wall of uninterrupted text.
>
>>>> +	ret = devm_request_irq(&pdev->dev, dev->irq, msm_slim_interrupt,
>>>> +				IRQF_TRIGGER_HIGH, "msm_slim_irq", dev);
>>>> +	if (ret) {
>>>> +		dev_err(&pdev->dev, "request IRQ failed\n");
>>>> +		goto err_request_irq_failed;
>>>> +	}
>>> Are you sure this is safe and we don't deallocate things the interrupt
>>> handler uses before we disable the interrupt?
>> Since clock is not enabled before this step, we won't be getting any
>> interrupts from HW at this stage.
> No, that's not what I'm saying - I'm asking about the *disable* path on
> remove.
Good point, I will change the del_controller as well to enter clock-pause,
and the controller's remove function to disable interrupt.

Thanks
Sagar

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
