From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: Virtual devices (cpufreq etc) and DT
Date: Thu, 4 Aug 2011 11:44:43 +0100
Message-ID: <20110804104442.GE2899@pulham.picochip.com>
References: <20110803095019.GB2607@pulham.picochip.com>
	<4E39775C.4090305@gmail.com>
	<20110804102321.GC2899@pulham.picochip.com>
	<CACxGe6tq_fpcwVZPYvPTkoLkkU0c3KeuCR+-UQSCcZcAo9vOUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6tq_fpcwVZPYvPTkoLkkU0c3KeuCR+-UQSCcZcAo9vOUA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 04, 2011 at 11:33:37AM +0100, Grant Likely wrote:
> On Thu, Aug 4, 2011 at 11:23 AM, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wrote:
> > Hi Rob,
> >
> > On Wed, Aug 03, 2011 at 11:29:16AM -0500, Rob Herring wrote:
> > [...]
> >> Making of_clk_get take a struct device_node ptr instead of struct
> >> device fixes the problem. Here's a patch that does that.
> >>
> >> Rob
> >>
> >> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >> Subject: [PATCH] of/clk: use struct device_node for of_clk_get
> >>
> >> In order to allow clock retrieval without having a struct device,
> >> use the OF node pointer instead for of_clk_get.
> >>
> >> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >> ---
> >> =A0drivers/clk/clkdev.c =A0 | =A0 =A03 ++-
> >> =A0drivers/of/clock.c =A0 =A0 | =A0 12 +++++-------
> >> =A0include/linux/of_clk.h | =A0 =A04 ++--
> >> =A03 files changed, 9 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
> >> index 9252b4f..a8f1d29 100644
> >> --- a/drivers/clk/clkdev.c
> >> +++ b/drivers/clk/clkdev.c
> >> @@ -89,7 +89,8 @@ struct clk *clk_get(struct device *dev, const char
> >> *con_id)
> >> =A0 =A0 =A0 const char *dev_id =3D dev ? dev_name(dev) : NULL;
> >> =A0 =A0 =A0 struct clk *clk;
> >>
> >> - =A0 =A0 clk =3D of_clk_get(dev, con_id);
> >> + =A0 =A0 if (dev)
> >> + =A0 =A0 =A0 =A0 =A0 =A0 clk =3D of_clk_get(dev->of_node, con_id);
> >> =A0 =A0 =A0 if (clk && __clk_get(clk))
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return clk;
> >
> > I've just tried this patch and it works a treat, but I had to change
> > this hunk to the one below to stop the compiler warning about a possible
> > uninitialized use of clk.
> =

> You could also change of_clk_get() to simply return null if it is
> passed a null of_node.  That would allow drivers to be a tad simpler.

Yes, that would be a lot neater.

Jamie
