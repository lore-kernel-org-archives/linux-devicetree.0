From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 0/9] of: fix compatible-child-node lookups
Date: Tue, 23 Oct 2018 13:32:56 -0500
Message-ID: <CAL_Jsq+eX0Zr46UT6_+OKhfxLhc315Un5MZkHHAWhK0tt4OvzA@mail.gmail.com>
References: <20180827082153.22537-1-johan@kernel.org> <20180904130557.GT28861@localhost>
 <20181023091951.GC20058@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181023091951.GC20058@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Ulf Hansson <ulf.hansson@linaro.org>, Josh Wu <rainyfeeling@outlook.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Doug Berger <opendmb@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, David Miller <davem@davemloft.net>, Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, joabreu@synopsys.com, Samuel Ortiz <sameo@linux.intel.com>, Sebastian Reichel <sre@kernel.org>Martin Blumenstingl <ma>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 23, 2018 at 4:21 AM Johan Hovold <johan@kernel.org> wrote:
>
> Hi Rob,
>
> On Tue, Sep 04, 2018 at 03:05:57PM +0200, Johan Hovold wrote:
> > Hi all,
> >
> > On Mon, Aug 27, 2018 at 10:21:44AM +0200, Johan Hovold wrote:
> > > Several drivers currently use of_find_compatible_node() to lookup child
> > > nodes while failing to notice that the of_find_ functions search the
> > > entire tree depth-first (from a given start node) and therefore can
> > > match unrelated nodes.
> > >
> > > The fact that these functions also drop a reference to the node they
> > > start searching from (e.g. the parent node) is typically also
> > > overlooked, something which can lead to use-after-free bugs (e.g. after
> > > probe deferrals).
> > >
> > > This series adds a new helper, similar to of_get_child_by_name(),
> > > that can be used to lookup compatible child nodes, and uses the new
> > > helper to fix child-node lookups throughout the tree.
> > >
> > > This is related to the fixes I posted about a year ago, which addressed
> > > a similar anti-pattern when looking up child nodes by name. Since it
> > > took me more than a year to get all those fixes into Linus' tree (one
> > > fix is still pending), and as these fixes depend on the new helper, I'm
> > > suggesting that these all go in through Rob's or Greg's trees.
> > >
> > > Alternatively, the helper could go into to -rc2, and I'll be pinging
> > > submaintainers for the coming year as well. ;)
> >
> > Rob has gotten the helper into -rc2 now:
> >
> >         36156f9241cb of: add helper to lookup compatible child node
> >
> > so feel free to pick these fixes up directly for 4.19-rc or -next,
> > whichever you prefer. I've been able to trigger crashes after probe
> > deferrals due to the use-after-free, but this seems unlikely to be
> > exploitable.
> >
> > I think Rob will be picking up any patches that remain by the end of the
> > release cycle for 4.20.
>
> So far only Ulf has picked up the mmc patch below directly, so if you
> could take the rest through your tree for -rc1 that would be great.

Thanks for the reminder, though before the merge window opened would
have been better. I've applied all but the mtd patch.

Rob
