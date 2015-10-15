From: Scott Branden <sbranden@broadcom.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add new boards to bcm4708 DT bindings
Date: Thu, 15 Oct 2015 13:59:31 -0700
Message-ID: <562013B3.9070707@broadcom.com>
References: <1444860890-28649-1-git-send-email-jonmason@broadcom.com>
 <1444860890-28649-2-git-send-email-jonmason@broadcom.com>
 <5620120F.3060109@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5620120F.3060109@hauke-m.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Hauke Mehrtens <hauke@hauke-m.de>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On 15-10-15 01:52 PM, Hauke Mehrtens wrote:
> On 10/15/2015 12:14 AM, Jon Mason wrote:
>> Add the 4708, 4709, and 953012k SVKs to the the documentation for the
>> Broadcom Northstar device tree bindings.
>>
>> Signed-off-by: Jon Mason <jonmason@broadcom.com>
>> ---
>>   Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt
>> index 6b0f49f..b9cc308 100644
>> --- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt
>> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt
>> @@ -5,4 +5,11 @@ Boards with the BCM4708 SoC shall have the following properties:
>>
>>   Required root node property:
>>
>> +bcm94708
this should be bcm4708
>
> I thought we wanted to add the SoC names here, isn't bcm94708 a board
> the bcm4708, the SoC ion this board? I do not really care about this
> file, has anyone found the documentation what should be listed here?

Yes - the 9 infront indicates its some type of board.  The SoC part 
numbers should be listed here.  The SoCs are all variants of 
Northstar/Northstar plus family.  Some have different io, packaging, 
speed grades, etc.

>
> Hauke
>
>>   compatible = "brcm,bcm4708";
>> +
>> +bcm94709
This should be bcm4709
>> +compatible = "brcm,bcm4709";
>> +
>> +bcm953012
This should be bcm53012
>> +compatible = "brcm,bcm53012";
>>
>
