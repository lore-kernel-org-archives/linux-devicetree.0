From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] phy: nop: Add a new phy driver for No-Op transceiver
Date: Fri, 7 Oct 2016 11:53:06 +0530
Message-ID: <beaeb462-0f21-eab5-bda3-f59fa0aa0625@codeaurora.org>
References: <1475577817-28500-1-git-send-email-vivek.gautam@codeaurora.org>
 <57F4EE05.8000407@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57F4EE05.8000407-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kishon,


On 10/05/2016 05:41 PM, Kishon Vijay Abraham I wrote:
> Hi,
>
> On Tuesday 04 October 2016 04:13 PM, Vivek Gautam wrote:
>> No-Op phy transceiver can be used on platforms that have
>> controllers which themselves provide PHY functionality and
>> there's no separate PHY controller available.
>>
>> This driver provides a basic skeleton for a nop-phy driver.
>> This can be further extended to add required features.
>>
>> Inspired by phy-generic driver in drivers/usb/phy.
>>
>> Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
>> Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>
>> Hi Kishon, Felipe,
>>
>> This patch has been lying in my tree for sometime.
>> This introduces a skeletal nop-phy driver based on generic
>> phy framework.
>> I mainly use this driver when I have only one phy driver available
>> for testing for a controller that uses more than one phy.
>>
>> But this can be further extended to add any feature support for
>> controllers that don't have a separate PHY controller and that
>> themselves provide the PHY functionality, a purpose similar
>> to what drivers/usb/phy/phy-generic.c driver serves.
>>
>> Do you think we have a requirement for such a driver in the generic
>> phy layer? I hope this driver can do some good.
>> Let me know your comments on this.
>>
>> Thanks
>> Vivek
>>
>>   Documentation/devicetree/bindings/phy/phy-nop.txt |  22 +++
>>   drivers/phy/Kconfig                               |  10 ++
>>   drivers/phy/Makefile                              |   1 +
>>   drivers/phy/phy-nop.c                             | 193 ++++++++++++++++++++++
>>   4 files changed, 226 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/phy-nop.txt
>>   create mode 100644 drivers/phy/phy-nop.c
>>
>> diff --git a/Documentation/devicetree/bindings/phy/phy-nop.txt b/Documentation/devicetree/bindings/phy/phy-nop.txt
>> new file mode 100644
>> index 0000000..6cb6779
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/phy-nop.txt
[snip]

>> +
>> +Example:
>> +	phy_nop: phy_nop {
>> +		compatible = "phy-nop";
>> +		#phy-cells = <0>;
>> +	};
> I don't think this qualifies to be modeled as dt. device tree should try to
> represent HW and not workaround SW issues by creating dummy nodes. For such
> cases phy_optional_get should suffice?

You are right. The device tree should model the hardware on the platform.
But what i am trying to model here is a simple phy binding that the 
users can
use taking a phandle for this PHY in their device nodes.

>
> I'm more towards having a simple-phy, along the lines of [1]
>
> [1] -> https://patchwork.kernel.org/patch/8153691/

Cool, the above patch looks good, and is quite similar to what i meant 
to do.
I will drop this one.

But that patch hasn't move forward. I will ping in that thread, so that we
can have a re-spin of that patch that can be reviewed further and merged.

>
> Thanks
> Kishon
[snip]


Thanks
Vivek


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
