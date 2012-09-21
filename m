From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2] pwm_backlight: Add device tree support for Low Threshold
 Brightness
Date: Fri, 21 Sep 2012 11:43:39 -0600
Message-ID: <505CA74B.2090405@wwwdotorg.org>
References: <1348203080-16348-1-git-send-email-avinashphilip@ti.com> <505BF83D.8040201@wwwdotorg.org> <518397C60809E147AF5323E0420B992E3E9A685B@DBDE01.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <518397C60809E147AF5323E0420B992E3E9A685B@DBDE01.ent.ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: "Philip, Avinash" <avinashphilip@ti.com>
Cc: "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Nori, Sekhar" <nsekhar@ti.com>, "Hebbar, Gururaja" <gururaja.hebbar@ti.com>
List-Id: devicetree@vger.kernel.org

On 09/21/2012 12:03 AM, Philip, Avinash wrote:
> Hi Stephen,
> 
> On Fri, Sep 21, 2012 at 10:46:45, Stephen Warren wrote:
>> On 09/20/2012 10:51 PM, Philip, Avinash wrote:
>>> Some backlights perform poorly when driven by a PWM with a short
>>> duty-cycle. For such devices, the low threshold can be used to specify a
>>> lower bound for the duty-cycle and should be chosen to exclude the
>>> problematic range.
>>>
>>> This patch adds support for an optional low-threshold-brightness
>>> property.
>>
>>> diff --git a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
>>
>>>  Optional properties:
>>>    - pwm-names: a list of names for the PWM devices specified in the
>>>                 "pwms" property (see PWM binding[0])
>>> +  - low-threshold-brightness: brightness threshold low level. Low threshold
>>> +    brightness set to value so that backlight present on low end of
>>> +    brightness.
>>
>> For my education, why not just specify values above this value in the
>> brightness-levels array; how do those two interact?
> 
> Please find details from 
> https://lkml.org/lkml/2012/7/18/284

Hmm. That still doesn't really explain what this property does.

I'm going to guess that if this property is present, and values in the
brightness-levels property get scaled between the
low-threshold-brightness and 255 instead of being used directly. But
then, in the email you linked to, what does "But brightness-levels won't
be uniformly divided" mean? Why would doing the calculation at run-time
be any better than simply putting the correct values into
brightness-levels in the first place?

Either way, the DT binding should explain exactly what this value is
used for, and how it affects the interpretation of values in
brightness-levels.
