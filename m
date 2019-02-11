From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 1/2] arm64: dts: marvell: mcbin: Adding SPI-NOR Flash
 Config
Date: Mon, 11 Feb 2019 17:31:55 +0000
Message-ID: <20190211173155.azppt37uvsd6rn2w@shell.armlinux.org.uk>
References: <20190211171401.434-1-alex@asyring.de>
 <3040714f-471c-6773-57dd-455e7d1f195c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3040714f-471c-6773-57dd-455e7d1f195c@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Alexander Syring <alex@asyring.de>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 11, 2019 at 05:27:37PM +0000, Marc Zyngier wrote:
> On 11/02/2019 17:14, Alexander Syring wrote:
> > According to U-Boot dts file enabling the SPI-NOR flash for use in
> > Linux
> > 
> > Signed-off-by: Alexander Syring <alex@asyring.de>
> > ---
> >  .../boot/dts/marvell/armada-8040-mcbin.dtsi   | 23 +++++++++++++++----
> >  1 file changed, 18 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> > index 329f8ceeebea..83994ff46e2d 100644
> > --- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> > +++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> > @@ -333,11 +333,24 @@
> >  	status = "okay";
> >  
> >  	spi-flash@0 {
> > -		compatible = "st,w25q32";
> > -		spi-max-frequency = <50000000>;
> > -		reg = <0>;
> > -	};
> > -};
> > +		compatible = "st,w25q32", "jedec,spi-nor";
> > +		reg = <0>;
> > +		spi-max-frequency = <50000000>;
> > +
> > +		partitions {
> > +			compatible = "fixed-partitions";
> > +
> > +			partition@0 {
> > +				label = "U-Boot";
> > +				reg = <0 0x200000>;
> > +			};
> > +			partition@400000 {
> > +				label = "U-Boot Env";
> > +				reg = <0x200000 0xce0000>;
> > +			};
> > +		};
> > +	};
> > +};
> >  
> >  &cp1_usb3_0 {
> >  	/* CPS Lane 2 - CON7 */
> > 
> 
> Really?
> 
> My mcbin SPI flash doesn't have this partitioning, and doesn't have
> u-boot at all. This should be provided by the bootloader itself, and not
> baked into the reference DT.

Exactly.

Simple solution for the above.  Instead of the above, create
/etc/fw_env.config with:

/dev/mtdblock0 0x200000 0x10000

Then its possible to read and write the u-boot environment using
fw_printenv and fw_setenv.  No partitions are required, and IMHO
are pointless for such a scenario.

That will allow those of us with a different SPI flash layout and
already have this in /etc/fw_env.config:

/dev/mtdblock0 0x3f0000 0x10000

to not experience any breakage.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
