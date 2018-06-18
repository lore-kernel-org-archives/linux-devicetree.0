From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH linux-next v5 07/13] dt-bindings: mfd: Add a document for
 PECI client mfd
Date: Mon, 18 Jun 2018 07:03:06 +0100
Message-ID: <20180618060306.GD31141@dell>
References: <20180601182216.23894-1-jae.hyun.yoo@linux.intel.com>
 <20180613061637.GI5278@dell>
 <2b5bbf01-8c9c-bb06-4559-00dae61d95de@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2b5bbf01-8c9c-bb06-4559-00dae61d95de@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, James Feist <james.feist@linux.intel.com>, Jason M Biils <jason.m.bills@linux.intel.com>, Joel Stanley <joel@jms.id.au>, Vernon Mauery <vernon.mauery@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Thu, 14 Jun 2018, Jae Hyun Yoo wrote:

[...]

> > > +Example:
> > > +	peci-bus@0 {
> > 
> > 0?
> > 
> 
> Because the actual reg value of the peci bus is reg = <0x0 0x60> but
> anyway it's an example.
> 
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > 
> > No 'reg' property?

0 is fine, but you really should have a 'reg' property.

> This is the actual peci bus node which is a parent of this MFD node:
> 	peci0: peci-bus@0 {
> 		compatible = "aspeed,ast2500-peci";
> 		reg = <0x0 0x60>;
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 		interrupts = <15>;
> 		clocks = <&syscon ASPEED_CLK_GATE_REFCLK>;
> 		resets = <&syscon ASPEED_RESET_PECI>;
> 		clock-frequency = <24000000>;
> 		msg-timing = <1>;
> 		addr-timing = <1>;
> 		rd-sampling-point = <8>;
> 		cmd-timeout-ms = <1000>;
> 	};
> 
> > > +		< more properties >
> > 
> > Remove this.
> 
> I dropped all other properties into < more properties > because I want
> to show the #address-cells and #size-cells to state its sub-nodes
> should have a single unique reg value. Should I remove this line or the
> whole parent node?

Just drop the properties which are unimportant for the example.  You
do not need to replace them with anything, especially with a non-DT
compliant string.

> > > +		peci-client@30 {
> > > +			compatible = "intel,peci-client", "simple-mfd";
> > > +			reg = <0x30>;
> > > +		};
> > > +
> > > +		peci-client@31 {
> > > +			compatible = "intel,peci-client", "simple-mfd";
> > > +			reg = <0x31>;
> > > +		};
> > > +	};
> > 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
