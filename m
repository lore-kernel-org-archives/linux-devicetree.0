From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: Update iProc GPIO bindings
Date: Wed, 4 May 2016 09:29:04 -0700
Message-ID: <6fe293c1-505d-2af9-711a-09e5b5a83e58@broadcom.com>
References: <1462222308-4869-1-git-send-email-ray.jui@broadcom.com>
 <1462222308-4869-2-git-send-email-ray.jui@broadcom.com>
 <20160504132020.GA21065@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160504132020.GA21065@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 5/4/2016 6:20 AM, Rob Herring wrote:
> On Mon, May 02, 2016 at 01:51:47PM -0700, Ray Jui wrote:
>> Update the iProc GPIO binding document to add new compatible strings
>> "brcm,iproc-gpio-v2" and "brcm,iproc-gpio-v3" for the 2nd and 3rd
>> generation of the iProc GPIO controllers
>>
>> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
>> ---
>>  Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
>> index e427792..3a56649 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
>> @@ -4,7 +4,16 @@ Required properties:
>>
>>  - compatible:
>>      Must be "brcm,cygnus-ccm-gpio", "brcm,cygnus-asiu-gpio",
>> -    "brcm,cygnus-crmu-gpio" or "brcm,iproc-gpio"
>> +    or "brcm,cygnus-crmu-gpio" for Cygnus SoCs
>> +
>> +    "brcm,iproc-gpio" for the first generation of the GPIO controller that
>> +    supports full-featured pinctrl and GPIO functions used in iProc based SoCs
>> +
>> +    "brcm,iproc-gpio-v2" for the second generation of the GPIO controller that
>> +    has the drive strength pinctrl support disabled, e.g., in the iProc NSP SoC
>> +
>> +    "brcm,iproc-gpio-v3" for the third generation of the GPIO controller that
>> +    has the general pinctrl support completely disabled
>
> You can have these for driver matching, but you still need SoC specific
> compatible strings.
>
> Rob
>

I think I'm missing something and hope you can help to clarify here. It 
looks like the notion of v2, v3 should only be used if there's an indeed 
an revision update on the controller IP itself, correct?

In our case, if the same revision of GPIO controller is used but instead 
synthesized differently with different SoCs, then you are suggesting 
here that it should be dealt with SoC specific compatible string, correct?

For example, for the GPIO controller on NSP where drive strength is 
disabled, the compatible string in DT should look like this?

compatible = "brcm,iproc-gpio", "brcm,iproc-gpio-nsp";

For the GPIO controller on Stingray where pinconf is completely 
disabled, the compatible string in DT should look like:

compatible = "brcm,iproc-gpio", "brcm,iproc-gpio-stingray";

Is that correct?

Thanks,

Ray
