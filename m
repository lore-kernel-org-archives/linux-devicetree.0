From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: Update iProc GPIO bindings
Date: Mon, 18 Jul 2016 09:34:58 -0700
Message-ID: <6b936343-e4ab-c085-b33c-21ae90732937@broadcom.com>
References: <1468345158-17676-1-git-send-email-ray.jui@broadcom.com>
 <1468345158-17676-2-git-send-email-ray.jui@broadcom.com>
 <20160716212028.GA6320@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160716212028.GA6320@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 7/16/2016 2:20 PM, Rob Herring wrote:
> On Tue, Jul 12, 2016 at 10:39:17AM -0700, Ray Jui wrote:
>> Update the iProc GPIO binding document to add new compatible strings
>> "brcm,iproc-gpio-nsp" and "brcm,iproc-gpio-stingray" to support the
>> iProc based GPIO controller used in the NSP and Stingray SoCs,
>> respectively
>>
>> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
>> ---
>>  .../devicetree/bindings/pinctrl/brcm,iproc-gpio.txt    | 18 ++++++++++++++++--
>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
>> index e427792..7bd1614 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
>> @@ -3,8 +3,22 @@ Broadcom iProc GPIO/PINCONF Controller
>>  Required properties:
>>
>>  - compatible:
>> -    Must be "brcm,cygnus-ccm-gpio", "brcm,cygnus-asiu-gpio",
>> -    "brcm,cygnus-crmu-gpio" or "brcm,iproc-gpio"
>> +    "brcm,iproc-gpio" for the generic iProc based GPIO controller IP that
>> +    supports full-featured pinctrl and GPIO functions used in various iProc
>> +    based SoCs
>> +
>> +    May contain an SoC-specific compatibility string to accommodate any
>> +    SoC-specific features
>> +
>> +    "brcm,cygnus-ccm-gpio", "brcm,cygnus-asiu-gpio", or
>> +    "brcm,cygnus-crmu-gpio" for Cygnus SoCs
>> +
>> +    "brcm,iproc-gpio-nsp" for the iProc NSP SoC that has drive strength support
>> +    disabled
>
> The typical ordering is <soc>-<block>, so:
>
> iproc-nsp-gpio
>
>> +
>> +    "brcm,iproc-gpio-stingray" for the iProc Stingray SoC that has the general
>> +    pinctrl support completely disabled in this IP block. In Stingray, a
>> +    different IP block is used to handle pinctrl related functions
>
> iproc-stingray-gpio
>
>

Okay, I'll fix the naming string ordering and submit patch v4.

Thanks,

Ray
