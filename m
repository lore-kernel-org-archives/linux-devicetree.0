From: Sagar Dharia <sdharia@codeaurora.org>
Subject: Re: [PATCH V3 5/6] slimbus: Add support for 'clock-pause' feature
Date: Mon, 17 Aug 2015 17:43:01 -0600
Message-ID: <55D27185.4000101@codeaurora.org>
References: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
 <1438585190-11894-6-git-send-email-sdharia@codeaurora.org>
 <20150814183918.GF10748@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20150814183918.GF10748@sirena.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On 8/14/2015 12:39 PM, Mark Brown wrote:
> On Mon, Aug 03, 2015 at 12:59:49AM -0600, Sagar Dharia wrote:
>
>> @@ -459,6 +459,8 @@ int slim_register_controller(struct slim_controller *ctrl)
>>   	mutex_init(&ctrl->m_ctrl);
>>   	spin_lock_init(&ctrl->tx.lock);
>>   	spin_lock_init(&ctrl->rx.lock);
>> +	mutex_init(&ctrl->sched.m_reconf);
>> +	init_completion(&ctrl->sched.pause_comp);
> Should there not be more interaction with the rest of the framework on
> clock pauses - the bus will need to be started to do transfers for
> example?

I'm relying on controller's pm_runtime as you pointed out for 
entering/exiting clock-pause.
The reason to initiate clock-pause from controller was more on the lines 
of clock-pause sequence being expensive, and tight coupling between 
controller/framer-clocks and clock-pause.
Three reconfiguration-transfer-commands have to be broadcast on the 
lines to enter clock-pause, and exiting it is needs 'wakeup' callback 
for controller.
Doing this per transfer will be a big overhead.
Using pm_runtime's autosuspend feature allows the controller-device to 
enter clock-pause after periods of inactivity to avoid thrashing.
As a trade-off, I am proposing that controller should initiate 
clock-pause from its pm_runtime callbacks, and framework should provide 
the means to do it.
Also, typically clocks of the controller are coupled with clock-pause 
and clocks cannot be turned off until the clock-pause sequence is sent 
on the bus since framer has to keep clocking the bus.

Thanks
Sagar

>
>> +#include <linux/slimbus.h>
>> +/**
> Missing blank line.
>
>> + * slim_ctrl_clk_pause: Called by slimbus controller to enter/exit 'clock pause'
> Is the controller the best place to initiate bus pausing?  It's
> surprising to me that it would be, the bus being idle isn't something
> that needs controller specific knowledge so I'd expect the framework to
> have standard support for this.


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
