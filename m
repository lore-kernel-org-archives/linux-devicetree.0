From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: reset: Add document for Broadcom STB
 reset controller
Date: Wed, 2 Jan 2019 12:38:58 -0800
Message-ID: <a5bc2d16-0b69-b3b2-c7d2-1ebeeb3f8989@gmail.com>
References: <20181221013409.14324-1-f.fainelli@gmail.com>
 <20181221013409.14324-2-f.fainelli@gmail.com>
 <67d797f6-fc3a-535c-d336-edcdc70c332e@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <67d797f6-fc3a-535c-d336-edcdc70c332e@broadcom.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Branden <scott.branden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, p.zabel@pengutronix.de, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 12/31/18 3:13 PM, Scott Branden wrote:
> 
> On 2018-12-20 5:34 p.m., Florian Fainelli wrote:
>> Add a binding document for the Broadcom STB reset controller, also known
>> as SW_INIT-style reset controller.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>   .../devicetree/bindings/reset/brcm,reset.txt  | 27 +++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/reset/brcm,reset.txt
>>
>> diff --git a/Documentation/devicetree/bindings/reset/brcm,reset.txt
>> b/Documentation/devicetree/bindings/reset/brcm,reset.txt
>> new file mode 100644
>> index 000000000000..6e5341b4f891
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reset/brcm,reset.txt
> This is brcmstb-reset specific.  File should be brcm, brcmstb-reset.txt

Indeed, thanks!
-- 
Florian
