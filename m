From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: ls1088a: add fsl-mc hardware resource
 manager node
Date: Fri, 17 Nov 2017 20:35:32 +0800
Message-ID: <20171117123530.GA25390@dragon>
References: <1510147805-24873-1-git-send-email-ioana.ciornei@nxp.com>
 <20171116083920.GK25384@dragon>
 <DB6PR0401MB2264A182C4048471B53BFF89E02E0@DB6PR0401MB2264.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <DB6PR0401MB2264A182C4048471B53BFF89E02E0-2mNvjAGDOPl4towakvZX7o3W/0Ik+aLCnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ioana Ciornei <ioana.ciornei-3arQi8VN3Tc@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 16, 2017 at 02:24:49PM +0000, Ioana Ciornei wrote:
...
> > > +	fsl_mc: fsl-mc@80c000000 {
> > 
> > The unit-address of the node should be somehow related to 'reg'
> > property.  Can you please help me understand how they are related?
> 
> The unit-address of the fsl-mc node is the base address of the MC portal described in the first region of the 'reg' property and formed using the 2 address cells.
> Hope this helps.

Ah, sorry, I forgot that the address-cells is 2.

>  
> > 
> > > +		compatible = "fsl,qoriq-mc";
> > > +		reg = <0x00000008 0x0c000000 0 0x40>,	 /* MC portal base */
> > > +		      <0x00000000 0x08340000 0 0x40000>; /* MC control reg */
> > > +		msi-parent = <&its>;
> > > +		#address-cells = <3>;
> > > +		#size-cells = <1>;
> > > +
> > > +		/*
> > > +		 * Region type 0x0 - MC portals
> > > +		 * Region type 0x1 - QBMAN portals
> > > +		 */
> > > +		ranges = <0x0 0x0 0x0 0x8 0x0c000000 0x4000000
> > > +			  0x1 0x0 0x0 0x8 0x18000000 0x8000000>;
> > > +
> > > +		dpmacs {
> > > +			#address-cells = <1>;
> > > +			#size-cells = <0>;
> > > +
> > > +			dpmac1: dpmac@1 {
> > > +				compatible = "fsl,qoriq-mc-dpmac";
> > > +				reg = <1>;
> > > +			};
> > 
> > Please have a newline in between nodes.
> 
> Will do. 
> 
> Should I send a rework of this patch right away or better to wait for the merge window to close?

Either way is fine, as I will rebase my branch to v4.15-rc1 after merge
window closes.

> > > +			dpmac2: dpmac@2 {
> > > +				compatible = "fsl,qoriq-mc-dpmac";
> > > +				reg = <2>;
> > > +			};
> > > +			dpmac3: dpmac@3 {
> > > +				compatible = "fsl,qoriq-mc-dpmac";
> > > +				reg = <3>;
> > > +			};
> > > +			dpmac4: dpmac@4 {
> > > +				compatible = "fsl,qoriq-mc-dpmac";
> > > +				reg = <4>;
> > > +			};
> > > +			dpmac5: dpmac@5 {
> > > +				compatible = "fsl,qoriq-mc-dpmac";
> > > +				reg = <5>;
> > > +			};
> > > +			dpmac6: dpmac@6 {
> > > +				compatible = "fsl,qoriq-mc-dpmac";
> > > +				reg = <6>;
> > > +			};
> > > +			dpmac7: dpmac@7 {
> > > +				compatible = "fsl,qoriq-mc-dpmac";
> > > +				reg = <7>;
> > > +			};
> > > +			dpmac8: dpmac@8 {
> > > +				compatible = "fsl,qoriq-mc-dpmac";
> > > +				reg = <8>;
> > > +			};
> > > +			dpmac9: dpmac@9 {
> > > +				compatible = "fsl,qoriq-mc-dpmac";
> > > +				reg = <9>;
> > > +			};
> > > +			dpmac10: dpmac@10 {

Just noticed this - the unit-address should be hex number, so it should
be dpmac@a rather than dpmac@10, I think.

Shawn

> > > +				compatible = "fsl,qoriq-mc-dpmac";
> > > +				reg = <0xa>;
> > > +			};
> > > +		};
> > > +	};
> > > +
> > >  	psci {
> > >  		compatible = "arm,psci-0.2";
> > >  		method = "smc";
> > > --
> > > 1.9.1
> > >
> > >
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
