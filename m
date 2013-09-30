From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] Device Tree bindings for DSP clusters and DSP CPUs
Date: Mon, 30 Sep 2013 18:07:54 +0100
Message-ID: <20130930170754.GF22259@e106331-lin.cambridge.arm.com>
References: <1377076830-24223-1-git-send-email-poonam.aggrwal@freescale.com>
 <ACB6D0C0104CFF42A45A5D82A0DD4F3D1522E0F0@039-SN2MPN1-013.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ACB6D0C0104CFF42A45A5D82A0DD4F3D1522E0F0-RL0Hj/+nBVDYdknt8GnhQq4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aggrwal Poonam-B10812 <B10812-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 30, 2013 at 02:36:41PM +0100, Aggrwal Poonam-B10812 wrote:
> Please provide your feedback on this.
> 
> Regards
> Poonam
> 
> > -----Original Message-----
> > From: Aggrwal Poonam-B10812
> > Sent: Wednesday, August 21, 2013 2:51 PM
> > To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Cc: Aggrwal Poonam-B10812
> > Subject: [PATCH] Device Tree bindings for DSP clusters and DSP CPUs
> > 
> > Binding for DSP CPU clusters and DSP CPUs for Freescale SOCs which have
> > DSP CPUs in addition to PowerPC CPUs. For example B4860.
> > 
> > Signed-off-by: Poonam Aggrwal <poonam.aggrwal-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  .../devicetree/bindings/powerpc/fsl/dsp-cpus.txt   |   78
> > ++++++++++++++++++++
> >  1 files changed, 78 insertions(+), 0 deletions(-)  create mode 100644
> > Documentation/devicetree/bindings/powerpc/fsl/dsp-cpus.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/powerpc/fsl/dsp-cpus.txt
> > b/Documentation/devicetree/bindings/powerpc/fsl/dsp-cpus.txt
> > new file mode 100644
> > index 0000000..da7f5d4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/powerpc/fsl/dsp-cpus.txt
> > @@ -0,0 +1,78 @@
> > +===================================================================
> > +Binding for DSP CPU clusters and DSP CPUs for Freescale SOCs which have
> > +DSP CPUs in addition to PowerPC cpus.
> > +Copyright 2013 Freescale Semiconductor Inc.
> > +
> > +Power Architecture CPUs in Freescale SOCs are represented in device
> > +trees as per the definition in ePAPR.
> > +
> > +Required properties for DSP CPU cluster:

Where do DSP CPU cluster nodes go? THat should be desscribed before the
example.

> > +- compatible : should be "fsl,dsp-cluster" or "fsl,sc3900-cluster".

s/should be/should contain/ -- you might have a backwards compatible
version in future. Similarly elsewhere.

When should "fsl,dsp-cluster" be used, and when should
"fsl,sc3900-cluster" be used? That should be described.

> > +- reg : should contain the cluster index
> > +
> > +Required properties for DSP CPU:

Where do the CPU nodes go? That should be described before the example.

> > +- compatible : should be "fsl,dsp" or "fsl,sc3900".

When should each of these compatible strings be used?

> > +- reg : should contain index of DSP CPU within the DSP clsuter.
> > +- next-level-cache : should point to the phandle of the next-level L2
> > cache.

Does nothing else need to be described (e.g. mailbox or communication
mechanism, interrupts, regulators, clocks) to use these DSPs?

> > +
> > +Example for B4860:
> > +B4860 SOC of Freescale has 3 DSP clusters. Each DSP cluster has 2 DSP
> > CPUs each.
> > +The DSP CPUs are SC3900. There is a shared L2 cache per DSP cluster.
> > +	dsp-clusters {

I assume the name of the dsp-clusters node is important (and that it
needs to be under / rathert than a subnode)? That should be documented.

> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		dsp-cluster0 {

This has a reg. Shouldn't it be called dsp-cluster@0 ?

> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			compatible = "fsl,sc3900-cluster";
> > +			reg = <0>;
> > +
> > +			dsp0: dsp@0 {
> > +				compatible = "fsl,sc3900";
> > +				reg = <0>;
> > +				next-level-cache = <&L2_2>;
> > +			};
> > +			dsp1: dsp@1 {
> > +				compatible = "fsl,sc3900";
> > +				reg = <1>;
> > +				next-level-cache = <&L2_2>;
> > +			};
> > +		};
> > +
> > +		dsp-cluster1 {

Similarly, dsp-cluster@1 ? 

> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			compatible = "fsl,sc3900-cluster";
> > +			reg = <1>;
> > +
> > +			dsp2: dsp@2 {
> > +				compatible = "fsl,sc3900";
> > +				reg = <2>;
> > +				next-level-cache = <&L2_3>;
> > +			};
> > +			dsp3: dsp@3 {
> > +				compatible = "fsl,sc3900";
> > +				reg = <3>;
> > +				next-level-cache = <&L2_3>;
> > +			};
> > +		};
> > +
> > +		dsp-cluster2 {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			compatible = "fsl,sc3900-cluster";
> > +			reg = <2>;
> > +
> > +			dsp4: dsp@4 {
> > +				compatible = "fsl,sc3900";
> > +				reg = <4>;
> > +				next-level-cache = <&L2_4>;
> > +			};
> > +			dsp5: dsp@5 {
> > +				compatible = "fsl,sc3900";
> > +				reg = <5>;
> > +				next-level-cache = <&L2_4>;
> > +			};
> > +		};
> > +	};
> > --
> > 1.7.4.1

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
