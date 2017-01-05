From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCHv2 0/5] Support for Marvell switches with integrated CPUs
Date: Thu, 5 Jan 2017 11:52:12 -0800
Message-ID: <5f93b0ad-0d45-1d9a-521b-581074dcd465@gmail.com>
References: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
 <6c6795d3-06ab-a4f0-78ad-5ecc78c1aa2f@gmail.com>
 <185147a37cab4d7eaea5f79d86cc9451@svr-chch-ex1.atlnz.lc>
 <20170105130945.GA18033@lunn.ch>
 <059c78eaa7dd40c9a46cb08616bae2eb@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <059c78eaa7dd40c9a46cb08616bae2eb@svr-chch-ex1.atlnz.lc>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Juri Lelli <juri.lelli@arm.com>, Russell King <linux@armlinux.org.uk>, Thierry Reding <treding@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Kalyan Kinthada <Kalyan.Kinthada@alliedtelesis.co.nz>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vge>
List-Id: devicetree@vger.kernel.org

On 01/05/2017 11:46 AM, Chris Packham wrote:
> On 06/01/17 02:10, Andrew Lunn wrote:
>>> I'd love to see a switchdev driver but it's a huge task (and no I'm not
>>> committing to writing it). As it stands Marvell ship a switch SDK
>>> largely executes in userspace with a small kernel module providing some
>>> linkage to the underlying hardware.
>>
>> Is there any similarity to the mv88e6xxx family?
>>
>> If it was similar registers, just a different access mechanising, we
>> could probably extend the mv88e6xxx to support MMIO as well as MDIO.
> 
> No the prestera family of devices are considerably more powerful (and 
> complex) than the linkstreet devices.

I see, we have a similar situation with some of the Broadcom SoCs, the
BCM534xx/BCM5334x have a completely different integrated switching
engine that is not roboswitch compatible.

Thanks for the information, this is still valuable to have this
supported upstream.
-- 
Florian
