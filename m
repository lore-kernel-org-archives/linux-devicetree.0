From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCHv3 1/2] ARM: msm: Add support for APQ8074 Dragonboard
Date: Mon, 9 Sep 2013 14:17:27 -0500
Message-ID: <FFE100A7-8AD6-4E0D-9F64-120DA3564F89@codeaurora.org>
References: <1378495943-2572-1-git-send-email-rvaswani@codeaurora.org> <20130906215051.GA29253@quad.lixom.net> <522E09E6.8040300@codeaurora.org>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <522E09E6.8040300@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rohit Vaswani <rvaswani@codeaurora.org>
Cc: Olof Johansson <olof@lixom.net>, David Brown <davidb@codeaurora.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Russell King <linux@arm.linux.org.uk>, Daniel Walker <dwalker@fifo99.com>, Bryan Huntsman <bryanh@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Sep 9, 2013, at 12:48 PM, Rohit Vaswani wrote:

> On 9/6/2013 2:50 PM, Olof Johansson wrote:
>> Hi,
>> 
>> Some comments below.
>> 
>> On Fri, Sep 06, 2013 at 12:32:22PM -0700, Rohit Vaswani wrote:
>>> This patch adds basic board support for APQ8074 Dragonboard
>>> <snip>
>>>  dtb-$(CONFIG_ARCH_MSM) += msm8660-surf.dtb \
>>> -	msm8960-cdp.dtb
>>> +	msm8960-cdp.dtb \
>>> +	apq8074-dragonboard.dtb
>> Please add boards alphabetically.
> Will do.
>> 
>>>  dtb-$(CONFIG_ARCH_MVEBU) += armada-370-db.dtb \
>>>  	armada-370-mirabox.dtb \
>>>  	armada-370-rd.dtb \
>>> diff --git a/arch/arm/boot/dts/apq8074-dragonboard.dts b/arch/arm/boot/dts/apq8074-dragonboard.dts
>>> new file mode 100644
>>> index 0000000..5b7b6a0
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/apq8074-dragonboard.dts
>> arch/arm/boot/dts/ is getting really crowded. It's been working best if the SoC
>> family or vendor is used as a prefix to keep things a bit more organized. In
>> that spirit, prefixing these with msm-<foo> makes sense. Can you please do so?
> 
> Sure. But the board is called an APQ8074 and we wanted to keep the naming consistent with that.

If we do this we should use qcom, not msm as the prefix.  Match the device tree vendor prefix.

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
