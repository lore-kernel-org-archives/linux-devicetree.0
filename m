From: Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Subject: Re: [PATCH RFC] ARM64: dts: marvell: Add DTS file for Turris Mox
Date: Mon, 21 Jan 2019 14:12:54 +0100
Message-ID: <20190121141254.3208d949@dellmb.labs.office.nic.cz>
References: <20181113134408.5681-1-marek.behun@nic.cz>
        <87lg3im3t4.fsf@FE-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87lg3im3t4.fsf@FE-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 18 Jan 2019 15:35:35 +0100
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> > The basic module can be extended by different modules.
> > When those modules are connected, U-Boot has to let kernel know via
> > device-tree. Since modules can be connected in different order and
> > some modules can be connected multiple times (up to three 8-port
> > switch modules can be connected), using dtb overlays would result in
> > too files.  
> 
> What do you mean by too many files?
> 
> The dtb overlays seems really matches your situation.
> Usually we have one dtb part by module and then we mix them together.
> 
> Gregory

Hi Gregory,

the problem is that in some cases here some even if you have the same
module, some parameters have to be different depending on which
position the module is in the topology and what type of module is
before it.

For example up to three switch modules can be connected one after
another, and although physically they are the same, their dtb
parameters (MDIO address and whether they are connected to CPU or
another switch module) are different. So if I wanter to use overlays
without dtb modification from u-boot, I would have to have three
overlays for Peridot module, for topologies:
  peridot
  peridot-peridot
  peridot-peridot-peridot

three for Topaz module:
  topaz
  peridot-topaz
  peridot-peridot-topaz

and four for SFP module:
  sfp
  peridot-sfp
  peridot-peridot-sfp
  peridot-peridot-peridot-sfp

For the PCIe and USB module this is not the case, only one overlay for
each. But I thought (and still think) that in this case it is more
elegant to just enable the modules in U-Boot than to use so many
different overlays. And since I already thought up this solution for
SFP and switch modules, I used it for the PCIe and USB modules as well,
instead of mixing overlays there.

I am of course willing to rewrite this to use overlays, if you guys are
unwilling to merge it done this way, but I think this solution is
better.

Also, I would like to have the dts definitions for all modules
officially supported by Mox to have in the kernel, and if this was done
via overlays, it would not be merged, or am I wrong? Are there overlay
dts sources for some device in the kernel?

Marek
