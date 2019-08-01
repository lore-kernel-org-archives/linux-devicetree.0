From: masonccyang@mxic.com.tw
Subject: Re: [PATCH v6 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
Date: Thu, 1 Aug 2019 17:17:29 +0800
Message-ID: <OF42C4D3EC.9549E8DC-ON48258449.003273A5-48258449.00330A06@mxic.com.tw>
References: <1564631710-30276-1-git-send-email-masonccyang@mxic.com.tw>	<1564631710-30276-3-git-send-email-masonccyang@mxic.com.tw>
 <20190801075725.4f23e0f5@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190801075725.4f23e0f5@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, christophe.kerello@st.com, richard@nod.at, bbrezillon@kernel.org, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, paul@crapouillou.net, marek.vasut@gmail.com, paul.burton@mips.com, liang.yang@amlogic.com, linux-mtd@lists.infradead.org, stefan@agner.ch, miquel.raynal@bootlin.com, anders.roxell@linaro.org, computersforpeace@gmail.com, dwmw2@infradead.org, vigneshr@ti.com
List-Id: devicetree@vger.kernel.org


Hi Boris,

> On Thu,  1 Aug 2019 11:55:10 +0800
> Mason Yang <masonccyang@mxic.com.tw> wrote:
> 
> > Document the bindings used by the Macronix raw NAND controller.
> > 
> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > ---
> >  Documentation/devicetree/bindings/mtd/mxic-nand.txt | 19 
+++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 
Documentation/devicetree/bindings/mtd/mxic-nand.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/mxic-nand.txt b/
> Documentation/devicetree/bindings/mtd/mxic-nand.txt
> > new file mode 100644
> > index 0000000..de37d60
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> > @@ -0,0 +1,19 @@
> > +Macronix Raw NAND Controller Device Tree Bindings
> > +-------------------------------------------------
> > +
> > +Required properties:
> > +- compatible: should be "mxicy,multi-itfc-v009-nand-morph"
> > +- reg: should contain 1 entry for the registers
> > +- interrupts: interrupt line connected to this raw NAND controller
> > +- clock-names: should contain "ps", "send" and "send_dly"
> > +- clocks: should contain 3 phandles for the "ps", "send" and
> > +    "send_dly" clocks
> > +
> > +Example:
> > +
> > +   nand: nand-controller@43c30000 {
> > +      compatible = "mxicy,multi-itfc-v009-nand-morph";
> > +      reg = <0x43c30000 0x10000>;
> > +      clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
> > +      clock-names = "send", "send_dly", "ps";
> 
> You should have subnodes describing the NAND connected to the
> controller (see [1]).
> 
> [1]
https://elixir.bootlin.com/linux/v5.3-rc2/source/Documentation/devicetree/
> bindings/mtd/nand-controller.yaml#L131
> 
> > +   };
> 

Do you mean to add patternProperties ?

                 nand: nand-controller@43c30000 {
                                 compatible = 
"mxicy,multi-itfc-v009-nand-morph";
                                 reg = <0x43c30000 0x10000>;
                                 clocks = <&clkwizard 0>, <&clkwizard 1>, 
<&clkc 15>;
                                 clock-names = "send", "send_dly", "ps";

+                               nand@0 {
+
+                               };
                 };

something like that.

thanks & best regards,
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
