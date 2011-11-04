From: Pavan Kondeti <pkondeti@codeaurora.org>
Subject: Re: USB support for device tree
Date: Fri, 04 Nov 2011 23:16:05 +0530
Message-ID: <4EB424DD.4090609@codeaurora.org>
References: <4EB3A165.8060300@codeaurora.org> <CACxGe6vMCHdB+J8hX1EPW3m35UaKC-FAZULUA4G11J0FUK6tNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CACxGe6vMCHdB+J8hX1EPW3m35UaKC-FAZULUA4G11J0FUK6tNQ@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi

On 11/4/2011 10:15 PM, Grant Likely wrote:
> On Fri, Nov 4, 2011 at 4:25 AM, Pavan Kondeti <pkondeti@codeaurora.org> wrote:
>> Hi
>>
>> I am working on adding USB device tree support for MSM platform.  One of
>> our chip set has 2 hsusb cores. The first core is configured as otg and
>> the other core is configured in host only mode (EHCI compliant). Are the
>> below device node names Okay? Please suggest.
>>
>> hsusb0-otg: usb@0xa6000000 {
>>        compatible = "qcom,hsusb-otg";
>>        ---
>> };
>>
>> hsusb0-device: usb@0xa6000000 {
>>        compatible = "qcom,hsusb-device";
>>        ---
>> };
>>
>> hsusb0-host: usb@0xa6000000 {
>>        compatible = "qcom,hsusb-host", "usb-ehci";
>>        ---
>> };
>>
>> hsusb1-host: usb@0xa6000000 {
>>        compatible = "qcom,hsusb-host", "usb-ehci";
>>        ---
>> };
>>
>> /* super speed support
>>
>> ssusb0-device: usb@0xa6000000 {
>>        compatible = "qcom,ssusb-device";
>> };
> 
> 
> The host controller node names as "usb@<adddr>" as you have here is
> exactly right.  The driver doesn't care and will only look at the
> compatible list.  OTG controllers can also use "usb@" as the prefix.
> 
> Controllers that are only in device mode should probably be called
> something like "usb-gadget@<addr>" or similar, because "usb@" is used
> for host controllers.
> 

In our case OTG, gadget and host controllers are part of a single core
i.e they all share the same register address space.

If I use usb@addr for OTG controller, then host and OTG device node
names becomes same. Is that okay? Can two devices have the same device
node name in device tree source file?

> The label names (hsusb*-host, hsusb*-device) are completely irrelevant
> since Linux never sees them.  Use whatever you want for the label
> names.
> 
Is it a good practice to give label names? I thought, it improves a bit
readability of device tree source file.

> Also, the form of the node name is: "usb@a6000000" (without '0x' in
> the address).
> 
Thanks for the correction.

Thanks,
Pavan


-- 
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
