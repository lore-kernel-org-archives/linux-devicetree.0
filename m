From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: Add YAML schemas for the generic
 NAND options
Date: Thu, 11 Apr 2019 08:19:32 -0500
Message-ID: <CAL_JsqKCky41zrGKNdwrj8i-fburCXx_D+NkZwESUasqNkbMeA@mail.gmail.com>
References: <74b8a52ce98b09d7906f988c107793a86c0c5f6b.1554216856.git-series.maxime.ripard@bootlin.com>
 <CAL_JsqL9rOO8jUUVQ5MnD3GCvyyCDPsw=Kd=va3X-rAF60Wkzg@mail.gmail.com>
 <20190403073551.ym7nbqwcdpicwo6e@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190403073551.ym7nbqwcdpicwo6e@flea>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Boris Brezillon <boris.brezillon@collabora.com>, MTD Maling List <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 3, 2019 at 2:35 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Hi Rob,
>
> On Tue, Apr 02, 2019 at 08:20:58PM -0500, Rob Herring wrote:
> > > +      nand-ecc-strength:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > +        minimum: 1
> >
> > While I wished this worked, these 2 have to be under 'allOf'.
> > Unfortunately, this will also silently pass validation in json-schema.
>
> Unfortunately, I'm not sure I fully get how the ref system is supposed
> to work yet. Can you elaborate a bit on why we should put the ref and
> whatever constraint we have in an allOf?

TL;DR is that is how sub-classing or extending schemas works.

I think I read something at one point which explained why it doesn't
work without allOf, but couldn't find it. Certainly, it seems like it
should at first.

> Should we do the same in a separate schema that would reference
> another entire schema (like the second patch does with the first
> one)?

That would just split defining the type from the additional
constraints. I prefer to keep the top-level 'allOf' including classes
of devices.

Rob
