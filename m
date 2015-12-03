From: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH 03/14] DEVICETREE: Add PIC32 clock binding documentation
Date: Thu, 3 Dec 2015 10:37:57 -0700
Message-ID: <56607DF5.1080804@microchip.com>
References: <1448065205-15762-1-git-send-email-joshua.henderson@microchip.com>
 <1448065205-15762-4-git-send-email-joshua.henderson@microchip.com>
 <20151122213110.GA16187@rob-hp-laptop> <56569A77.8010800@microchip.com>
 <20151130214344.GA13253@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151130214344.GA13253@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rob,

On 11/30/2015 02:43 PM, Rob Herring wrote:
> On Wed, Nov 25, 2015 at 10:36:55PM -0700, Joshua Henderson wrote:
>> Hi Rob,
>>
>> On 11/22/2015 2:31 PM, Rob Herring wrote:
>>> On Fri, Nov 20, 2015 at 05:17:15PM -0700, Joshua Henderson wrote:
>>>> From: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>>>>
>>>> Document the devicetree bindings for the clock driver found on Microchip
>>>> PIC32 class devices.
>>>>
>>>> Signed-off-by: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>>>> Signed-off-by: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>>>> ---
>>>>  .../devicetree/bindings/clock/microchip,pic32.txt  |  263 ++++++++++++++++++++
>>>>  1 file changed, 263 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/clock/microchip,pic32.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/microchip,pic32.txt b/Documentation/devicetree/bindings/clock/microchip,pic32.txt
>>>> new file mode 100644
>>>> index 0000000..4cef72d
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/clock/microchip,pic32.txt
>>>> @@ -0,0 +1,263 @@
>>>> +Binding for a Clock hardware block found on
>>>> +certain Microchip PIC32 MCU devices.
>>>> +
>>>> +Microchip SoC clocks-node consists of few oscillators, PLL, multiplexer
>>>> +and few divider nodes.
>>>
>>> [...]
>>>
>>>> +Required properties:
>>>> +- compatible : should have "microchip,pic32-clk".
> 
> BTW, this should list out the actual compatible strings.

Ack.  These are also being changed to microchip,pic32mzda-* due to other feedback.

> 
>>> There is some discussion about this upstream with "critical-clocks" 
>>> binding. Can you use and wait for that?
>>>
>>
>> The way this is going, we might not have to wait. :)  Is there a patch available yet to try it out?  
> 
> Yes, googling "Lee Jones critical-clocks" should find it.

The change for this on our side is in the queue should the stars align on timing.

[...]

> 
> Rob
> 

Thanks,
Josh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
