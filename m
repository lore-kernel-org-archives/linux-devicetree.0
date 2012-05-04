From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 2/3] MFD: twl6040: Allocate IRQ numbers dynamically
Date: Fri, 04 May 2012 15:33:51 +0300
Message-ID: <4FA3CCAF.3020902@ti.com>
References: <20120503132004.GB14296@sirena.org.uk> <4FA2881B.6010902@ti.com> <20120503145248.GJ3955@opensource.wolfsonmicro.com> <4FA2A08C.5000403@ti.com> <20120503152643.GM3955@opensource.wolfsonmicro.com> <4FA3958A.4080206@ti.com> <20120504090856.GA14230@opensource.wolfsonmicro.com> <4FA3B182.5060001@ti.com> <20120504112204.GE14230@opensource.wolfsonmicro.com> <4FA3C3B9.3030009@ti.com> <20120504121730.GG14230@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120504121730.GG14230@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, Misael Lopez Cruz <misael.lopez@ti.com>, Benoit Cousson <b-cousson@ti.com>, devicetree-discuss@lists.ozlabs.org, Liam Girdwood <lrg@ti.com>
List-Id: devicetree@vger.kernel.org

On 05/04/2012 03:17 PM, Mark Brown wrote:
>> You mean on devices like twl6040, twl6030, twl4030 (I2C MFD devices)=
?
>> Or "irq expander" type of devices?
>=20
> The latter, and also just any driver that delivers an interrupt via a
> GPIO on OMAP - if the GPIO IRQ numbers are all dynamically allocated
> then it gets hard to register an off-chip device and tell it which
> interrupt to request.

=46or GPIO IRQ there's the gpio_to_irq() call which returns the mapped =
IRQ
number for the given GPIO.
If there is "irq expander" type of chip I assume it would have similar
way to get the IRQ number based on either GPIO number or some other
enumeration value.
The twl6040 does not have such a feature. The interrupts are generated
internally and it has one IRQ line towards the host. We have nested
interrupts for the childs (plug detect is handled by ASoC codec, Vibra
overcurrent is handled by the vibra driver, etc).
Client drivers got their interrupts via platform_get_irq(); they does
not need to know anything about irq_base, or where the IRQ number has
been mapped.

--=20
P=E9ter
