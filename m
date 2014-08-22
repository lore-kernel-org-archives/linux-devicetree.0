From: Joe.C <srv_yingjoe.chen@mediatek.com>
Subject: Re: [RESEND PATCH v2 4/4] dt-bindings: add bindings for mediatek
 intpol
Date: Fri, 22 Aug 2014 16:39:11 +0800
Message-ID: <1408696751.27728.61.camel@mtksdaap41>
References: <1407895884-18131-1-git-send-email-srv_yingjoe.chen@mediatek.com>
 <1407895884-18131-5-git-send-email-srv_yingjoe.chen@mediatek.com>
 <CABuKBeJ0OsaBex_5D9tazTVZX1T8pnUjG7v0nVay-jzqL2nuqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABuKBeJ0OsaBex_5D9tazTVZX1T8pnUjG7v0nVay-jzqL2nuqQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Hsien-Chun Yen <hc.yen@mediatek.com>, Randy Dunlap <rdunlap@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Jensen <jonas.jensen@gmail.com>, srv_heupstream <srv_heupstream@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, Nathan Chung <nathan.chung@mediatek.com>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang =?UTF-8?Q?=28=E9=BB=83=E6=99=BA=E5=82=91=29?= <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-a>
List-Id: devicetree@vger.kernel.org


Hi, Rob,

Would you help to review this DT bindings and give us some
suggestions? Matthias suggests moving this to
Documentation/devicetree/bindings/arm/mediatek/mediatek,intpol.txt
I think that's a better place for this. What do you think?

Joe.C

On Thu, 2014-08-21 at 17:02 +0200, Matthias Brugger wrote:
> 2014-08-13 4:11 GMT+02:00 Joe.C <srv_yingjoe.chen@mediatek.com>:
> > From: "Joe.C" <yingjoe.chen@mediatek.com>
> >
> > Add binding documentation for Mediatek SoC GIC interrupt polarity extension.
> >
> > Signed-off-by: Joe.C <yingjoe.chen@mediatek.com>
> > ---
> >  .../bindings/interrupt-controller/mediatek,intpol.txt    | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,intpol.txt
> 
> I think the place for the file should be in
> Documentation/devicetree/bindings/arm/mediatek/mediatek,intpol.txt as
> it is a interrupt-controller extension of the mediatek architecture.
> 
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,intpol.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,intpol.txt
> > new file mode 100644
> > index 0000000..16ea372
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,intpol.txt
> > @@ -0,0 +1,16 @@
> > +Mediatek 65xx/81xx GIC interrupt polarity extension
> > +
> > +Mediatek SOCs contain controllable inverter for each GIC SPI interrupt,
> > +these can be used as GIC interrupt polarity extension.
> > +
> > +Required properties:
> > +- compatible: Compatible property value should be "mediatek,mt6577-intpol"
> > +
> > +- reg: Physical base address of the int pol registers and length of memory
> > +  mapped region.
> > +
> > +Example:
> > +       intpol: intpol@10200100 {
> > +               compatible = "mediatek,mt6577-intpol";
> > +               reg = <0x10200100 0x1c>;
> > +       };
> > --
> > 1.8.1.1.dirty
> >
> 
> 
> 
