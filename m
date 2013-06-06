From: "J, KEERTHY" <j-keerthy@ti.com>
Subject: RE: [PATCH v2] mfd: DT bindings for the palmas family MFD
Date: Thu, 6 Jun 2013 03:34:19 +0000
Message-ID: <DC88CAD03C0052499C1907B327FC63229EA0E9@DBDE04.ent.ti.com>
References: <1370335309-6319-1-git-send-email-j-keerthy@ti.com>
 <51AF71CA.8060808@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51AF71CA.8060808@wwwdotorg.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "wim@iguana.be" <wim@iguana.be>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "Kristo, Tero" <t-kristo@ti.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, Ian Lartey <ian@slimlogic.co.uk>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

Thanks for the quick review.

> -----Original Message-----
> From: Stephen Warren [mailto:swarren@wwwdotorg.org]
> Sent: Wednesday, June 05, 2013 10:44 PM
> To: J, KEERTHY
> Cc: linux-kernel@vger.kernel.org; linux-doc@vger.kernel.org;
> devicetree-discuss@lists.ozlabs.org;
> broonie@opensource.wolfsonmicro.com; rob.herring@calxeda.com;
> rob@landley.net; sameo@linux.intel.com; wim@iguana.be;
> lgirdwood@gmail.com; gg@slimlogic.co.uk; Kristo, Tero;
> lee.jones@linaro.org; Ian Lartey
> Subject: Re: [PATCH v2] mfd: DT bindings for the palmas family MFD
> 
> On 06/04/2013 02:41 AM, J Keerthy wrote:
> > From: Graeme Gregory <gg@slimlogic.co.uk>
> >
> > Add the various binding files for the palmas family of chips. There
> is
> > a top level MFD binding then a seperate binding for regulators IP
> blocks on chips.
> 
> > diff --git a/Documentation/devicetree/bindings/mfd/palmas.txt
> > b/Documentation/devicetree/bindings/mfd/palmas.txt
> 
> > +Optional properties:
> > +  ti,mux_padX : set the pad register X (1-2) to the correct muxing
> for the
> > +  		hardware, if not set will use muxing in OTP.
> > +
> > +Example:
> ...
> > +	ti,mux-pad1 = <0>;
> > +	ti,mux-pad2 = <0>;
> 
> Use of - vs. _ is inconsistent there. It should be -.
> 

Oops. I will fix this.

> > diff --git
> > a/Documentation/devicetree/bindings/regulator/palmas-pmic.txt
> > b/Documentation/devicetree/bindings/regulator/palmas-pmic.txt
> 
> > +Optional nodes:
> > +- regulators : should contain the constrains and init information
> for the
> > +	       regulators. It should contain a subnode per regulator from
> the
> > +	       list.
> 
> I would re-phrase that as:
> 
> Must contain a sub-node per regulator from the list below. Each sub-
> node should contain the constraints and initialization information for
> that regulator. See regulator.txt for a description of standard
> properties for these sub-nodes. Additional custom properties  are
> listed below.
> 
> > +	       For ti,palmas-pmic - smps12, smps123, smps3 depending on
> OTP,
> > +	       smps45, smps457, smps7 depending on varient, smps6,
> > +smps[8-10],
> 
> typo: s/varient/variant/.

I will fix this.

> 
> > +	       ldo[1-9], ldoln, ldousb
> 
> nit: s/$/./ ?
> 

Ok.

> > +
> > +	       optional chip specific regulator fields :-
> 
> Perhaps "Optional sub-node properties:"?

Ok.

> 
> > +pmic {
> > +	compatible = "ti,twl6035-pmic", "ti,palmas-pmic";
> > +	interrupt-parent = <&palmas>;
> > +	interrupts = <14 IRQ_TYPE_NONE>;
> > +	interrupt-name = "short-irq";
> 
> If those are required, shouldn't they be listed in a "Required
> properties" section above? In particular, the order of entries in the
> interrupts property must be defined, as well as the expected nameds in
> the interrupt-name property.
> 
> Oh, and it's interrupt-names not interrupt-name.

Ok.

> 
> Oh, one question though: How does the regulator driver determine the
> register address of the regulator sub-device within the overall PMIC?
> Presumably if these are pluggable independent modules, that could
> change depending on which overall chip the PMIC device is plugged into.
> don't you need a reg property to specify that?

The variants have identical register addresses. These are not pluggable
Independent modules. All the variants come with all the regulators
Listed above in general. The driver today has a statically defined
Array of all the above mentioned regulators with their addresses.
 
drivers/regulator/palmas-regulator.c

Line 38.

> 
> Aside from those comments, this all looks reasonable to me.

Once again thanks for the comprehensive feedback.

Regards,
Keerthy
