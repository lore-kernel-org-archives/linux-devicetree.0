From: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH 03/14] DEVICETREE: Add PIC32 clock binding documentation
Date: Wed, 25 Nov 2015 22:36:55 -0700
Message-ID: <56569A77.8010800@microchip.com>
References: <1448065205-15762-1-git-send-email-joshua.henderson@microchip.com>
 <1448065205-15762-4-git-send-email-joshua.henderson@microchip.com>
 <20151122213110.GA16187@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151122213110.GA16187@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 11/22/2015 2:31 PM, Rob Herring wrote:
> On Fri, Nov 20, 2015 at 05:17:15PM -0700, Joshua Henderson wrote:
>> From: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>>
>> Document the devicetree bindings for the clock driver found on Microchip
>> PIC32 class devices.
>>
>> Signed-off-by: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>> Signed-off-by: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>> ---
>>  .../devicetree/bindings/clock/microchip,pic32.txt  |  263 ++++++++++++++++++++
>>  1 file changed, 263 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/microchip,pic32.txt
>>
>> diff --git a/Documentation/devicetree/bindings/clock/microchip,pic32.txt b/Documentation/devicetree/bindings/clock/microchip,pic32.txt
>> new file mode 100644
>> index 0000000..4cef72d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/microchip,pic32.txt
>> @@ -0,0 +1,263 @@
>> +Binding for a Clock hardware block found on
>> +certain Microchip PIC32 MCU devices.
>> +
>> +Microchip SoC clocks-node consists of few oscillators, PLL, multiplexer
>> +and few divider nodes.
> 
> [...]
> 
>> +Required properties:
>> +- compatible : should have "microchip,pic32-clk".
>> +- reg : A Base address and length of the register set.
>> +- interrupts : source of interrupt.
>> +
>> +Optional properties (for subnodes):
>> +- #clock-cells: From common clock binding, should be 0.
>> +
>> +- microchip,clock-indices: in multiplexer node clock sources always aren't linear
>> +    and contiguous. This property helps define clock-sources with respect to
>> +    the mux clock node.
>> +
>> +- microchip,ignore-unused : ignore gate request even if the gated clock is unused.
> 
> There is some discussion about this upstream with "critical-clocks" 
> binding. Can you use and wait for that?
> 

The way this is going, we might not have to wait. :)  Is there a patch available yet to try it out?  

>> +- microchip,status-bit-mask: bitmask for status check. This will be used to confirm
>> +    particular operation by clock sub-node is completed. It is dependent sub-node.
>> +- microchip,bit-mask: enable mask, similar to microchip,status-bit-mask.
> 
> We've generally decided not to describe clocks at this level of detail 
> in DT. It's fine though for simple clock trees. This one seems to be 
> borderline IMO.
> 

The binding example is the entire clock tree.  These masks are right from the datasheet.  For reference, do you have an example of a better alternative?

>> +- microchip,slew-step: enable frequency slewing(stepping) during rate change;
>> +    applicable only to sys-clock subnode.
> 

Thanks,
Josh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
