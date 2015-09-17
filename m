From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [RFC 0/2] drm/dsi: DSI for devices with different control bus
Date: Thu, 17 Sep 2015 14:26:18 +0530
Message-ID: <55FA8032.50101@codeaurora.org>
References: <1439993828.31432.28.camel@pengutronix.de>
 <20150819143452.GH15607@ulmo.nvidia.com>
 <1439995944.31432.34.camel@pengutronix.de>
 <20150819150207.GJ15607@ulmo.nvidia.com> <55D5548E.9030608@codeaurora.org>
 <20150820114815.GB7479@ulmo.nvidia.com> <55D6C07D.4050405@codeaurora.org>
 <55ED7921.2030103@codeaurora.org> <55EEB82C.2070805@samsung.com>
 <55F12007.6020307@codeaurora.org> <20150910073252.GA8756@ulmo.nvidia.com>
 <55F7F3DA.20702@codeaurora.org> <55F83CB1.5070102@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <55F83CB1.5070102@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Thierry Reding <treding@nvidia.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org



On 9/15/2015 9:13 PM, Rob Herring wrote:
> On 09/15/2015 05:32 AM, Archit Taneja wrote:
>> Hi Rob, Mark,
>>
>> We've been trying to figure out the right way to represent a class
>> of display encoder devices in DT.
>
> I've been meaning to reply on this.
>
>> These devices have registers that are generally configured via i2c. Once
>> the device is configured, it takes in video data from the mipi
>> dsi bus.
>>
>> Until now, all the devices we've supported devices that can be are
>> configured by the dsi bus itself, and hence, we've been able to
>> represent them in DT as children under the dsi host.
>>
>> For the above class of devices (using both i2c and dsi), we aren't
>> able to conclude upon what's the better approach among the two:
>>
>> 1. Represent the device via 2 different nodes in DT. One would be
>> a child under an i2c adapter, the other a child of a dsi host. We
>> would have two device drivers, one i2c client, and the other a
>> mipi dsi device.
>>
>> 2. Represent the device as an i2c client in DT. Provide an api
>> to create "dummy" dsi devices. The i2c client driver would use
>> this api to register a dsi device, and link itself with the dsi
>> host.
>>
>> What do you think would be the way to go here? I guess you
>> might have faced something similar in other subsystems.
>
> The closest thing I can think of are WiFi/BT combo chips that use
> SDIO+UART. In that case, 2 nodes makes sense as these chips are
> essentially 2 independent functions in a single chip and both interfaces
> are control interfaces (as well as data). This case is a bit different
> with both interfaces being tied to the same function.
>
> So in this case, I think option 2 is the right way for the reasons
> already outlined in this thread. I think there needs to be more
> consistency in how the of-graph connections are defined with the core
> doing more of the graph traversing. So having an i2c device plus
> of-graph seems more consistent with other non-DSI cases.
>
> The main open issue seemed to be setting the VC. At least for the
> ADV7533, it can be whatever you want it to be. The host and device just
> need to agree. I see no need for that to be in DT at least in this case.
> But then I'm not sure what are typical constraints for VC assignment.
> I'd guess that constraints are on the device side and hosts can support
> whatever the device wants. If so, then it can purely be up to the driver
> to set.

2 DSI devices connected to the same host shouldn't have the same VC.
When representing the DSI nodes via DT, we use the 'reg' property to
assign the VC.

Although, in practice, we don't generally have multiple devices
on the same bus. The trend is to have multiple DSI hosts on the
platform to support more devices.

If we have checks that ensures the DT way and the new manual way
of creation of DSI devices doesn't result in having conflicting VCs
for devices, we should be okay.

>
> Implementation-wise, I don't think that I'd call this a dummy device.
> There are multiple ways for devices to get created in the driver model.
> DT is just one way. You are just creating the device in a different way
> outside of DT which is fine.
>

Thanks for the feedback.

Archit

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
