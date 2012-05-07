From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 2/3] MFD: twl6040: Allocate IRQ numbers dynamically
Date: Mon, 07 May 2012 09:49:55 +0300
Message-ID: <4FA77093.9060306@ti.com>
References: <20120503145248.GJ3955@opensource.wolfsonmicro.com> <4FA2A08C.5000403@ti.com> <20120503152643.GM3955@opensource.wolfsonmicro.com> <4FA3958A.4080206@ti.com> <20120504090856.GA14230@opensource.wolfsonmicro.com> <4FA3B182.5060001@ti.com> <20120504112204.GE14230@opensource.wolfsonmicro.com> <4FA3C3B9.3030009@ti.com> <20120504121730.GG14230@opensource.wolfsonmicro.com> <4FA3CCAF.3020902@ti.com> <20120504124750.GL14230@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120504124750.GL14230@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, Misael Lopez Cruz <misael.lopez@ti.com>, Benoit Cousson <b-cousson@ti.com>, devicetree-discuss@lists.ozlabs.org, Liam Girdwood <lrg@ti.com>
List-Id: devicetree@vger.kernel.org

On 05/04/2012 03:47 PM, Mark Brown wrote:
> This doesn't really work for board files, though - you can only call
> gpio_to_irq() at runtime so if you're statically registering the devi=
ces
> on the board you'd need to make the structures non-const, manage to f=
ind
> the GPIO controller at runtime then do the lookup, update the struct =
and
> finally register the device.

I've seen some board files doing this already (obviously not for the
twl6040). Which is not the nicest thing...

>> If there is "irq expander" type of chip I assume it would have simil=
ar
>> way to get the IRQ number based on either GPIO number or some other
>> enumeration value.
>=20
> No, there's no generic interface for this.

This dynamic range allocation for IRQ, GPIO will work nicely with DT at
the end. In legacy way we will need to have workarounds. Or just forget
about booting without DT.

>> The twl6040 does not have such a feature. The interrupts are generat=
ed
>> internally and it has one IRQ line towards the host. We have nested
>> interrupts for the childs (plug detect is handled by ASoC codec, Vib=
ra
>> overcurrent is handled by the vibra driver, etc).
>=20
> OK, that's fine then - you should put this in the changelog to make i=
t
> clear that there are no external users who could be affected.

I'll do that.

Thank you,
P=E9ter
