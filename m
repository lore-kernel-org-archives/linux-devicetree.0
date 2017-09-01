From: =?iso-8859-1?Q?Br=FCns=2C_Stefan?= <Stefan.Bruens@rwth-aachen.de>
Subject: Re: [PATCH 1/3] dmaengine: sun6i: Correct DMA support on H3
Date: Fri, 1 Sep 2017 14:42:47 +0000
Message-ID: <5722405.lpx0YHbn2k@sbruens-linux>
References: <20170830233609.13855-1-stefan.bruens@rwth-aachen.de>
 <a649f98d4ac44abc873c5110ce9363e5@rwthex-w2-b.rwth-ad.de>
 <20170901133549.cr2ivmfr5mnrdujg@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170901133549.cr2ivmfr5mnrdujg@flea>
Content-Language: en-US
Content-ID: <A6C847B31318F84DA1549A1C38771119@rwth-ad.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-sunxi <linux-sunxi@googlegroups.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Freitag, 1. September 2017 15:35:49 CEST Maxime Ripard wrote:
> On Fri, Sep 01, 2017 at 05:04:54AM +0200, Stefan Bruens wrote:
> > On Donnerstag, 31. August 2017 16:51:35 CEST Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Thu, Aug 31, 2017 at 01:36:07AM +0200, Stefan Brüns wrote:
> > > > +/* Between SoC generations, there are some significant differences:
> > > > + * - A23 added a clock gate register
> > > > + * - the H3 burst length field has a different offset
> > > > + */
> > > 
> > > This is not the proper comment style.
> > > 
> > > > +enum dmac_variant {
> > > > +	DMAC_VARIANT_A31,
> > > > +	DMAC_VARIANT_A23,
> > > > +	DMAC_VARIANT_H3,
> > > > +};
> > > > +
> > > 
> > > And this is redundant with what we already have in our structures.
> > 
> > Actually, its not. For H3, there are currently at least 3 register
> > compatible SoCs: H5 is identical, R40 has 16 dma channels, A64 has 8
> > channels. So if the current config structure is kept, we need 3 different
> > compatible strings. Same for the A23, which is register compatible to
> > e.g. A83t and V3s, but with different numbers of DMA channels.
> > 
> > So either you decorate the code with a cascade of
> > 
> > if ((of_is_compatible(..A23..) || of_is_compatible(..A83T..) || ...) {
> > } else if ((of_is_compatible(..H3..) || of_is_compatible(..A64..) || ...)
> > {
> > } else { /* A31 */
> > }
> > 
> > in a number of places, or you do it just once.
> 
> That's not how you retrieve the structures. They are already
> associated to the compatible, and you need to do a single lookup to
> get them. So that's nowhere near what you're suggesting. You can have
> a look at the of_match_device in the probe function.
> 


Please have a look at the current implementation of how the clock autogating 
in the probe function is done - it matches with the compatible string.

Of course we can replace this with a match between sdev->config and the 
various sun6i_dma_config instances, but we would still have to do 3 matches 
for the A23 register configuration (A23 || A83T || V3s) and 3 matches for the 
H3 register configuration (H3 || R40 || A64). There are currently *7* 
different configs (V3s, R40 and A64 taken into account), but only 3 different 
register variants.

This is the same rationale as the "gate_needed" boolean property proposed by 
Icenowy Zheng in the "Allwinner V3s DMA support" patch series. Obviously we 
don't need a boolean, but a ternary option to cater for the gate_needed 
differences - "NO_GATE", "A23_STYLE_GATE", "H3_STYLE_GATE".

Kind regards,

Stefan
