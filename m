From: tomas.hlavacek@nic.cz
Subject: Re: [PATCH RFC] ARM: dts: add support for Turris Omnia
Date: Tue, 22 Nov 2016 22:59:51 +0100
Message-ID: <1479851991.26813.2@smtp.gmail.com>
References: <20161105203841.9661-1-uwe@kleine-koenig.org>
 <1479126185.15557.5@smtp.gmail.com>
 <20161114201640.rr32iyjf5a53v33t@perseus.defre.kleine-koenig.org>
 <20161114202832.GG24546@lunn.ch> <1479586147.10840.0@smtp.gmail.com>
 <20161120203037.pd5mhqyjeotileve@perseus.defre.kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161120203037.pd5mhqyjeotileve@perseus.defre.kleine-koenig.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, marex@denx.de, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Uwe!

On Sun, Nov 20, 2016 at 9:30 PM, Uwe Kleine-K=F6nig =

<uwe@kleine-koenig.org> wrote:
> Hello Tomas,
> =

> On Sat, Nov 19, 2016 at 09:09:07PM +0100, tomas.hlavacek@nic.cz wrote:
>>  On Mon, Nov 14, 2016 at 9:28 PM, Andrew Lunn <andrew@lunn.ch> wrote:
>>  > Interrupts don't seem to work very well with the nxp,pca9538. =

>> Which
>>  > is probably why it is disabled by default.
>> =

>>  I was thinking about this issue and I can remember that there was =

>> an earlier
>>  prototype that had a shared interrupt line from PHY (88E1514) and =

>> from the
>>  PCA9538. In this case we needed to specifically disable the =

>> interrupt of the
>>  PHY to release the interrupt line (which needed a hack into PHY =

>> driver
>>  code). The IRQ from PHY is connected as an ordinary input to =

>> PCA9538 in
>>  later board prototype. And the same holds for the production =

>> version.
> =

> That would explain why I see an "irq but nobody cared" message when
> booting the original system.
> =

> This isn't the problem I meant though. When adding interrupt-parent =3D
> <&pcawan>; interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>; to the phy node I get =

> an
> error saying that there is no irq domain associated with this device.
> =

>>  Do you have CZ11NIC13 or older board revision?
> =

> CZ11NIC12 is indicated on my board.

:-( Well, this board version has wrongly matched length of some =

differential pairs, IRQ from 88E1514 is connected differently, there =

are slight differences in power supplies and (if I am not mistaken) =

something changed in RTC support circuitry. It looks like a huge =

mistake on our side.

Anyway I took your patch and tried few things:
- clean up comments
- add pca9538 interrupt-controller
- remove rtc disable (WFM with CZ11NIC13, which is the production board)
- add MBUS mem regions for CESA
- add IRQ for 88E1514 PHY - and there is a problem:

It seems that libphy is probed before pca9538 and we end up with:
[    4.217550] libphy: orion_mdio_bus: probed
[    4.221777] irq: no irq domain found for =

/soc/internal-regs/i2c@11000/i2cmux@70/i2c@7/gpio@71 !

Any clue where to look in order to defer probing libphy or at least =

orion_mdio_bus?

I'll post my version of the patch without the PHY IRQ (therefore =

polling will kick in).

Thanks,
Tomas
