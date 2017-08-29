From: Fenglin Wu <fenglinw@codeaurora.org>
Subject: Re: [PATCH V1] pinctrl: qcom: spmi-gpio: Add support for
 qcom,gpios-disallowed property
Date: Tue, 29 Aug 2017 10:04:07 +0800
Message-ID: <0446a53f-3d78-39be-8cea-d39e39453910@codeaurora.org>
References: <20170719071804.3816-1-fenglinw@codeaurora.org>
 <20170828145435.GJ3685@dragon>
 <a9d4117d-9bc6-9273-7b8b-5b153c7a4ceb@codeaurora.org>
 <20170829015112.GK3685@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170829015112.GK3685@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, collinsd@codeaurora.org, aghayal@codeaurora.org, wruan@codeaurora.org, kgunda@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 8/29/2017 9:51 AM, Shawn Guo wrote:
> On Tue, Aug 29, 2017 at 09:03:02AM +0800, Fenglin Wu wrote:
>> I agree the GPIO's ownership is configurable and it always configured at
>> the very beginning of the device boot up which is not visible by linux
>> kernel drivers/image. Normally, this configuration is fixed in one
>> platform and it's been protected and not allowed to be configured in
>> linux kernel driver. So from linux driver point of view, this is a
>> hardware configuration. I agree the coming patch "spmi: pmic-arb: Move
>> the ownership check to irq_chip callback" would fix the pinctrl-
>> spmi-gpio driver probe failure caused by the ownership mismatch, but
>> this is just hiding the mistake of the kernel configured the GPIOs which
>> not owned by APPS processor.
> 
> The kernel does everything just right, using the GPIO that device tree
> tells to use.  If there is something wrong about ownership check, it
> should be fault of that device tree specifies the wrong GPIO, or
> firmware doesn't configure ownership as needed.
> > Shawn
> 

If you thought that the driver registers pins for the GPIOs not owned by
APPS processor is correct, then this patch is no needed.
I agreed with others.
Thanks

Fenglin

>> And these GPIOs will be registered
>> successfully as pinctrl pins and any APPS processor consumer drivers
>> could use this pins. This is not correct even the select_state operation
>> for these pins would failed due to the mode protection in spmi write_cmd
>> calling. I am thinking that not allowing these pins to be register as
>> pinctrl pins should be more straightforward and easy understanding. So I
>> think this patch still have value even the probe failure has been fixed
>> by the coming spmi patch.

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
