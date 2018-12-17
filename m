From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 3/7] phy: add A3700 COMPHY support
Date: Mon, 17 Dec 2018 16:56:03 +0100
Message-ID: <20181217165603.602a7a42@xps13>
References: <20181213083908.14180-1-miquel.raynal@bootlin.com>
        <20181213083908.14180-4-miquel.raynal@bootlin.com>
        <20181217164857.68df3f84@xps13>
        <20181217165223.6f98b8a4@windsurf>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217165223.6f98b8a4@windsurf>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Evan Wang <xswang@marvell.com>
List-Id: devicetree@vger.kernel.org

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote on Mon, 17 Dec
2018 16:52:23 +0100:

> Hello,
> 
> On Mon, 17 Dec 2018 16:48:57 +0100, Miquel Raynal wrote:
> 
> > I received the following bug report because I added a dependency on
> > COMPILE_TEST in Kconfig:
> > 
> >         config: i386-allmodconfig (attached as .config) compiler:
> >         gcc-7 (Debian 7.3.0-1) 7.3.0 reproduce:
> >                 # save the attached .config to linux build tree
> >                 make ARCH=i386 
> > 
> >         All errors (new ones prefixed by >>):
> >   
> >         >> ERROR: "__arm_smccc_smc" [drivers/phy/marvell/phy-mvebu-a3700-comphy.ko] undefined!      
> > 
> > Unless someone complains, I will drop the dependency on COMPILE_TEST in
> > Kconfig.  
> 
> Keep COMPILE_TEST, and add:
> 
> 	depends on HAVE_ARM_SMCCC
> 
> perhaps ?

Oh that's a cool Kconfig entry. Forgot about it, thanks for the
pointer!


Thanks,
Miquèl
