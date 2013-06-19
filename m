From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: kernel: document ARM CPUs clock-frequency property
Date: Wed, 19 Jun 2013 14:11:46 +0100
Message-ID: <CAGVrzcaFQacQeg4JSv2XRyCHoOpU3fcgThBzuP+k1+D7LrRtTw@mail.gmail.com>
References: <1371635237-22860-1-git-send-email-f.fainelli@gmail.com>
 <20130619100450.GA27181@e106331-lin.cambridge.arm.com>
 <CAGVrzcY8oxZ7zUbThvXgsVyEGBCsxcvu4R0it_9s9wsKkJ3W0w@mail.gmail.com>
 <20130619112324.GA32207@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130619112324.GA32207@e102568-lin.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "nico@linaro.org" <nico@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

2013/6/19 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>:
> On Wed, Jun 19, 2013 at 11:27:50AM +0100, Florian Fainelli wrote:
>> Hello Mark,
>>
>> 2013/6/19 Mark Rutland <mark.rutland@arm.com>:
>> > On Wed, Jun 19, 2013 at 10:47:17AM +0100, Florian Fainelli wrote:
>> >> ARM CPU device tree nodes may contain an optional clock-frequency
>> >> property, when set, this property must contain the CPU frequency in Hz,
>> >> which is then used by the topology parsing code in
>> >> arch/arm/kernel/topology.c to infer the CPU capacity.
>> >
>> > I see that arch/arm/kernel/topology.c does a pr_err when clock-frequency isn't
>> > present. If we're documenting it as optional, should we not downgrade that or
>> > remove it entirely?
>>
>> Good question. I think it might be good to just dowgrade the error to
>> a simple warning, we should clearly be fixing the binding if we have a
>> device_type = "cpu" property but no clock-frequency property.
>
> Well, this means that that pr_err will trigger as soon as the dts
> updates hit the mainline, now probably it is silent because cpu nodes
> for architectures with "arm,cortex-a15" as cpus miss device_type = "cpu".
> ePAPR defines "clock-frequency" as required.

Correct. I am also fine with documenting this property as mandatory.

>
> So either we downgrade it to optional or we are in for another slew of dts
> updates, I am really looking forward to that. Certainly it has to be added
> to the bindings.
>
> Thoughts ?

Well, the fix would be twofold:
- for platforms which already have an "arm,cortex-a15" CPU nodes but
lack a clock phandle or a clock-frequency add it
- update arch/arm/kernel/toplogy.c to fetch the clock phandle and rate
if specified (e.g: ecx-2000)

Here is a list of platforms/DTS that would appear to need fixing:
- exynos5440.dtsi
- tegra114.dtsi
- vexpress-v2p-ca15-tc1.dts
- vexpress-v2p-ca15_a7.dts
- xenvm-4.2.dts

As far as I am concerned, the DTB passed to my kernel is already okay,
but certainly this needs fixing for in-tree DTS files.
--
Florian
