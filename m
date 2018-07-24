From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: Re: [PATCH 2/3] dt-bindings: arm: syna: add support for the AS370 SoC
Date: Tue, 24 Jul 2018 13:40:04 +0800
Message-ID: <20180724134004.4fc660d6@xhacker.debian>
References: <20180713171712.05f58a74@xhacker.debian>
 <20180713172457.6193a92f@xhacker.debian>
 <20180720151529.GA26487@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180720151529.GA26487@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Rob

On Fri, 20 Jul 2018 09:15:29 -0600 Rob Herring wrote:

> On Fri, Jul 13, 2018 at 05:24:57PM +0800, Jisheng Zhang wrote:
> > The AS370 SoC is a new derivative of the berlin family. The only
> > difference is the SoC isn't named as berlin*.  
> 
> So is it a derivative or just rebranded?

A derivative new generation SoC.

> 
> > Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> > ---
> >  Documentation/devicetree/bindings/arm/syna.txt | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/syna.txt b/Documentation/devicetree/bindings/arm/syna.txt
> > index 3bab18409b7a..3ba1d7b5ee74 100644
> > --- a/Documentation/devicetree/bindings/arm/syna.txt
> > +++ b/Documentation/devicetree/bindings/arm/syna.txt
> > @@ -1,4 +1,4 @@
> > -Marvell Berlin SoC Family Device Tree Bindings
> > +Synaptics SoC Device Tree Bindings  
> 
> Perhaps some note about what has happened here. Otherwise it looks 
> strange having "Marvell Berlin" in the document when the title says 
> Synaptics SoC.

Good idea. will do in v2

> 
> >  ---------------------------------------------------------------
> >  
> >  Work in progress statement:
> > @@ -13,6 +13,10 @@ stable binding/ABI.
> >  
> >  ---------------------------------------------------------------
> >  
> > +Boards with the Synaptics AS370 SoC shall have the following properties:
> > +  Required root node property:
> > +    compatible: "syna,as370"
> > +
> >  Boards with a SoC of the Marvell Berlin family, e.g. Armada 1500
> >  shall have the following properties:
> >  
> > -- 
> > 2.18.0
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html  
