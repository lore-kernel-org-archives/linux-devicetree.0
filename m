From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH 3/4] dt-bindings: Update iProc GPIO bindings
Date: Mon, 18 Apr 2016 11:27:51 -0700
Message-ID: <31a7fbd4-0b0b-c49b-651e-1a1494ab5978@broadcom.com>
References: <1460506523-6249-1-git-send-email-ray.jui@broadcom.com>
 <1460506523-6249-4-git-send-email-ray.jui@broadcom.com>
 <20160414143812.GA20964@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160414143812.GA20964@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 4/14/2016 7:38 AM, Rob Herring wrote:
> On Tue, Apr 12, 2016 at 05:15:22PM -0700, Ray Jui wrote:
>> Update the iProc GPIO binding document to introduce a new compatible
>> string "brcm,iproc-gpio-only", that allows the generic pinconf function
>> to be disabled completely
>>
>> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
>> Reviewed-by: Jon Mason <jon.mason@broadcom.com>
>> Reviewed-by: Scott Branden <scott.branden@broadcom.com>
>> ---
>>  Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
>> index ddaa1b0..75a4370 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
>> @@ -3,8 +3,11 @@ Broadcom iProc GPIO/PINCONF Controller
>>  Required properties:
>>
>>  - compatible:
>> -    Must be "brcm,cygnus-ccm-gpio", "brcm,cygnus-asiu-gpio",
>> -    "brcm,cygnus-crmu-gpio" or "brcm,iproc-gpio"
>> +    For Cygnus, it must be brcm,cygnus-ccm-gpio", "brcm,cygnus-asiu-gpio", or
>> +"brcm,cygnus-crmu-gpio"
>> +    For non-Cygnus iProc SoCs, it must be either "brcm,iproc-gpio-only" (if
>> +only GPIO is supported) or "brcm,iproc-gpio" (if both generic pinconf and GPIO
>> +are supported)
>
> No. That's not how compatible strings work. Use SoC specific compatible
> strings if you need to distinguish this.
>
> Rob
>

Okay. Let me reply this to the email from Linus so we can consolidate 
all related discussions.

Thanks,

Ray
