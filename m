From: masonccyang@mxic.com.tw
Subject: Re: [PATCH v5 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
Date: Tue, 23 Jul 2019 11:26:27 +0800
Message-ID: <OF10139C27.59024E84-ON48258440.00113398-48258440.0012E6FA@mxic.com.tw>
References: <1562138144-2212-1-git-send-email-masonccyang@mxic.com.tw>
 <1562138144-2212-3-git-send-email-masonccyang@mxic.com.tw>
 <20190722234614.GA11971@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190722234614.GA11971@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, christophe.kerello@st.com, richard@nod.at, bbrezillon@kernel.org, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, stefan@agner.ch, paul@crapouillou.net, marek.vasut@gmail.com, paul.burton@mips.com, liang.yang@amlogic.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, anders.roxell@linaro.org, computersforpeace@gmail.com, dwmw2@infradead.org, vigneshr@ti.com
List-Id: devicetree@vger.kernel.org


Hi Rob,


> 
> Re: [PATCH v5 2/2] dt-bindings: mtd: Document Macronix raw NAND 
controller bindings
> 
> On Wed, Jul 03, 2019 at 03:15:44PM +0800, Mason Yang wrote:
> > Document the bindings used by the Macronix raw NAND controller.
> > 
> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > ---
> >  Documentation/devicetree/bindings/mtd/mxic-nand.txt | 20 
++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 
Documentation/devicetree/bindings/mtd/mxic-nand.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/mxic-nand.txt b/
> Documentation/devicetree/bindings/mtd/mxic-nand.txt
> > new file mode 100644
> > index 0000000..ddd7660
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> > @@ -0,0 +1,20 @@
> > +Macronix Raw NAND Controller Device Tree Bindings
> > +-------------------------------------------------
> > +
> > +Required properties:
> > +- compatible: should be "macronix,nand-controller"
> 
> That's not very specific. There's only 1 version of this h/w?

okay, will give it a apposite name.

> 
> > +- reg: should contain 1 entrie for the registers
> 
> s/entrie/entry/

will fix it.

> 
> > +- interrupts: interrupt line connected to this raw NAND controller
> > +- clock-names: should contain "ps_clk", "send_clk" and "send_dly_clk"
> > +- clocks: should contain 3 phandles for the "ps_clk", "send_clk" and
> > +    "send_dly_clk" clocks
> 
> You can drop '_clk' as that is redundant.

okay, got it.

> 
> > +
> > +Example:
> > +
> > +   nand: mxic-nfc@43c30000 {
> > +      compatible = "macronix,nand-controller";
> > +      reg = <0x43c30000 0x10000>;
> > +      reg-names = "regs";
> 
> Not documented. You can drop as *-names is not generally useful when 
> there is only 1 entry.

okay, will fix it.

> 
> > +      clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
> > +      clock-names = "send_clk", "send_dly_clk", "ps_clk";
> > +   };
> > -- 
> > 1.9.1
> > 

thanks for your time & review.
best regards,
Mason

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information 
and/or personal data, which is protected by applicable laws. Please be 
reminded that duplication, disclosure, distribution, or use of this e-mail 
(and/or its attachments) or any part thereof is prohibited. If you receive 
this e-mail in error, please notify us immediately and delete this mail as 
well as its attachment(s) from your system. In addition, please be 
informed that collection, processing, and/or use of personal data is 
prohibited unless expressly permitted by personal data protection laws. 
Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================



============================================================================

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information and/or personal data, which is protected by applicable laws. Please be reminded that duplication, disclosure, distribution, or use of this e-mail (and/or its attachments) or any part thereof is prohibited. If you receive this e-mail in error, please notify us immediately and delete this mail as well as its attachment(s) from your system. In addition, please be informed that collection, processing, and/or use of personal data is prohibited unless expressly permitted by personal data protection laws. Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
