From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCHv2 0/5] Support for Marvell switches with integrated CPUs
Date: Thu, 5 Jan 2017 04:24:21 +0000
Message-ID: <185147a37cab4d7eaea5f79d86cc9451@svr-chch-ex1.atlnz.lc>
References: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
 <6c6795d3-06ab-a4f0-78ad-5ecc78c1aa2f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Juri Lelli <juri.lelli@arm.com>, Russell King <linux@armlinux.org.uk>, Thierry Reding <treding@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Kalyan Kinthada <Kalyan.Kinthada@alliedtelesis.co.nz>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 05/01/17 17:07, Florian Fainelli wrote:
> Le 01/04/17 =E0 19:36, Chris Packham a =E9crit :
>> The 98DX3236, 98DX3336 and 98DX4251 are a set of switch ASICs with
>> integrated CPUs. They CPU block is common within these product lines and
>> (as far as I can tell/have been told) is based on the Armada XP. There
>> are a few differences due to the fact they have to squeeze the CPU into
>> the same package as the switch.
>
> It's really great to see these changes, do you have a plan to also add
> support for the integrated switch using a DSA/switchdev driver?

I'd love to see a switchdev driver but it's a huge task (and no I'm not =

committing to writing it). As it stands Marvell ship a switch SDK =

largely executes in userspace with a small kernel module providing some =

linkage to the underlying hardware.

We (a few of us here at Allied Telesis NZ) have discussed switchdev and =

how we get from using Marvell's SDK in our products to using switchdev =

proper.

The first step would probably be some kind of trampoline driver which =

communicates with a userspace helper to do the actual work. =

Alternatively there is some support in Marvell's SDK for compilation as =

a binary blob so a proprietary kernel module is another option. Neither =

of these are particularly nice in a free software world.

A full "free" implementation would be a large undertaking. Ideally I'd =

like to see Marvell involved with producing one but so far they've not =

been interested whenever I've brought it up.
