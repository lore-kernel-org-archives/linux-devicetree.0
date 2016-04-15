From: Sagar Dharia <sdharia@codeaurora.org>
Subject: Re: [PATCH V4 4/6] slim: qcom: Add Qualcomm Slimbus controller driver
Date: Fri, 15 Apr 2016 10:17:36 -0600
Message-ID: <57111420.8060208@codeaurora.org>
References: <1454784265-5194-1-git-send-email-sdharia@codeaurora.org>
 <1454784265-5194-5-git-send-email-sdharia@codeaurora.org>
 <20160305052315.GE18327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160305052315.GE18327@sirena.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, robh@kernel.org
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Mark
Apologies for a late reply. I will incorporate most of your comments.
Please see inline response for 2 comments:
>> +	ret = devm_request_irq(&pdev->dev, dev->irq, msm_slim_interrupt,
>> +				IRQF_TRIGGER_HIGH, "msm_slim_irq", dev);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "request IRQ failed\n");
>> +		goto err_request_irq_failed;
>> +	}
> Are you sure this is safe and we don't deallocate things the interrupt
> handler uses before we disable the interrupt?

Since clock is not enabled before this step, we won't be getting any 
interrupts from HW at this stage.

>> +	/* Register with framework before enabling frame, clock */
>> +	ret = slim_register_controller(&dev->ctrl);
>> +	if (ret) {
>> +		dev_err(dev->dev, "error adding controller\n");
>> +		goto err_ctrl_failed;
>> +	}
> Should we have a devm_ version of slim_register_controller()?  I'd also
> expect this to be the last thing we do in probe, things may start using
> the device before we've finished initializing it.
register_controller also allocates controller's TX/RX ring buffers. 
These rings are needed when devices start
reporting present on the bus once they are enabled.
So register_controller needs to be done before enabling any devices.
All steps after register_controller in this function are related to 
enabling various internal component devices
(e.g. framer, interface, manager devices) of this slimbus controller.

Thank you for your comments
Sagar


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
