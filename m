From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: Re: [PATCH v3 03/12] dt-binding: gce: add binding for gce event
 property
Date: Fri, 29 Mar 2019 10:38:51 +0800
Message-ID: <1553827131.12091.8.camel@mtksdaap41>
References: <1553739573-19708-1-git-send-email-bibby.hsieh@mediatek.com>
 <1553739573-19708-4-git-send-email-bibby.hsieh@mediatek.com>
 <20190328184425.GA21602@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190328184425.GA21602@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, srv_heupstream@mediatek.com, kendrick.hsu@mediatek.com, Daoyuan Huang <daoyuan.huang@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, YT Shen <yt.shen@mediatek.com>, CK HU <ck.hu@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Frederic Chen <Frederic.Chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, ginny.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi, Rob,

Thanks for your review and comments.

On Thu, 2019-03-28 at 13:44 -0500, Rob Herring wrote:
> On Thu, Mar 28, 2019 at 10:19:24AM +0800, Bibby Hsieh wrote:
> > Client hardware would send event to GCE hardware,
> > so #event-cells, mediatek,gce-event-names, mediatek,gce-events.
> > present the event.
> > 
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 17 ++++++++++++++---
> >  1 file changed, 14 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> > index 1f7f8f2..2f175d6 100644
> > --- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> > +++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> > @@ -21,12 +21,21 @@ Required properties:
> >  	priority: Priority of GCE thread.
> >  	atomic_exec: GCE processing continuous packets of commands in atomic
> >  		way.
> > +- #event-cells: Should be 1.
> > +	<&phandle event_number>
> > +	phandle: Label name of a gce node.
> > +	event_number: the event number defined in 'dt-bindings/gce/mt8173-gce.h'
> > +		      or 'dt-binding/gce/mt8183-gce.h'.
> 
> You only need to have a #*-cells if the number is variable.
> 
I think #event-cells can be removed here.The cmdq_dev_get_event can be
modified as:

+u32 cmdq_dev_get_event(struct device *dev, const char *name)
+{
+	<... snip ...>

+	index = of_property_match_string(dev->of_node,
+					 "mediatek,gce-event-names", 
+	<... snip ...>

+
+	if (of_property_read_u32_index(dev->of_node, "mediatek,gce-events",
index, &result)) {
+		dev_err(dev, "can't parse gce-events property");
+
+		return -ENODEV;
+	}
+
+	return result;
+}
+EXPORT_SYMBOL(cmdq_dev_get_event);

> What are 'events' here? Sounds like interrupts or MSI?
Yes, events is a kind of communicating method from the other hardware
with GCE. It's likes interrupts.

> 
> >  
> >  Required properties for a client device:
> >  - mboxes: Client use mailbox to communicate with GCE, it should have this
> >    property and list of phandle, mailbox specifiers.
> >  - mediatek,gce-subsys: u32, specify the sub-system id which is corresponding
> >    to the register address.
> > +Optional propertier for a client device:
> > +- mediatek,gce-event-names: the event name can be defined by user.
> > +- mediatek,gce-events: u32, the event number defined in
> > +  'dt-bindings/gce/mt8173-gce.h' or 'dt-binding/gce/mt8183-gce.h'.
> >  
> >  Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h'
> >  or 'dt-binding/gce/mt8183-gce.h'. Such as sub-system ids, thread priority, event ids.
> > @@ -40,6 +49,7 @@ Example:
> >  		clocks = <&infracfg CLK_INFRA_GCE>;
> >  		clock-names = "gce";
> >  		#mbox-cells = <3>;
> > +		#event-cells = <1>;
> >  	};
> >  
> >  Example for a client device:
> > @@ -49,8 +59,9 @@ Example for a client device:
> >  		mboxes = <&gce 0 CMDQ_THR_PRIO_LOWEST 1>,
> >  			 <&gce 1 CMDQ_THR_PRIO_LOWEST 1>;
> >  		mediatek,gce-subsys = <SUBSYS_1400XXXX>;
> > -		mutex-event-eof = <CMDQ_EVENT_MUTEX0_STREAM_EOF
> > -				CMDQ_EVENT_MUTEX1_STREAM_EOF>;
> > -
> > +		mediatek,gce-event-names = "rdma0_sof",
> > +					   "rsz0_sof";
> > +		mediatek,gce-events = <&gce CMDQ_EVENT_MDP_RDMA0_SOF>,
> > +				      <&gce CMDQ_EVENT_MDP_RSZ0_SOF>;
> >  		...
> >  	};
> > -- 
> > 1.9.1
> > 

-- 
Bibby
