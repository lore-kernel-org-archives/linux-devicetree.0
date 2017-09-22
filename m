From: Miquel RAYNAL <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: marvell: Enable Armada-8040-DB CPS SPI1
Date: Fri, 22 Sep 2017 14:47:49 +0200
Message-ID: <20170922144749.6b2aaa76@xps13>
References: <20170921073643.5677-1-miquel.raynal@free-electrons.com>
        <20170921075239.GE3568@kwain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170921075239.GE3568@kwain>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Christine Gharzuzi <chrisg-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Antoine,

On Thu, 21 Sep 2017 09:52:39 +0200
Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hi Miquel,
> 
> On Thu, Sep 21, 2017 at 09:36:43AM +0200, Miquel Raynal wrote:
> > From: Christine Gharzuzi <chrisg-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > +&cps_spi1 {
> > +	status = "okay";
> > +
> > +	spi-flash@0 {
> > +		#address-cells = <0x1>;
> > +		#size-cells = <0x1>;
> > +		compatible = "jedec,spi-nor";
> > +		reg = <0x0>;
> > +		spi-max-frequency = <20000000>;
> > +
> > +		partitions {
> > +			compatible = "fixed-partitions";
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +
> > +			partition@0 {
> > +				label = "Boot";
> > +				reg = <0x0 0x200000>;
> > +			};
> > +			partition@200000 {
> > +				label = "Filesystem";
> > +				reg = <0x200000 0xd00000>;
> > +			};
> > +			partition@d00000 {  
> 
> The node should be 'partition@f00000'.

Absolutely, thanks for poiting it!

Regards,
Miquèl

> 
> > +				label = "Boot_2nd";
> > +				reg = <0xf00000 0x100000>;
> > +			};
> > +		};
> > +	};
> > +};  
> 
> Thanks,
> Antoine
> 



-- 
Miquel Raynal, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
