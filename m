From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH v3 2/2] video: imxfb: Add DT support
Date: Mon, 15 Apr 2013 15:23:22 +0200
Message-ID: <20130415132322.GC15139@game.jcrosoft.org>
References: <1365157876-1757-1-git-send-email-mpa@pengutronix.de>
 <1365157876-1757-3-git-send-email-mpa@pengutronix.de>
 <20130408075742.GR20693@game.jcrosoft.org>
 <20130414143132.GD27394@pengutronix.de>
 <20130415124321.GB15139@game.jcrosoft.org>
 <20130415151316.4d49e9b2@e6520eb>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20130415151316.4d49e9b2@e6520eb>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Cc: linux-fbdev@vger.kernel.org, Florian Tobias Schandinat <FlorianSchandinat@gmx.de>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Sascha Hauer <kernel@pengutronix.de>, Markus Pargmann <mpa@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 15:13 Mon 15 Apr     , Eric B=E9nard wrote:
> Hi,
> =

> Le Mon, 15 Apr 2013 14:43:21 +0200,
> Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> a =E9crit :
> =

> > On 16:31 Sun 14 Apr     , Markus Pargmann wrote:
> > > On Mon, Apr 08, 2013 at 09:57:42AM +0200, Jean-Christophe PLAGNIOL-VI=
LLARD wrote:
> > > > On 12:31 Fri 05 Apr     , Markus Pargmann wrote:
> > > > > Add devicetree support for imx framebuffer driver. It uses the ge=
neric
> > > > > display bindings and helper functions.
> > > > > =

> > > > > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > > > > Cc: Fabio Estevam <festevam@gmail.com>
> > > > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > > > ---
> > > > >  .../devicetree/bindings/video/fsl,imx-fb.txt       |  49 ++++++
> > > > >  drivers/video/imxfb.c                              | 192 +++++++=
++++++++++----
> > > > >  2 files changed, 207 insertions(+), 34 deletions(-)
> > > > >  create mode 100644 Documentation/devicetree/bindings/video/fsl,i=
mx-fb.txt
> > > > > =

> > > > > diff --git a/Documentation/devicetree/bindings/video/fsl,imx-fb.t=
xt b/Documentation/devicetree/bindings/video/fsl,imx-fb.txt
> > > > > new file mode 100644
> > > > > index 0000000..bde9c77
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/video/fsl,imx-fb.txt
> > > > > @@ -0,0 +1,49 @@
> > > > > +Freescale imx21 Framebuffer
> > > > > +
> > > > > +This framebuffer driver supports devices imx1, imx21, imx25, and=
 imx27.
> > > > > +
> > > > > +Required properties:
> > > > > +- compatible : "fsl,<chip>-fb", chip should be imx1 or imx21
> > > > > +- reg : Should contain 1 register ranges(address and length)
> > > > > +- interrupts : One interrupt of the fb dev
> > > > > +
> > > > > +Required nodes:
> > > > > +- display: Phandle to a display node as described in
> > > > > +	Documentation/devicetree/bindings/video/display-timing.txt
> > > > > +	Additional, the display node has to define properties:
> > > > > +	- fsl,bpp: Bits per pixel
> > > > > +	- fsl,pcr: LCDC PCR value
> > > > > +
> > > > > +Optional properties:
> > > > > +- dmacr-eukrea: Should be set for eukrea boards.
> > > > why ?
> > > =

> > > Because eukrea boards have a different dmacr then all other boards us=
ing
> > > imxfb. The dmacr address is hardcoded as defaults in the code. I could
> > > also search for the board name in the DT, but there are no eukrea boa=
rds
> > > with DT at the moment, so I thought a bool property may be better for
> > > the moment.
> > so no if an other board come will have an other property no
> > =

> > add an optionnal option to pass the dmacr
> =

> I didn't follow the thread but dmacr is not specific to our boards :
> $ grep -rn dmacr arch/arm/mach-imx/
> arch/arm/mach-imx/mach-mx27_3ds.c:446:	.dmacr		=3D 0x00020010,
> arch/arm/mach-imx/mach-mx21ads.c:231:	.dmacr		=3D 0x00020008,
> arch/arm/mach-imx/mach-mxt_td60.c:210:	.dmacr		=3D 0x00020010,
> arch/arm/mach-imx/eukrea_mbimx27-baseboard.c:192:	.dmacr		=3D 0x00040060,
> arch/arm/mach-imx/eukrea_mbimxsd25-baseboard.c:165:	.dmacr		=3D 0x0004006=
0,
> arch/arm/mach-imx/mach-mx27ads.c:241:	.dmacr		=3D 0x00020010,
> arch/arm/mach-imx/mach-pca100.c:351:	.dmacr		=3D 0x00020010,
> arch/arm/mach-imx/pcm970-baseboard.c:185:	.dmacr		=3D 0x00020010,
> arch/arm/mach-imx/mach-mx25_3ds.c:173:	.dmacr		=3D 0x00020010,

with this it even more clear nack on the dmacr-eukrea property

use an optional property where we can specify the value to use

Best Regsrds,
J.
