From: <Claudiu.Beznea@microchip.com>
Subject: Re: Re: [PATCH 2/5] clocksource/drivers/timer-microchip-pit64b: add
 Microchip PIT64B support
Date: Thu, 13 Jun 2019 14:12:53 +0000
Message-ID: <5e3d783e-7bcc-64c1-c814-eaf99a6aa205@microchip.com>
References: <1552580772-8499-1-git-send-email-claudiu.beznea@microchip.com>
 <1552580772-8499-3-git-send-email-claudiu.beznea@microchip.com>
 <a738fce5-1108-34d7-d255-dfcb86f51c56@linaro.org>
 <20190408121141.GK7480@piout.net>
 <88ab46de-c3b6-6dd2-3fa2-f2d0075e969f@microchip.com>
 <7267f37b-4f80-97e3-7a8e-bc1a9a28b995@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7267f37b-4f80-97e3-7a8e-bc1a9a28b995@linaro.org>
Content-Language: en-US
Content-ID: <AD599551A64A914392D310BA074C0663@namprd11.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: daniel.lezcano@linaro.org, alexandre.belloni@bootlin.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ludovic.Desroches@microchip.com, robh+dt@kernel.org, tglx@linutronix.de, arnd.bergmann@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On 31.05.2019 13:41, Daniel Lezcano wrote:
> 
> Hi Claudiu,
> 
> 
> On 30/05/2019 09:46, Claudiu.Beznea@microchip.com wrote:
>> Hi Daniel,
>>
>> Taking into account the discussion on this tread and the fact that we have
>> no answer from Rob on this topic (I'm talking about [1]), what do you think
>> it would be best for this driver to be accepted the soonest? Would it be OK
>> for you to mimic the approach done by:
>>
>> drivers/clocksource/timer-integrator-ap.c
>>
>> with the following bindings in DT:
>>
>> aliases {
>> 	arm,timer-primary = &timer2;
>> 	arm,timer-secondary = &timer1;
>> };
>>
>> also in PIT64B driver?
>>
>> Or do you think re-spinning the Alexandre's patches at [2] (which seems to
>> me like the generic way to do it) would be better?
> 
> This hardware / OS connection problem is getting really annoying for
> everyone and this pattern is repeating itself since several years. It is
> time we fix it properly.
> 
> The first solution looks hackish from my POV. The second approach looks
> nicer and generic as you say. So I would vote for [2]
> flagging approach proposed by Mark [3].

With this flagging approach this would mean a kind unification of
clocksource and clockevent functionalities under a single one, right? So
that the driver would register to the above layers only one device w/ 2
functionalities (clocksource and clockevent)? Please correct me if I'm
wrong? If so, from my point of view this would require major re-working of
clocksource and clockevent subsystems. Correctly if I wrongly understood,
please.

At the moment we register different functionalities (clocksource and
clockevent) to the above layers for hardware blocks (e.g. with
clocksource_register_hz() or clockevents_config_and_register()). If
hardware can support clocksource and clockevent we register both these
functionalities, if only one is supported we register only one of these.
The above layers would choose the best clocksource/clockevent device from
the available ones based on rating field for each clocksource/clockevent we
register. In all this current behavior I don't see how these flags would
interact with clocksource/clockevent subsystem. Could you please let me
know how do you see these and the way these new flags would interact with
the layers above the drivers?

Thank you,
Claudiu Beznea

> 
> I added Arnd in Cc in order to have its opinion.
> 
> [3]
> https://lore.kernel.org/lkml/20171215113242.skmh5nzr7wqdmvnw@lakrids.cambridge.arm.com/
> 
>> [1]
>> https://lore.kernel.org/lkml/20190408151155.20279-1-alexandre.belloni@bootlin.com/#t
>> [2]
>> https://lore.kernel.org/lkml/20171213185313.20017-1-alexandre.belloni@free-electrons.com/
>>
> 
> 
> 
> 
> 
> 
