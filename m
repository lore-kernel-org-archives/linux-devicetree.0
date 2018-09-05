From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 00/11] mscc: ocelot: add support for SerDes muxing
 configuration
Date: Wed, 5 Sep 2018 11:07:50 +0200
Message-ID: <20180905090750.GM13888@piout.net>
References: <20180903093308.24366-1-quentin.schulz@bootlin.com>
 <20180903133415.GF4445@lunn.ch>
 <20180903134522.GC13888@piout.net>
 <20180903.220910.899357653888940454.davem@davemloft.net>
 <20180904151653.GI13888@piout.net>
 <20180904161028.nh5ejrtj22r5az5e@pburton-laptop>
 <20180904180006.d5th3jrbhr4vtahi@qschulz>
 <20180904230351.vwlq2s7joulvqw2i@pburton-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180904230351.vwlq2s7joulvqw2i@pburton-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@mips.com>
Cc: Quentin Schulz <quentin.schulz@bootlin.com>, David Miller <davem@davemloft.net>, andrew@lunn.ch, ralf@linux-mips.org, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, kishon@ti.com, f.fainelli@gmail.com, allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

On 04/09/2018 16:03:51-0700, Paul Burton wrote:
> Well, it sounded like David is OK with this all going through the MIPS
> tree, though we'd need an ack for the PHY parts.
> 
> Alternatively I'd be happy for the DT changes to go through the net-next
> tree, which may make more sense given that the .dts changes are pretty
> trivial in comparison with the driver changes. If David wants to do that
> then for patches 1 & 8:
> 
>     Acked-by: Paul Burton <paul.burton@mips.com>
> 
> Either way there may be conflicts for ocelot.dtsi when it comes to
> merging to master, but they should be simple to resolve. It seems
> Wolfram already took your DT changes for I2C so there's probably going
> to be multiple trees updating that file this cycle already anyway.
> 

Actually, I think Wolfram meant that he took the bindings so you can
take the DT patches for i2c.

> Ideally I'd say "don't break bisection" but that's sort of a separate
> issue here since even if you restructure your series to do that it would
> still need to go through one tree. For example you could adjust
> mscc_ocelot_probe() to handle either the reg property or the syscon,
> then adjust the DT to use the syscon, then remove the code dealing with
> the reg property, and I'd consider that a good idea anyway but it would
> still probably all need to go through one tree to make sure things get
> merged in the right order & avoid breaking bisection.
> 

I don't really think bisection is important at this stage but if you
don't want to break it, then I guess it makes more sense to have the
whole series through net.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
