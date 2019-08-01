From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v6 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
Date: Thu, 1 Aug 2019 11:23:43 +0200
Message-ID: <20190801112343.0b770da0@collabora.com>
References: <1564631710-30276-1-git-send-email-masonccyang@mxic.com.tw>
        <1564631710-30276-3-git-send-email-masonccyang@mxic.com.tw>
        <20190801075725.4f23e0f5@collabora.com>
        <OF42C4D3EC.9549E8DC-ON48258449.003273A5-48258449.00330A06@mxic.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <OF42C4D3EC.9549E8DC-ON48258449.003273A5-48258449.00330A06@mxic.com.tw>
Sender: linux-kernel-owner@vger.kernel.org
To: masonccyang@mxic.com.tw
Cc: anders.roxell@linaro.org, bbrezillon@kernel.org, christophe.kerello@st.com, computersforpeace@gmail.com, devicetree@vger.kernel.org, dwmw2@infradead.org, juliensu@mxic.com.tw, lee.jones@linaro.org, liang.yang@amlogic.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, marek.vasut@gmail.com, mark.rutland@arm.com, miquel.raynal@bootlin.com, paul@crapouillou.net, paul.burton@mips.com, richard@nod.at, robh+dt@kernel.org, stefan@agner.ch, vigneshr@ti.com
List-Id: devicetree@vger.kernel.org

On Thu, 1 Aug 2019 17:17:29 +0800
masonccyang@mxic.com.tw wrote:

> Hi Boris,
> 
> > On Thu,  1 Aug 2019 11:55:10 +0800
> > Mason Yang <masonccyang@mxic.com.tw> wrote:
> >   
> > > Document the bindings used by the Macronix raw NAND controller.
> > > 
> > > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > > ---
> > >  Documentation/devicetree/bindings/mtd/mxic-nand.txt | 19   
> +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >  create mode 100644   
> Documentation/devicetree/bindings/mtd/mxic-nand.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mtd/mxic-nand.txt b/  
> > Documentation/devicetree/bindings/mtd/mxic-nand.txt  
> > > new file mode 100644
> > > index 0000000..de37d60
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> > > @@ -0,0 +1,19 @@
> > > +Macronix Raw NAND Controller Device Tree Bindings
> > > +-------------------------------------------------
> > > +
> > > +Required properties:
> > > +- compatible: should be "mxicy,multi-itfc-v009-nand-morph"
> > > +- reg: should contain 1 entry for the registers
> > > +- interrupts: interrupt line connected to this raw NAND controller
> > > +- clock-names: should contain "ps", "send" and "send_dly"
> > > +- clocks: should contain 3 phandles for the "ps", "send" and
> > > +    "send_dly" clocks
> > > +
> > > +Example:
> > > +
> > > +   nand: nand-controller@43c30000 {
> > > +      compatible = "mxicy,multi-itfc-v009-nand-morph";
> > > +      reg = <0x43c30000 0x10000>;
> > > +      clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
> > > +      clock-names = "send", "send_dly", "ps";  
> > 
> > You should have subnodes describing the NAND connected to the
> > controller (see [1]).
> > 
> > [1]  
> https://elixir.bootlin.com/linux/v5.3-rc2/source/Documentation/devicetree/
> > bindings/mtd/nand-controller.yaml#L131
> >   
> > > +   };  
> >   
> 
> Do you mean to add patternProperties ?
> 
>                  nand: nand-controller@43c30000 {
>                                  compatible = 
> "mxicy,multi-itfc-v009-nand-morph";
>                                  reg = <0x43c30000 0x10000>;
>                                  clocks = <&clkwizard 0>, <&clkwizard 1>, 
> <&clkc 15>;
>                                  clock-names = "send", "send_dly", "ps";
> 

				#address-cells = <1>;
				#size-cells = <0>;

> +                               nand@0 {
> +
					reg = <0>;
					/* nand props here */

> +                               };
>                  };
> 
> something like that.

Yes, something like that.
