From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3] ARM: SPEAr600: Add device-tree support to SPEAr600
 boards
Date: Thu, 15 Mar 2012 11:40:27 +0000
Message-ID: <201203151140.27453.arnd@arndb.de>
References: <1331808632-22585-1-git-send-email-sr@denx.de>
 <4F61CC81.1020902@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4F61CC81.1020902@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Viresh Kumar <viresh.kumar@st.com>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Stefan Roese <sr@denx.de>, "devicetree-discuss@ozlabs.org" <devicetree-discuss@ozlabs.org>, spear-devel <spear-devel@list.st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thursday 15 March 2012, Viresh Kumar wrote:
> On 3/15/2012 4:20 PM, Stefan Roese wrote:
> 
> > diff --git a/arch/arm/boot/dts/spear600.dtsi b/arch/arm/boot/dts/spear600.dtsi
> 
> > +/ {
> > +       compatible = "st,spear600";
> > +
> > +       cpus {
> > +               cpu@0 {
> > +                       compatible = "arm,arm926ejs";
> > +               };
> > +       };
> > +
> > +       memory {
> > +               device_type = "memory";
> > +               reg = <0 0x40000000>; /* Real value updated by U-Boot */
> > +       };
> > +
> > +       ahb {
> 
> What is the significance of this name? As i see gpio/spi etc in this list,
> which are on apb bus.

That sounds like it should be corrected, the device tree should reflect
the physical hierarchy where possible, e.g.

	ahb0 {
		#address-cells = <1>;
		#size-cells = <1>;
		compatible = "simple-bus";
		ranges = <0xe0000000 0xe0000000 0x10000000>;

		ethernet@e0800000 {
			...
		};

		...
	};

	ahb1 {
		#address-cells = <1>;
		#size-cells = <1>;
		compatible = "simple-bus";
		ranges = <0xd0000000 0xd0000000 0x10000000>;
		ranges = <0xf0000000 0xf0000000 0x10000000>;

		apb {
			#address-cells = <1>;
			#size-cells = <1>;
			compatible = "simple-bus";
			ranges = <0x0 0xf0000000 0x10000000>;
	
			gpio@f0100000 {
				/* note: reg relative to local ranges property */
				reg = <0x100000 0x1000>;
				...
			};
			...
		};
		...


               i2c@d0200000 {
                        reg = <0xd0200000 0x1000>;
			...
               };

	};

I don't have the data sheet, so the bus hierarchy above is completely made up,
but I guess you get the idea. If each bus has its own local register range, it
may be helpful to use the ranges property to remap the reg properties in the
way that I did in the apb example above.

	Arnd
