From: masonccyang@mxic.com.tw
Subject: Re: [PATCH v4 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
Date: Fri, 28 Jun 2019 17:09:16 +0800
Message-ID: <OFF895B48A.00F391C1-ON48258427.002F8256-48258427.003249E0@mxic.com.tw>
References: <1561443056-13766-1-git-send-email-masonccyang@mxic.com.tw>	<1561443056-13766-3-git-send-email-masonccyang@mxic.com.tw>
 <20190627192609.0965f6d5@xps13>	<OFFBD1710A.54AC467B-ON48258427.0023FCA3-48258427.00255B71@mxic.com.tw>
 <20190628094250.1fd84505@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190628094250.1fd84505@xps13>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, christophe.kerello@st.com, vigneshr@ti.com, jianxin.pan@amlogic.com, bbrezillon@kernel.org, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, paul@crapouillou.net, marek.vasut@gmail.com, paul.burton@mips.com, broonie@kernel.org, linux-mtd@lists.infradead.org, stefan@agner.ch, richard@nod.at, anders.roxell@linaro.org, liang.yang@amlogic.com, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org


Hi Miquel,

> 
> Please always Cc: Rob (robh+dt@kernel.org) when you send bindings
> related patches.

Understood. thanks for your remind.


> > 
> > > 
> > > > +- reg: should contain 1 entrie for the registers 
> > > 
> > >                            entry
> > > 
> > > > +- reg-names: should contain "regs" 
> > > 
> > > Not sure you need that? 
> > 
> > for a base address of ctlr registers.
> 
> Yes I know, I mean: you don't necessarily need the 'reg-names' property
> as it is supposed that the only entry will be the IP registers (unless
> there are more). I don't know what's Rob preference here but I would
> either drop the reg-names property or enhance the name, "regs" is
> terribly not descriptive.

Got it, any comment is appreciated for either drop the reg-names property 
or enhance the name.

> 
> > > > +- interrupts: interrupt line connected to this NAND controller
> > > > +- clock-names: should contain "ps_clk", "send_clk" and 
"send_dly_clk"
> > > > +- clocks: should contain 3 entries for the "ps_clk", "send_clk" 
and
> > > > +    "send_dly_clk" clocks 
> > > 
> > > s/entries/phandles/ ? 
> > 
> > ?
> > as I know that kernel views the phandle values as device tree 
structure
> > information instead of device tree data and thus does not store them 
as
> > properties.
> 
> The bindings have nothing to do with the kernel views. They might
> actually be merged in a different project, out of the kernel.
> 

if patch to phandle, should we also patch driver to of_xxx_phandle()?

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
