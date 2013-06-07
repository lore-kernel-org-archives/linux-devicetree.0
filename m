From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 4/6] ARM: kirkwood: move device tree nodes to DT irqchip
 and clocksource
Date: Fri, 07 Jun 2013 11:15:52 +0200
Message-ID: <51B1A4C8.9070404@gmail.com>
References: <1370536034-23956-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1370536034-23956-5-git-send-email-sebastian.hesselbarth@gmail.com>
 <20130607103007.415575c8@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130607103007.415575c8@skate>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/07/13 10:30, Thomas Petazzoni wrote:
> On Thu,  6 Jun 2013 18:27:12 +0200, Sebastian Hesselbarth wrote:
>> -		wdt@20300 {
>> +		wdt: watchdog-timer@20300 {
>>   			compatible = "marvell,orion-wdt";
>>   			reg = <0x20300 0x28>;
>> +			interrupt-parent = <&bridge_intc>;
>> +			interrupts = <3>;
>>   			clocks = <&gate_clk 7>;
>>   			status = "okay";
>>   		};
>
> The watchdog driver is mapping the same registers as the timer driver
> (0x20300) and is poking into the same TIMER_CTRL register that controls
> both the timers and the watchdog.

Thomas,

you are right. I must admit that I forgot to take care of watchdog
driver.

> In addition to this, the watchdog driver also pokes into some other
> registers, such as BRIDGE_CAUSE and RSTOUTn_MASK.

As you can see above, watchdog should depend on chained interrupts but
current implementation doesn't but clears itself in BRIDGE_CAUSE.
Current non-DT timer also does (thread unsafe).

DT timer depends on the chained irq handler introduced with this patch
set. So for the interrupt, watchdog should also depend on the chained
irq handler to clear wdt irq.

Access to TIMER_CTRL should be made thread safe. I suggest to put that
common code into orion clocksource as it will be always compiled in
while wdt is optional.

> As we want to bring watchdog support for Armada 370/XP, I'm wondering
> if we should fix those problems, and if yes, how:
>
>   (1) The timer driver is also responsible for handling the watchdog
>       (probably the easiest solution)

Well, there is drivers/watchdog where current (Orion) wdt is located.
I guess it should stay there. For Armada 370/XP I guess it will need
to clear the watchdog events in common timer registers as for the timer
events? That is why I didn't merge Orion clocksource into Armada 370/XP
clocksource because we would have to check for Orion/Armada 370/XP on
every timer event.

>   (2) Have some sort of 'common code' between the timer driver and the
>       watchdog driver to control the access to the shared TIMER_CTRL
>       register.

Yes. Both should call a common thread-safe timer_en(num) at least.

>   (3) Something else.
>
> And this still does not solve the access to BRIDGE_CAUSE and
> RSTOUTn_MASK.

BRIDGE_CAUSE is taken care of by making wdt depend on chained irq
handler.. RSTOUTn_MASK is only used by current common code on reset,
maybe there is an API for that I have missed yet. But both reset and
watchdog will ultimately cause a reset - maybe we can accept that for
now.

Sebastian
