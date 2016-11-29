From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: drm/bridge: adv7511: Add regulator
 bindings
Date: Tue, 29 Nov 2016 13:41:33 +0530
Message-ID: <b779c014-fc20-1fbc-dea9-cb90dbde5b71@codeaurora.org>
References: <1474622430-6704-1-git-send-email-architt@codeaurora.org>
 <1480399662-8858-1-git-send-email-architt@codeaurora.org>
 <1480399662-8858-2-git-send-email-architt@codeaurora.org>
 <2390919.s2CzTWN1li@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <2390919.s2CzTWN1li@avalon>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-arm-msm@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 11/29/2016 12:03 PM, Laurent Pinchart wrote:
> Hi Archit,
>
> Thank you for the patch.
>
> On Tuesday 29 Nov 2016 11:37:41 Archit Taneja wrote:
>> Add the regulator supply properties needed by ADV7511 and ADV7533.
>>
>> The regulators are specified as optional properties since there can
>> be boards which have a fixed supply directly routed to the pins, and
>> these may not be modelled as regulator supplies.
>
> That's why we have support for dummy supplies in the kernel, isn't it ? Isn't
> it better to make the supplies mandatory in the bindings (and obviously
> handling them as optional in the driver for backward-compatibility) ?

I'm a bit unclear on this.

I thought we couldn't add mandatory properties once the device is already
present in DT for one or more platforms.

Say, if we do make it mandatory for future additions, we would need to have
DT property for the supplies for the new platforms. If the regulators on
these boards are fixed supplies, they would be need to be modeled
using "regulator-fixed", possibly without any input supply. Is that
what you're suggesting?

Thanks,
Archit

>
> Apart from that,
>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>> Cc: devicetree@vger.kernel.org
>> Acked-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>> ---
>> v3:
>> - Revert back to having a common avdd-supply property for the 1.8V
>>   supplies
>>
>> Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt | 9 ++++++
>> 1 file changed, 9 insertions(+)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
>> b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt index
>> 6532a59..13d53bc 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
>> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
>> @@ -56,6 +56,15 @@ Optional properties:
>>  - adi,disable-timing-generator: Only for ADV7533. Disables the internal
>> timing generator. The chip will rely on the sync signals in the DSI data
>> lanes, rather than generate its own timings for HDMI output.
>> +- avdd-supply: A common 1.8V supply that powers up the AVDD, DVDD and PVDD
>> +  pins. On ADV7511, it also feeds to the BGVDD pin. On ADV7533, it also
>> powers
>> +  up the A2VDD pin.
>> +- v3p3-supply: A 3.3V supply that powers up the pin called DVDD_3V on
>> +  ADV7511 and V3P3 on ADV7533.
>> +
>> +ADV7533 specific supplies:
>> +- v1p2-supply: A supply that powers up the V1P2 pin on the chip. It can be
>> +  either 1.2V or 1.8V.
>>
>>  Required nodes:
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
