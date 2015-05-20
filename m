From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/2] ARM: vf610: Add SoC bus support for Vybrid
Date: Wed, 20 May 2015 10:18:48 +0200
Message-ID: <9101136.1OZzWnf52Q@wuerfel>
References: <cover.1432099651.git.maitysanchayan@gmail.com> <9691074.oWRy1bscbz@wuerfel> <61cec15fe896133ee6e102b0242fb43d@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <61cec15fe896133ee6e102b0242fb43d@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: linux-arm-kernel@lists.infradead.org, Sanchayan Maity <maitysanchayan@gmail.com>, shawn.guo@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Wednesday 20 May 2015 09:36:38 Stefan Agner wrote:
> On 2015-05-20 09:12, Arnd Bergmann wrote:
> > On Wednesday 20 May 2015 11:06:52 Sanchayan Maity wrote:
> >> Implements SoC bus support to export SoC specific information. Read
> >> the unique SoC ID from the Vybrid On Chip One Time Programmable
> >> (OCOTP) controller, SoC specific information from the Miscellaneous
> >> System Control Module (MSCM), revision from the ROM revision register
> >> and expose it via the SoC bus infrastructure.
> >>
> >> Sample Output:
> >>
> >> root@vf:/sys/devices/soc0# cat soc_id
> >> df63c12a2e2161d4
> >> root@vf:/sys/devices/soc0# cat family
> >> Freescale Vybrid VF500
> >> root@vf:/sys/devices/soc0# cat revision
> >> 00000013
> >> root@vf:/sys/devices/soc0# cat machine
> >> Freescale Vybrid
> >>
> > 
> > I would prefer to see this as a driver in drivers/soc that registers
> > to a platform device. Is there any DT node that would be a reasonable
> > device to bind to?
> 
> Hm, what is a viable device? Probably the most SoC specific device in
> the SoC? Currently, all three devices we read from do have a
> vf610-something compatible string, hence would be SoC specific (ocotp,
> ocrom and mscm-cpucfg). Probably the last is the most SoC specific...
> 
> But somehow bind to just a random device sounds wrong to me. Couldn't we
> add a more specific compatible string to the soc node and bind to that?

mscm-cpucfg by the name  sounds right to me, especially if we later
want to add some exported functions or configuration to the driver.

The other two (judging by the name without knowing anything
about them) seem like pure data areas that may also be shared with
other drivers and are better represented as syscon or eprom devices.

	Arnd
