From: Douglas Gilbert <dgilbert@interlog.com>
Subject: Re: [PATCH] rtc: rtc-at91sam9.c add DT support
Date: Thu, 04 Apr 2013 09:25:42 -0400
Message-ID: <515D7F56.90702@interlog.com>
References: <515CF985.6050009@interlog.com> <515D35C2.7050405@atmel.com>
Reply-To: dgilbert@interlog.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <515D35C2.7050405@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Johan Hovold <jhovold@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, linux-arm-kernel@lists.infradead.org, Robert Nelson <Robert.Nelson@digikey.com>
List-Id: devicetree@vger.kernel.org

On 13-04-04 04:11 AM, Nicolas Ferre wrote:
> On 04/04/2013 05:54 AM, Douglas Gilbert :
>> Some members of the at91 SoCs use the Real Time Timer (RTT)
>> and the General Purpose Backup Registers (GPBR) to implement
>> a real time clock (RTC). The AT91SAM9G20 is one example.
>>
>> Attached is a patch to add DT support to rtc-at91sam9.c .
>> The patch is against lk 3.9.0-rc5 .
>>
>> Below is a snippet of DT code for the 'G20 that was observed
>> to work with this patch:
>>
>> ahb {
>>      apb {
>>
>>          rtc {
>>              compatible = "atmel,at91sam9-rtc";
>
> The compatible string has to be formed by the name of the first SoC
> compatible with this IP. It turns to be the at91sam9260.
> The second part of the string should be a name that reflects the nature
> of the peripheral. For this binding, I would like to mention the "RTT"
> in the compatibility string (because other drivers can use other RTT
> with other uses).
>
> What do you think about:
> "atmel,at91sam9260-rtt-as-rtc"? or something shorter?

Hi Nicolas,
Johan Hovold suggested:
    atmel,at91sam9260-rtt

I notice (in the G20 doco) that the acronym RTTC is also used
for the rtt registers. What do you want?

>
>>                           /* RTTC followed by GPBR (backup registers) */
>>                           reg = <0xfffffd20 0x10>, <0xfffffd50 0x10>;
>>                           interrupts = <1 4 7>;
>>                           status = "okay";
>
> Last, but not least, when we add a DT binding, it is a requirement to
> add the corresponding documentation in the
> Documentation/devicetree/bindings/rtc/ directory.

I have been underwhelmed by the accuracy and the organisation
of information in that documentation. And the examples are
often misleading given the actual hierarchy of real dtsi/dts
config files.
Give me working examples any day. You could (and should) test
what I gave on a g20ek board.

Also I note there is no "bindings" documentation for
rtc-at91rm9200.c :-) After you, sir ....

Doug Gilbert
