From: Rick Chang <rick.chang@mediatek.com>
Subject: Re: [PATCH v6 3/3] arm: dts: mt2701: Add node for Mediatek JPEG
 Decoder
Date: Fri, 6 Jan 2017 10:34:59 +0800
Message-ID: <1483670099.18931.5.camel@mtksdaap41>
References: <1479353915-5043-1-git-send-email-rick.chang@mediatek.com>
 <1479353915-5043-4-git-send-email-rick.chang@mediatek.com>
 <d602365a-e87b-5bae-8698-bd43063ef079@xs4all.nl>
 <1479784905.8964.15.camel@mtksdaap41>
 <badf8125-27ed-9c5b-fbc0-75716ffdfb0e@xs4all.nl>
 <1479866054.8964.21.camel@mtksdaap41> <1479894203.8964.29.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1479894203.8964.29.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: devicetree@vger.kernel.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Hans,

The dependence on [1] has been merged in 4.10, but [2] has not.Do you have 
any idea about this patch series? Should we wait for [2] or we could merge
the source code and dt-binding first?

Best Regards,
Rick

On Wed, 2016-11-23 at 17:43 +0800, Rick Chang wrote:
> On Wed, 2016-11-23 at 09:54 +0800, Rick Chang wrote:
> > Hi Hans,
> > 
> > On Tue, 2016-11-22 at 13:43 +0100, Hans Verkuil wrote:
> > > On 22/11/16 04:21, Rick Chang wrote:
> > > > Hi Hans,
> > > >
> > > > On Mon, 2016-11-21 at 15:51 +0100, Hans Verkuil wrote:
> > > >> On 17/11/16 04:38, Rick Chang wrote:
> > > >>> Signed-off-by: Rick Chang <rick.chang@mediatek.com>
> > > >>> Signed-off-by: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
> > > >>> ---
> > > >>> This patch depends on:
> > > >>>   CCF "Add clock support for Mediatek MT2701"[1]
> > > >>>   iommu and smi "Add the dtsi node of iommu and smi for mt2701"[2]
> > > >>>
> > > >>> [1] http://lists.infradead.org/pipermail/linux-mediatek/2016-October/007271.html
> > > >>> [2] https://patchwork.kernel.org/patch/9164013/
> > > >>
> > > >> I assume that 1 & 2 will appear in 4.10? So this patch needs to go in
> > > >> after the
> > > >> other two are merged in 4.10?
> > > >>
> > > >> Regards,
> > > >>
> > > >> 	Hans
> > > >
> > > > [1] will appear in 4.10, but [2] will appear latter than 4.10.So this
> > > > patch needs to go in after [1] & [2] will be merged in 4.11.
> > > 
> > > So what should I do? Merge the driver for 4.11 and wait with this patch
> > > until [2] is merged in 4.11? Does that sound reasonable?
> > > 
> > > Regards,
> > > 
> > > 	Hans
> > 
> > What do you think about this? You merge the driver first and I send this
> > patch again after [1] & [2] is merged.
> 
> BTW, to prevent merging conflict, the dtsi should be merged by mediatek
> SoC maintainer, Matthias.I think we can only take care on the driver
> part at this moment.
> 
