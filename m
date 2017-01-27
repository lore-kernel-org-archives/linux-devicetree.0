From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v4 2/4] phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom
 chips
Date: Fri, 27 Jan 2017 11:54:40 +0530
Message-ID: <692975a4-e735-975f-7152-fdd81324c42b@codeaurora.org>
References: <1484045519-19030-1-git-send-email-vivek.gautam@codeaurora.org>
 <1484045519-19030-3-git-send-email-vivek.gautam@codeaurora.org>
 <587C880E.90803@ti.com> <73a2f6ce-69d6-8d15-b28d-891bdf16672c@codeaurora.org>
 <20170118180347.GO10531@minitux>
 <CAFp+6iG3KxX=G64EyJFgGn9ZffzjCtEeR4HUPdOK-uhE8A=PwA@mail.gmail.com>
 <58871C39.50403@ti.com> <20170126181527.GB10531@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170126181527.GB10531@minitux>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: robh+dt <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 01/26/2017 11:45 PM, Bjorn Andersson wrote:
> On Tue 24 Jan 01:19 PST 2017, Kishon Vijay Abraham I wrote:
>> On Monday 23 January 2017 03:43 PM, Vivek Gautam wrote:
>>> On Wed, Jan 18, 2017 at 11:33 PM, Bjorn Andersson
> [..]
>>> Yes, that's correct. The QMP and QUSB2 phy init sequences are a bunch
>>> of static values for a particular IP version. These values hardly give a
>>> meaningful data to put few phy bindings that could be referenced
>>> to configure the phy further.
>> Not really. You can have clearly defined phy binding to give meaningful data.
>> Every driver doing the same configuration bloats the driver and these
>> configuration values are just magic values which hardly can be reviewed by anyone.
>>>> Further more moving this blob to devicetree will not allow us to treat
>>>> the various QMP configurations as one HW block, as there are other
>>>> differences as well.
>>>>
>>>> Like many other drivers it's possible to create a generic version that
>>>> has every bit of logic driven by configuration from devicetree, but like
>>>> most of those cases this is not the way we split things.
>>>>
>>>> And this has the side effect of keeping the dts files human readable,
>>>> human understandable and human maintainable.
>> right. That's why I recommend having clearly defined bindings.
>> 	phy,tx-<param1> = <val, offset, mask>
>> 	phy,tx-<param2> = <val, offset, mask>
>> 	phy,tx-<param3> = <val, offset, mask>
> There's no doubt that this table needs to be encoded somewhere, so the
> question is should we hard code this in a C file or in a DTSI file.
>
> Skimming through [1] I see examples of things that differs based on how
> the specific component is integrated in a SoC or on a particular board -
> properties that are relevant to a "system integrator".
>
> As far as I can tell this blob will, if ever, only be changed by a
> driver developer and as such it's not carry information about how this
> component relates to the rest of the system and should as such not be
> part of the device tree.
>
>
> If there are properties of the hardware that is affected by how the
> component is integrated in the system I really would like for those to
> be exposed as human-readable properties that I can understand and alter
> without deep knowledge about the register map of the hardware block.

I am reaching out to our internal teams to get more information
on different possible phy configurations, based on which the registers
values are decided.
This is something that i tried to understand in the past as well, but 
couldn't
grab much information that time.
Will come back with relevant information on this.


Regards
Vivek

>> [1] -> https://www.linuxplumbersconf.org/2016/ocw/proposals/4047
> Regards,
> Bjorn
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
