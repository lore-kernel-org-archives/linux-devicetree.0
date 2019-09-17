From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/9] dt-bindings: display, renesas,du: Document cmms
 property
Date: Tue, 17 Sep 2019 12:58:35 -0500
Message-ID: <20190917175835.GA6900@bogus>
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-3-jacopo+renesas@jmondi.org>
 <2bcbb30c-db36-38a1-dcff-4f4269c11ad6@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2bcbb30c-db36-38a1-dcff-4f4269c11ad6@ideasonboard.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, laurent.pinchart@ideasonboard.com, geert@linux-m68k.org, horms@verge.net.au, uli+renesas@fpond.eu, VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie, daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp, Harsha.ManjulaMallikarjun@in.bosch.com, linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

On Wed, Sep 11, 2019 at 05:06:33PM +0100, Kieran Bingham wrote:
> Hi Jacopo,
> 
> On 06/09/2019 14:54, Jacopo Mondi wrote:
> > Document the newly added 'cmms' property which accepts a list of phandle
> > and channel index pairs that point to the CMM units available for each
> > Display Unit output video channel.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  Documentation/devicetree/bindings/display/renesas,du.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> > index c97dfacad281..1773b0a2f54f 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> > @@ -45,6 +45,10 @@ Required Properties:
> >      instance that serves the DU channel, and the channel index identifies the
> >      LIF instance in that VSP.
> > 
> > +  - renesas,cmms: A list of phandles to the CMM instances present in the SoC,
> > +    one for each available DU channel. The property shall not be specified for
> > +    SoCs that do not provide any CMM (such as V3M and V3H).
> > +
> >  Required nodes:
> > 
> >  The connections to the DU output video ports are modeled using the OF graph
> > @@ -91,6 +95,7 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
> >  			 <&cpg CPG_MOD 721>;
> >  		clock-names = "du.0", "du.1", "du.2", "du.3";
> >  		vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
> > +		renesas,cmms = <&cmm0 &cmm1 &cmm2 &cmm3>;
> 
> Should these be comma separated in the same fashion as the vsps are
> separated?

Yes. Doesn't matter from a dtb standpoint, but the schema are going to 
be stricter here. Bracket each unit.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> I don't really mind either way though ...
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> 
> > 
> >  		ports {
> >  			#address-cells = <1>;
> > --
> > 2.23.0
> > 
> 
