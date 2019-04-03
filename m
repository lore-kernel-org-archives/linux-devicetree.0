From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: mtd: sunxi-nand: Add YAML schemas
Date: Wed, 3 Apr 2019 03:33:42 -0500
Message-ID: <CAL_Jsq+bivuKJ107tiQDb9EN2S+AyK89+CzfcofioXcqGLLqjA@mail.gmail.com>
References: <74b8a52ce98b09d7906f988c107793a86c0c5f6b.1554216856.git-series.maxime.ripard@bootlin.com>
 <079279c3713042bdcc76ea27907d5f75bcb483fc.1554216856.git-series.maxime.ripard@bootlin.com>
 <CAL_JsqLrdFAhdbjVi0ZoCOM6ajEOdQeLpkSKBsZ90X+UvfkLmA@mail.gmail.com>
 <20190403074418.by3cmvtmdcbovyw5@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190403074418.by3cmvtmdcbovyw5@flea>
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

On Wed, Apr 3, 2019 at 2:44 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Tue, Apr 02, 2019 at 08:25:59PM -0500, Rob Herring wrote:
> > On Tue, Apr 2, 2019 at 9:54 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > >
> > > Switch the DT binding to a YAML schema to enable the DT validation.
> > >
> > > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > >
> > > ---
> > >
> > > Changes from v1
> > >   - Added controller constraints to the generic options
> > > ---
> > >  Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> > >  Documentation/devicetree/bindings/mtd/sunxi-nand.txt                | 48 +------------------------------------
> > >  2 files changed, 96 insertions(+), 48 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> >
> > Same 'a-f' comment here, but otherwise,
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > And thanks for being an early adopter. Let me know if you have any
> > feedback on the schema or pain points.
>
> My main feedback is that it's awesome :)

Thanks.

> We (sunxi) have an awful lot of DT in the tree, and I made schemas for
> most of the bindings we have now. It allowed us to find a huge (or at
> least way more than what I was expecting) number of issues in our DTs,
> like inconsistent node naming, typos, etc., and also that our bindings
> were not updated as they should have.
>
> The following patches are a direct result from that, and I expect to
> find more.
> http://lists.infradead.org/pipermail/linux-arm-kernel/2019-March/640978.html
>
> On the pain point side, I guess the main one is that most of the time
> it's not really clear to me how I should express a particular set of
> constraints. You've been really helpful to deal with that one, and I
> guess it also stems from the fact that there's not a lot of examples
> in the tree right now. I expect it to go away the more schemas we
> have.

Yes, there is a bit of a learning curve to json-schema if you have to
do anything out of the ordinary. The meta-schema is supposed to help
constrain things, but it's only as good as what we define there. That
also mainly works for already known property names and patterns we've
thought of.

> The other one that might be more problematic is that it also tries to
> validate nodes that are not enabled. For in-SoC components that don't
> rely on anything external, it's fine, however, for components that
> would require something that is connected on the board (like a
> regulator, a phy, a GPIO, whatever), then we can't have all the
> required resources in the DTSI, and boards that don't use that
> component (and keep it disabled) will emit warning that this
> particular property is missing.
>
> I've tried to look into it but couldn't find an easy fix for that in
> the tooling, so I've opened a github issue for this. Let me know if
> it's not appropriate.

Yeah, I need to go look at that. Skipping disabled nodes shouldn't be
too hard to do within the tool. This came up before I think and I've
resisted because I don't want to skip validating at least what is
there. Maybe the better solution would be to drop 'required' from
schema when validating disabled nodes. (At least, I think just
'required' is the problem?) The complication would be we'd need 2 sets
of schemas and select the right one for each node. Another way to
implement it would be just to filter out the warning messages.

Rob
