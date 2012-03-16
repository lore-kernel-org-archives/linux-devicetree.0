From: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v4] ARM: SPEAr600: Add device-tree support to SPEAr600
 boards
Date: Fri, 16 Mar 2012 13:34:11 +0100
Message-ID: <201203161334.11377.sr@denx.de>
References: <1331890216-8361-1-git-send-email-sr@denx.de>
 <201203161214.35929.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201203161214.35929.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 16 March 2012 13:14:35 Arnd Bergmann wrote:
> On Friday 16 March 2012, Stefan Roese wrote:
> > v4:
> > - Added memory node to all dts/dtsi files
> > - Reorganizes bus topology in the dtsi file, to match the
> > 
> >   real SoC layout
> 
> Looks good.
> 
> > +
> > +	ahb {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		compatible = "simple-bus";
> > +		ranges;
> > +
> > +		vic0: interrupt-controller@f1100000 {
> > +			compatible = "arm,pl190-vic";
> > +			interrupt-controller;
> > +			reg = <0xf1100000 0x1000>;
> > +			#interrupt-cells = <1>;
> > +		};
> > +
> > ...
> > +		apb {
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			compatible = "simple-bus";
> > +			ranges;
> > +
> > +			serial@d0000000 {
> > +				compatible = "arm,pl011", "arm,primecell";
> > +				reg = <0xd0000000 0x1000>;
> > +				interrupt-parent = <&vic0>;
> > +				interrupts = <24>;
> > +			};
> > ...
> > +		};
> > +	};
> > +};
> 
> I would prefer to see non-empty ranges properties here. I expected the
> buses to be contiguous address ranges per bus, but apparently that
> is not the case -- you have 0xd... and 0xf... on both of them.

Yes, Its quite ugly.
 
> The simplest ranges property would be to have in the ahb node:
> 
> 	ranges = <0xd0000000 0xd0000000 0x30000000>;
> 
> Which just means that the bus is limited to those addresses (if that is
> indeed the case -- I don't know much about ahb and apb).

Okay, I'll add those ranges. Even though I personally don't find it more 
descriptive this way.

Thanks,
Stefan
