From: tom burkart <tom@aussec.com>
Subject: Re: [PATCH v9 3/4] dt-bindings: pps: pps-gpio PPS ECHO
 implementation
Date: Tue, 27 Nov 2018 15:06:29 +1100
Message-ID: <20181127150629.10795h1esqtc53ut@aussec.com>
References: <20181122094602.5156-1-tom@aussec.com>
 <20181122094602.5156-2-tom@aussec.com>
 <20181122094602.5156-3-tom@aussec.com>
 <20181122094602.5156-4-tom@aussec.com>
 <CAL_JsqJ6fM3+pcC3b-eXEex=j_ft6Z=vukhLK9wULfWJqOTN-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8;
 DelSp="Yes";
 format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJ6fM3+pcC3b-eXEex=j_ft6Z=vukhLK9wULfWJqOTN-A@mail.gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, lukas@fridolin.com
List-Id: devicetree@vger.kernel.org

Hi Rob,

Quoting Rob Herring <robh@kernel.org>:

> On Thu, Nov 22, 2018 at 3:49 AM Tom Burkart <tom@aussec.com> wrote:
>>
>> This patch implements the device tree changes required for the pps
>> echo functionality for pps-gpio, that sysfs claims is available
>> already.
>>
>> This patch was originally written by Lukas Senger as part of a masters
>> thesis project and modified for inclusion into the linux kernel by Tom
>> Burkart.
>>
>> Signed-off-by: Lukas Senger <lukas@fridolin.com>
>> Signed-off-by: Tom Burkart <tom@aussec.com>
>> ---
>>  Documentation/devicetree/bindings/pps/pps-gpio.txt | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pps/pps-gpio.txt  
>> b/Documentation/devicetree/bindings/pps/pps-gpio.txt
>> index 1155d49c2699..e09f6f2405c5 100644
>> --- a/Documentation/devicetree/bindings/pps/pps-gpio.txt
>> +++ b/Documentation/devicetree/bindings/pps/pps-gpio.txt
>> @@ -7,10 +7,15 @@ Required properties:
>>  - compatible: should be "pps-gpio"
>>  - gpios: one PPS GPIO in the format described by ../gpio/gpio.txt
>>
>> +Additional required properties for the PPS ECHO functionality:
>> +- echo-gpios: one PPS ECHO GPIO in the format described by ../gpio/gpio.txt
>> +- echo-active-ms: duration in ms of the active portion of the echo pulse
>> +
>>  Optional properties:
>>  - assert-falling-edge: when present, assert is indicated by a falling edge
>>                         (instead of by a rising edge)
>>  - capture-clear: when present, also capture the PPS clear event
>> +- invert-pps-echo: when present, invert the PPS ECHO pulse
>
> Why do you need this? Can't you just make the echo gpio GPIO_ACTIVE_LOW?
>
> BTW, using the flag probably should have been done for
> 'assert-falling-edge' as well.

The hardware I use expects a positive-going echo pulse, however, it  
was really easy to give users the option to have it inverted in case  
they use different hardware that expects a negative-going edge.

I may well be needing this option myself if I find that the GPS I am  
using produces better results for negative-going edges than  
positive-going edges.

Tom
