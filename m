From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH v1 16/19] arm: dts: mt7623: fixup available memory size
 on bananapi-r2
Date: Sat, 3 Mar 2018 07:27:09 +0800
Message-ID: <1520033229.8089.198.camel@mtkswgap22>
References: <cover.1519378871.git.sean.wang@mediatek.com>
         <e49485aac14bec85c14514c1953f8d7ea5401695.1519378872.git.sean.wang@mediatek.com>
         <20180302154215.xr3b2zlmuojw5i6l@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180302154215.xr3b2zlmuojw5i6l@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2018-03-02 at 09:42 -0600, Rob Herring wrote:
> On Fri, Feb 23, 2018 at 06:16:36PM +0800, sean.wang@mediatek.com wrote:
> > From: Sean Wang <sean.wang@mediatek.com>
> > 
> > There is 2GB DDR3 available on bananapi-r2 board as [1] specified.
> > 
> > [1] http://www.banana-pi.org/r2.html
> > 
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> >  arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> > index 140ff78..3e8d02c 100644
> > --- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> > +++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> > @@ -38,6 +38,11 @@
> >  			default-state = "off";
> >  		};
> >  	};
> > +
> > +	memory {
> 
> Unit address?
> 

If I did it with adding unit address

-       memory {
+       memory@80000000 {
                device_type = "memory";
                reg = <0 0x80000000 0 0x80000000>;
        };


bad dtc blob is being generated and contains two memory nodes, one is
memory and the other is memory@80000000 whose blob disassembly detail is
as the following.

      memory {
                device_type = "memory";
                reg = <0x0 0x0 0x0 0x0>;
        };



      memory@80000000 {
                device_type = "memory";
                reg = <0x0 0x80000000 0x0 0x80000000>;
        };


and bad memory node with size 0 would cause the boot fails.


is it a dtc compiler problem ?

> > +		device_type = "memory";
> > +		reg = <0 0x80000000 0 0x80000000>;
> > +	};
> >  };
> >  
> >  &afe {
> > -- 
> > 2.7.4
> > 
