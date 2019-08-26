From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 01/14] dt-bindings: Add binding for MT2712 MIPI-CSI2
Date: Mon, 26 Aug 2019 17:05:36 +0300
Message-ID: <20190826140536.GE826@valkosipuli.retiisi.org.uk>
References: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
 <1559643115-15124-2-git-send-email-stu.hsieh@mediatek.com>
 <1560134057.28527.5.camel@mtksdaap41>
 <CAHD77H=vuPi2Rj4Mw-CQ2=UYX7YnS8w8FpUk0QTVxNUVLWKbJg@mail.gmail.com>
 <1560153073.31854.6.camel@mtksdaap41>
 <CAAFQd5DDE-L7mW8sTXVYOTLZ8yi3+X6Q3O73fJ61e1aUoeddgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAFQd5DDE-L7mW8sTXVYOTLZ8yi3+X6Q3O73fJ61e1aUoeddgg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stu Hsieh <stu.hsieh@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, srv_heupstream <srv_heupstream@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 10, 2019 at 04:58:02PM +0900, Tomasz Figa wrote:
> On Mon, Jun 10, 2019 at 4:51 PM CK Hu <ck.hu@mediatek.com> wrote:
> >
> > Hi, Tomasz:
> >
> > On Mon, 2019-06-10 at 12:32 +0900, Tomasz Figa wrote:
> > > Hi CK, Stu,
> > >
> > > On Mon, Jun 10, 2019 at 11:34 AM CK Hu <ck.hu@mediatek.com> wrote:
> > > >
> > > > Hi, Stu:
> > > >
> > > > "mediatek,mt2712-mipicsi" and "mediatek,mt2712-mipicsi-common" have many
> > > > common part with "mediatek,mt8183-seninf", and I've a discussion in [1],
> > > > so I would like these two to be merged together.
> > > >
> > > > [1] https://patchwork.kernel.org/patch/10979131/
> > > >
> > >
> > > Thanks CK for spotting this.
> > >
> > > I also noticed that the driver in fact handles two hardware blocks at
> > > the same time - SenInf and CamSV. Unless the architecture is very
> > > different from MT8183, I'd suggest splitting it.
> > >
> > > On a general note, the MT8183 SenInf driver has received several
> > > rounds of review comments already, but I couldn't find any comments
> > > posted for this one.
> > >
> > > Given the two aspects above and also based on my quick look at code
> > > added by this series, I'd recommend adding MT2712 support on top of
> > > the MT8183 series.
> >
> > In [1], "mediatek,mt8183-seninf" use one device to control multiple csi
> > instance, so it duplicate many register definition. In [2], one
> > "mediatek,mt2712-mipicsi" device control one csi instance, so there are
> > multiple device and the register definition does not duplicate.
> 
> I guess we didn't catch that in the review yet. It should be fixed.
> 
> > You
> > recommend adding MT2712 support on top of the MT8183 series, do you mean
> > that "mediatek,mt2712-mipicsi" should use one device to control multiple
> > csi instance and duplicate the register setting?
> 
> There are some aspects of MT8183 series that are done better than the
> MT2712 series, but apparently there are also some better aspects in
> MT2712. We should take the best aspects of both series. :)

Stu: Are the two devices similar enough or not; does this look like a
feasible approach to you?

-- 
Sakari Ailus
