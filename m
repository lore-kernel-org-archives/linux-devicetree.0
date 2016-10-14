From: Youlin Pei <youlin.pei@mediatek.com>
Subject: Re: [PATCH 1/3] binding: irqchip: mtk-cirq: Add binding document
Date: Fri, 14 Oct 2016 16:23:29 +0800
Message-ID: <1476433409.5408.37.camel@mtksdaap41>
References: <1476335194-26604-1-git-send-email-youlin.pei@mediatek.com>
         <1476335194-26604-2-git-send-email-youlin.pei@mediatek.com>
         <58b24238-659c-c7da-d93c-65db63990930@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <58b24238-659c-c7da-d93c-65db63990930@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, hongkun.cao@mediatek.com, yong.wu@mediatek.com, erin.lo@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi Matthias,
Thanks for your review.

On Thu, 2016-10-13 at 15:00 +0200, Matthias Brugger wrote:
> 
> On 10/13/2016 07:06 AM, Youlin Pei wrote:
> > This commit adds the device tree binding document for
> > the mediatek cirq.
> >
> > Signed-off-by: Youlin Pei <youlin.pei@mediatek.com>
> >
> > ---
> > base on v4.8-rc1
> > ---
> >  .../interrupt-controller/mediatek,cirq.txt         |   30 ++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
> > new file mode 100644
> > index 0000000..ad16953
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
> > @@ -0,0 +1,30 @@
> > +* Mediatek 27xx cirq
> > +
> > +In Mediatek SOCs, the CIRQ is a low power interrupt controller designed to
> > +works outside MCUSYS which comprises with Cortex-Ax cores,CCI and GIC.
> > +The external interrupts (outside MCUSYS) will feed through CIRQ and connect
> > +to GIC in MCUSYS. When CIRQ is enabled, it will record the edge-sensitive
> > +interrupts and generated a pulse signal to parent interrupt controller when
> > +flush command is executed. With CIRQ, MCUSYS can be completely turned off
> > +to improve the system power consumption without losing interrupts.
> > +
> > +Required properties:
> > +- compatible: should be: "mediatek,mt2701-cirq".
> 
> The cirq is present in several SoCs. I suppose it is the same core in 
> all of them. So we can name it mediatek,mtk-cirq and add a 
> mediatek,mtXXXX-cirq for every SoC, just in case we will need it.

Okay, will change it in next version. Thanks.

> 
> Thanks,
> Matthias
Thanks.
Youlin
