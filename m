From: tomas.hlavacek@nic.cz
Subject: Re: [PATCH RFC] ARM: dts: add support for Turris Omnia
Date: Wed, 23 Nov 2016 23:45:20 +0100
Message-ID: <1479941120.10840.13@smtp.gmail.com>
References: <20161105203841.9661-1-uwe@kleine-koenig.org>
 <1479126185.15557.5@smtp.gmail.com>
 <20161114201640.rr32iyjf5a53v33t@perseus.defre.kleine-koenig.org>
 <20161114202832.GG24546@lunn.ch> <1479586147.10840.0@smtp.gmail.com>
 <20161120203037.pd5mhqyjeotileve@perseus.defre.kleine-koenig.org>
 <1479851991.26813.2@smtp.gmail.com> <20161123145916.GL14947@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161123145916.GL14947@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, marex@denx.de, Jason Cooper <jason@lakedaemon.net>, Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Andrew!

On Wed, Nov 23, 2016 at 3:59 PM, Andrew Lunn <andrew@lunn.ch> wrote:
>>  >CZ11NIC12 is indicated on my board.
>> 
>>  :-( Well, this board version has wrongly matched length of some
>>  differential pairs, IRQ from 88E1514 is connected differently, there
>>  are slight differences in power supplies and (if I am not mistaken)
>>  something changed in RTC support circuitry. It looks like a huge
>>  mistake on our side.
> 
> Hi Tomas
> 
> Would these problems also explain why the Ethernet links to the switch
> don't work? Maybe the differential pairs?

I do not think so. The ethernet links to the switch are RGMII, not 
differential pairs. Differential pair is used only for the eth2 to link 
either SFP+ or 88E1514 (via a high-speed switch that selects one or 
another). So the problems with differential pairs affect only WAN 
interface.

> 
> 
>>  It seems that libphy is probed before pca9538 and we end up with:
>>  [    4.217550] libphy: orion_mdio_bus: probed
>>  [    4.221777] irq: no irq domain found for
>>  /soc/internal-regs/i2c@11000/i2cmux@70/i2c@7/gpio@71 !
>> 
>>  Any clue where to look in order to defer probing libphy or at least
>>  orion_mdio_bus?
> 
> I think there is a known phylib problem here. Somewhere in the call
> chain there is a void function, so the EPROBE_DEFFER gets
> discarded. But i could be remembering this wrongly.

Oh yes, I thought that and I tried to find exactly this type of problem 
yesterday, but I didn't succeed. But I think that we agreed that we are 
going to stick with PHY polling rather then experimenting with 
unreliable IRQ over the GPIO expander, so we can leave this unresolved.

I will look into the I2C mux concerns, fix the remaining comments 
regarding my version and test RTC more extensively - Uwe's board is 
still not ticking, mine does, so we have to rule out that it is a 
common problem.

Tomas
