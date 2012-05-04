From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 2/3] MFD: twl6040: Allocate IRQ numbers dynamically
Date: Fri, 04 May 2012 11:38:34 +0300
Message-ID: <4FA3958A.4080206@ti.com>
References: <1336049665-27777-1-git-send-email-peter.ujfalusi@ti.com> <1336049665-27777-3-git-send-email-peter.ujfalusi@ti.com> <20120503132004.GB14296@sirena.org.uk> <4FA2881B.6010902@ti.com> <20120503145248.GJ3955@opensource.wolfsonmicro.com> <4FA2A08C.5000403@ti.com> <20120503152643.GM3955@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120503152643.GM3955@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, Misael Lopez Cruz <misael.lopez@ti.com>, Benoit Cousson <b-cousson@ti.com>, devicetree-discuss@lists.ozlabs.org, Liam Girdwood <lrg@ti.com>
List-Id: devicetree@vger.kernel.org

On 05/03/2012 06:26 PM, Mark Brown wrote:
> On Thu, May 03, 2012 at 06:13:16PM +0300, Peter Ujfalusi wrote:
>> On 05/03/2012 05:52 PM, Mark Brown wrote:
>>> Are you sure there aren't any boards out there which rely on the
>>> interrupt base (eg, using a GPIO with the IRQ output of a chip)?
>=20
>> Yes, I'm sure.
>=20
> Because...?

The irq_base was used to map the nested interrupt numbers somewhere hig=
h
enough. twl6040 has one irq line towards the CPU (comes via
i2c_client->irq).
With this change we just change the mapping of the nested interrupt
range provided by twl6040 (instead of hardwired number we ask for
suitable range).
We have sdp4430 and PandaBoard with twl6040. They are fine. The other
non upstream boards should be fine as well with this change.

--=20
P=E9ter
