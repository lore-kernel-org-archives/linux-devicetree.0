From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCHv3 1/2] ARM: msm: Add support for APQ8074 Dragonboard
Date: Mon, 9 Sep 2013 17:04:38 -0500
Message-ID: <49CC46F4-F6CE-4B1A-B0D5-E4BB779755B8@codeaurora.org>
References: <1378495943-2572-1-git-send-email-rvaswani@codeaurora.org> <20130906215051.GA29253@quad.lixom.net> <522E09E6.8040300@codeaurora.org> <FFE100A7-8AD6-4E0D-9F64-120DA3564F89@codeaurora.org> <522E21A8.4060408@wwwdotorg.org> <FA33E8F4-3F85-4D8B-83E1-96F5A8F76CE6@codeaurora.org> <522E3BC9.1030105@wwwdotorg.org> <CA05A23E-41CF-4EC6-BB2D-36105048700B@codeaurora.org> <522E40B2.9010301@codeaurora.org>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <522E40B2.9010301@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rohit Vaswani <rvaswani@codeaurora.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>, David Brown <davidb@codeaurora.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Russell King <linux@arm.linux.org.uk>, Daniel Walker <dwalker@fifo99.com>, Bryan Huntsman <bryanh@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Sep 9, 2013, at 4:42 PM, Rohit Vaswani wrote:

> On 9/9/2013 2:25 PM, Kumar Gala wrote:
>> <snip>
>> On Fri, Sep 06, 2013 at 12:32:22PM -0700, Rohit Vaswani wrote:
>>>>>>>>> This patch adds basic board support for APQ8074 Dragonboard
>>>>>>>>> <snip>
>>>>>>>>> dtb-$(CONFIG_ARCH_MSM) += msm8660-surf.dtb \
>>>>>>>>> -	msm8960-cdp.dtb
>>>>>>>>> +	msm8960-cdp.dtb \
>>>>>>>>> +	apq8074-dragonboard.dtb
>>>>>>>> Please add boards alphabetically.
>>>>>>> Will do.
>>>>>>>>> dtb-$(CONFIG_ARCH_MVEBU) += armada-370-db.dtb \
>>>>>>>>> 	armada-370-mirabox.dtb \
>>>>>>>>> 	armada-370-rd.dtb \
>>>>>>>>> diff --git a/arch/arm/boot/dts/apq8074-dragonboard.dts b/arch/arm/boot/dts/apq8074-dragonboard.dts
>>>>>>>>> new file mode 100644
>>>>>>>>> index 0000000..5b7b6a0
>>>>>>>>> --- /dev/null
>>>>>>>>> +++ b/arch/arm/boot/dts/apq8074-dragonboard.dts
>>>>>>>> arch/arm/boot/dts/ is getting really crowded. It's been working best if the SoC
>>>>>>>> family or vendor is used as a prefix to keep things a bit more organized. In
>>>>>>>> that spirit, prefixing these with msm-<foo> makes sense. Can you please do so?
>>>>>>> Sure. But the board is called an APQ8074 and we wanted to keep the naming consistent with that.
>>>>>> If we do this we should use qcom, not msm as the prefix.  Match the device tree vendor prefix.
> 
> Coming back to this, it would be better if the naming to be consistent with what we call our ARCH - msm and not qcom.
> msm8974-dragonboard signifies quite clearly what the board is.

I was saying qcom,apq8074-dragonboard or we can do the dir thing as we don't have that mean qcom/msm device trees.

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
