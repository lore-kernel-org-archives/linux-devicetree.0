From: Tang Yuantian-B29983 <B29983@freescale.com>
Subject: RE: [v3] powerpc/mpc85xx: Update the clock device tree nodes
Date: Mon, 26 Aug 2013 02:42:30 +0000
Message-ID: <D07C73A334FF604B95B3CBD2A545D07B1503BE58@039-SN2MPN1-012.039d.mgd.msft.net>
References: <1370480811-13700-1-git-send-email-Yuantian.Tang@freescale.com>
 <20130823200827.GA29737@home.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20130823200827.GA29737@home.buserror.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Wood Scott-B07421 <B07421@freescale.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

> >
> >  	clockgen: global-utilities@e1000 {
> > -		compatible = "fsl,b4420-clockgen", "fsl,qoriq-clockgen-2.0";
> > +		compatible = "fsl,b4420-clockgen", "fsl,qoriq-clockgen-2.0",
> > +				   "fixed-clock";
> > +		clock-output-names = "sysclk";
> > +		#clock-cells = <0>;
> 
> Does U-Boot fill in clock-frequency here?
> 
Yes, clock-frequency will be filled by uboot.
You suggested we'd better not add it here.

> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		pll0: pll0@800 {
> > +			#clock-cells = <1>;
> > +			reg = <0x800>;
> > +			compatible = "fsl,core-pll-clock";
> > +			clocks = <&clockgen>;
> > +			clock-output-names = "pll0", "pll0-div2", "pll0-div4";
> > +		};
> > +		pll1: pll1@820 {
> > +			#clock-cells = <1>;
> > +			reg = <0x820>;
> > +			compatible = "fsl,core-pll-clock";
> > +			clocks = <&clockgen>;
> > +			clock-output-names = "pll1", "pll1-div2", "pll1-div4";
> > +		};
> 
> Please leave a blank line between properties and nodes, and between nodes.
> 
OK, will add.

> What does reg represent?  Where is the binding for this?
> 
> The compatible is too vague.
Reg is register offset. I should have had a binding document.
About the compatible, you should pointed it out earlier in SDK review.
It is too later to change since the clock driver is merged for months although 
I sent this patch first.
Besides, it is not too bad because other arch use the similar name.

Regards,
Yuantian

> 
> > +		mux0: mux0@0 {
> > +			#clock-cells = <0>;
> > +			reg = <0x0>;
> > +			compatible = "fsl,core-mux-clock";
> > +			clocks = <&pll0 0>, <&pll0 1>, <&pll0 2>,
> > +				 <&pll1 0>, <&pll1 1>, <&pll1 2>;
> > +			clock-names = "pll0_0", "pll0_1", "pll0_2",
> > +				"pll1_0", "pll1_1", "pll1_2";
> > +			clock-output-names = "cmux0";
> > +		};
> 
> What does reg represent?  Where is the binding for this?
> 
> The compatible is too vague.
> 
> -Scott
