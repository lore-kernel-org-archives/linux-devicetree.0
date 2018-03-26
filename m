From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next 4/8] dt-bindings: net: add DT bindings for
 Microsemi Ocelot Switch
Date: Mon, 26 Mar 2018 17:25:14 -0500
Message-ID: <20180326222514.4eciw66aihhcjgtw@rob-hp-laptop>
References: <20180323201117.8416-1-alexandre.belloni@bootlin.com>
 <20180323201117.8416-5-alexandre.belloni@bootlin.com>
 <a5db6109-c5d9-f573-893c-f7d66c3168c2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a5db6109-c5d9-f573-893c-f7d66c3168c2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, "David S . Miller" <davem@davemloft.net>, Allan Nielsen <Allan.Nielsen@microsemi.com>, razvan.stefanescu@nxp.com, po.liu@nxp.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 23, 2018 at 02:11:35PM -0700, Florian Fainelli wrote:
> On 03/23/2018 01:11 PM, Alexandre Belloni wrote:
> > DT bindings for the Ethernet switch found on Microsemi Ocelot platforms.
> > 
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > ---
> >  .../devicetree/bindings/net/mscc-ocelot.txt        | 62 ++++++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/mscc-ocelot.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/net/mscc-ocelot.txt b/Documentation/devicetree/bindings/net/mscc-ocelot.txt
> > new file mode 100644
> > index 000000000000..ee092a85b5a0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/mscc-ocelot.txt
> > @@ -0,0 +1,62 @@
> > +Microsemi Ocelot network Switch
> > +===============================
> > +
> > +The Microsemi Ocelot network switch can be found on Microsemi SoCs (VSC7513,
> > +VSC7514)
> > +
> > +Required properties:
> > +- compatible: Should be "mscc,ocelot-switch"
> > +- reg: Must contain an (offset, length) pair of the register set for each
> > +  entry in reg-names.
> > +- reg-names: Must include the following entries:
> > +  - "sys"
> > +  - "rew"
> > +  - "qs"
> > +  - "hsio"
> > +  - "qsys"
> > +  - "ana"
> > +  - "portX" with X from 0 to the number of last port index available on that
> > +    switch
> > +- interrupts: Should contain the switch interrupts for frame extraction and
> > +  frame injection
> > +- interrupt-names: should contain the interrupt names: "xtr", "inj"
> 
> You are not documenting the "ports" subnode(s).Please move the
> individual ports definition under a ports subnode, mainly for two reasons:
> 
> - it makes it easy at the .dtsi level to have all ports disabled by default
> 
> - this makes you strictly conforming to the DSA binding for Ethernet
> switches and this is good for consistency (both parsing code and just
> representation).

ports and port collide with the OF graph binding. It would be good if 
this moved to ethernet-port(s) or similar.

Rob
