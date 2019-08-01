From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v6 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
Date: Thu, 1 Aug 2019 11:36:31 +0200
Message-ID: <20190801113631.0dcbbf2a@xps13>
References: <1564631710-30276-1-git-send-email-masonccyang@mxic.com.tw>
        <1564631710-30276-3-git-send-email-masonccyang@mxic.com.tw>
        <20190801091310.035bc824@xps13>
        <OF6FA21ABA.C0DF9C78-ON48258449.00331EB3-48258449.0034600D@mxic.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <OF6FA21ABA.C0DF9C78-ON48258449.00331EB3-48258449.0034600D@mxic.com.tw>
Sender: linux-kernel-owner@vger.kernel.org
To: masonccyang@mxic.com.tw
Cc: anders.roxell@linaro.org, bbrezillon@kernel.org, christophe.kerello@st.com, computersforpeace@gmail.com, devicetree@vger.kernel.org, dwmw2@infradead.org, juliensu@mxic.com.tw, lee.jones@linaro.org, liang.yang@amlogic.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, marek.vasut@gmail.com, mark.rutland@arm.com, paul@crapouillou.net, paul.burton@mips.com, richard@nod.at, robh+dt@kernel.org, stefan@agner.ch, vigneshr@ti.com
List-Id: devicetree@vger.kernel.org

Hi Mason,

masonccyang@mxic.com.tw wrote on Thu, 1 Aug 2019 17:32:04 +0800:

> Hi Miquel,
> 
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
> > 
> > "mxicy" looks strange to me, I know it has been used in the past and
> > cannot be removed, but I don't think it is wise to continue using it
> > while your use "mxic" in all your other contributions. I would update
> > the prefix to mxic here and fill-in the relevant doc.
> > 
> > Also, what is nand-morph? I thought we were okay for
> > the "-nand-controller" suffix.
> >   
> 
> I thought there is a node name "nand-controller@43c30000" and the
> "-nand-controller" suffix in compatible property seems repeated.

It is repeated because it won't be used the same way. The node name
will only be relevant in the DT itself (to reference a node for
instance). I will also appear in the sysfs.

The compatibles are listed in drivers and "given" to the kernel core so
that the device-driver association can take place.

> 
> In addition, I would like to indicate it's a multi function controller.
> 
> nand-morph means this multi interface controller (multi-itfc) works in
> raw NAND controller.

I think this is clear as you already put "multi-itfc" in the name. If
you want you can switch to "morph" in the prefix, but I want the suffix
to be "-nand-controller".

Thanks,
Miquèl
