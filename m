From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: mtd: Add YAML schemas for the generic
 NAND options
Date: Tue, 2 Apr 2019 03:49:41 -0500
Message-ID: <CAL_Jsq+yfng=wZtKuTdjbLHvz-+QGxG=EKkhH6JckpPNG_nFwQ@mail.gmail.com>
References: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
 <20190402101917.4f38b9a4@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190402101917.4f38b9a4@xps13>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Boris Brezillon <boris.brezillon@collabora.com>, MTD Maling List <linux-mtd@lists.infradead.org>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 2, 2019 at 3:19 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Maxime,
>
> Maxime Ripard <maxime.ripard@bootlin.com> wrote on Mon,  1 Apr 2019
> 23:13:53 +0200:
>
> > The NAND chips in MTD have a bunch of generic options that are needed in a
> > device tree. Add a YAML schemas for those.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 131 +++++++-
> >  1 file changed, 131 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/nand-controller.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > new file mode 100644
> > index 000000000000..05b1afb34972
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > @@ -0,0 +1,131 @@
> > +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NAND Chip and NAND Controller Generic Binding
> > +
> > +maintainers:
> > +  - Boris Brezillon <bbrezillon@kernel.org>
>
> Unfortunately Boris is leaving.
>
> > +  - Miquel Raynal <miquel.raynal@bootlin.com>
> > +  - Richard Weinberger <richard@nod.at>
>
> Is this really needed? There is already a section for that purpose in
> MAINTAINERS.

Yes, because MAINTAINERS is a kernel file and bindings are somewhat
independent. And I found most binding files don't have a maintainer
(other than me as default).

If we ever go to per subsystem/directory MAiNTAiNERS files, then we
can easily generate one from bindings for the kernel.

Rob
