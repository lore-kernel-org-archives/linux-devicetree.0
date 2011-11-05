From: Pavan Kondeti <pkondeti@codeaurora.org>
Subject: Re: USB support for device tree
Date: Sat, 05 Nov 2011 13:42:46 +0530
Message-ID: <4EB4EFFE.8070308@codeaurora.org>
References: <4EB3A165.8060300@codeaurora.org>	<CACxGe6vMCHdB+J8hX1EPW3m35UaKC-FAZULUA4G11J0FUK6tNQ@mail.gmail.com>	<4EB424DD.4090609@codeaurora.org>	<CACxGe6sYkCSnFvybGcjrkh4cNvtjS=t6fr456be4KFDc3Gre2w@mail.gmail.com>	<4EB4A897.8020305@codeaurora.org> <CACxGe6tgXc0kWnHM1FrbnJO3NU1xdzPaZ2x2ZXCgoG1crEwxcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CACxGe6tgXc0kWnHM1FrbnJO3NU1xdzPaZ2x2ZXCgoG1crEwxcA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi

On 11/5/2011 9:22 AM, Grant Likely wrote:
> On Nov 4, 2011 11:08 PM, "Pavan Kondeti" <pkondeti@codeaurora.org> wrote:
>>
>> Hi
>>
>> On 11/4/2011 11:42 PM, Grant Likely wrote:
>>> It is not legal for two device nodes to have overlapping 'reg' regions
>>> (unless one is a child of the other), so by extension it is not okay
>>> for two nodes to have the same 'name@addr'.  However, it is perfectly
>>> acceptable and encouraged for two nodes at different addresses to
>>> start with the same value for 'name@'.  This is called the generic
>>> names recommended practice, and it can also be found in the ePAPR
>>> documentation on node names.
>>>
>>> If you want to have both host and device drivers bound to a single
>>> device for OTG mode, then you should use a wrapper driver in Linux
>>> that binds to the single node and instantiates each of the interfaces
>>> as a child device.  For an example take a look at
>>> drivers/usb/host/fsl-mph-dr-of.c.
>>
>> Currently we have two platform devices one for OTG and one for host,
>> corresponding drivers for them. If I would like to keep it this way, the
>> device tree becomes something like below
>>
>> hsusb0-otg: usb-otg@0xa6000000 {
>>        compatible = "qcom,hsusb-otg";
>>        ---
>> };
>>
>> hsusb0-device: usb-gadget@0xa6000000 {
>>        compatible = "qcom,hsusb-device";
>>        ---
>> };
>>
>> hsusb0-host: usb@0xa6000000 {
>>        compatible = "qcom,hsusb-host", "usb-ehci";
>>        ---
>> };
> 
> No, you don't need three nodes. Only one node for the whole thing since
> from the hardware perspective it is still a single device. The driver for
> that node should create the child otg and gadget platform_devices so that
> you can preserve the existing driver structure.
>

Okay. I got it. Thanks for pointing me to
drivers/usb/host/fsl-mph-dr-of.c. I can have one device node for otg and
create host and/or gadget based on the operational mode.

> There does not need to be a device tree node for every struct device in the
> kernel.
> 

Agreed.

Thanks,
Pavan
-- 
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
