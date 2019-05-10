From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v5 04/12] dt-binding: gce: add binding for gce event
 property
Date: Fri, 10 May 2019 14:48:30 +0800
Message-ID: <1557470910.20990.7.camel@mtksdaap41>
References: <20190507081355.52630-1-bibby.hsieh@mediatek.com>
         <20190507081355.52630-5-bibby.hsieh@mediatek.com>
         <1557292247.3936.5.camel@mtksdaap41> <1557458857.29102.1.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557458857.29102.1.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com, kendrick.hsu@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi, Bibby:

On Fri, 2019-05-10 at 11:27 +0800, Bibby Hsieh wrote:
> Hi, CK,
> 
> On Wed, 2019-05-08 at 13:10 +0800, CK Hu wrote:
> > Hi, Bibby:
> > 
> > On Tue, 2019-05-07 at 16:13 +0800, Bibby Hsieh wrote:
> > > Client hardware would send event to GCE hardware,
> > > mediatek,gce-event-names and mediatek,gce-events
> > > can be used to present the event.
> > > 
> > > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > > ---
> > >  Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> > > index 8fd9479bc9f6..76491f194c56 100644
> > > --- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> > > +++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> > > @@ -35,6 +35,9 @@ Required properties for a client device:
> > >  Optional propertier for a client device:
> > >  - mediatek,gce-client-reg: u32, specify the sub-system id which is corresponding
> > >    to the register address.
> > > +- mediatek,gce-event-names: the event name can be defined by user.
> > 
> > gce-event is like an interrupt from client hardware to GCE hardware, we
> > do not give a name to an interrupt, so do we need to give a name for
> > gce-event?
> > 
> 
> Yes, we need to know the name of gce-ecent.
> The name can help users to figure out the problems when GCE meet the
> event time out errors.

For debug, driver does not need this information. In your example, The
event 'CMDQ_EVENT_MDP_RDMA0_SOF' is used by rdma driver. I think rdma
driver should know why it need this event (it want to know whether 'rdma
is starting to work (SOF)'), so when this event is time out, rdma driver
should know what is timeout (it knows RDMA_SOF is timeout).

Regards,
CK

> 
> 
> > Regards,
> > CK
> > 
> > > +- mediatek,gce-events: u32, the event number defined in
> > > +  'dt-bindings/gce/mt8173-gce.h' or 'dt-binding/gce/mt8183-gce.h'.
> > >  
> > >  Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h'
> > >  or 'dt-binding/gce/mt8183-gce.h'. Such as sub-system ids, thread priority, event ids.
> > > @@ -57,8 +60,10 @@ Example for a client device:
> > >  		compatible = "mediatek,mt8173-mmsys";
> > >  		mboxes = <&gce 0 CMDQ_THR_PRIO_LOWEST 1>,
> > >  			 <&gce 1 CMDQ_THR_PRIO_LOWEST 1>;
> > > -		mutex-event-eof = <CMDQ_EVENT_MUTEX0_STREAM_EOF
> > > -				CMDQ_EVENT_MUTEX1_STREAM_EOF>;
> > > +		mediatek,gce-event-names = "rdma0_sof",
> > > +					   "rsz0_sof";
> > > +		mediatek,gce-events = <CMDQ_EVENT_MDP_RDMA0_SOF>,
> > > +				      <CMDQ_EVENT_MDP_RSZ0_SOF>;
> > >  		mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>,
> > >  					  <&gce SUBSYS_1401XXXX 0x2000 0x100>;
> > >  		...
> > 
> > 
> 
