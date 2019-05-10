From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: Re: [PATCH v5 03/12] dt-binding: gce: add binding for gce subsys
 property
Date: Fri, 10 May 2019 11:31:21 +0800
Message-ID: <1557459081.29102.4.camel@mtksdaap41>
References: <20190507081355.52630-1-bibby.hsieh@mediatek.com>
         <20190507081355.52630-4-bibby.hsieh@mediatek.com>
         <20190507174110.GA6767@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507174110.GA6767@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, CK HU <ck.hu@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com, kendrick.hsu@mediatek.com, Freder
List-Id: devicetree@vger.kernel.org

Hi, Rob,

On Tue, 2019-05-07 at 12:41 -0500, Rob Herring wrote:
> On Tue, May 07, 2019 at 04:13:46PM +0800, Bibby Hsieh wrote:
> > tcmdq driver provide a function that get the relationship
> > of sub system number from device node for client.
> > add specification for #subsys-cells, mediatek,gce-subsys.
> > 
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >  .../devicetree/bindings/mailbox/mtk-gce.txt       | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> > index 1f7f8f2a3f49..8fd9479bc9f6 100644
> > --- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> > +++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> > @@ -21,11 +21,19 @@ Required properties:
> >  	priority: Priority of GCE thread.
> >  	atomic_exec: GCE processing continuous packets of commands in atomic
> >  		way.
> > +- #subsys-cells: Should be 3.
> > +	<&phandle subsys_number start_offset size>
> > +	phandle: Label name of a gce node.
> > +	subsys_number: specify the sub-system id which is corresponding
> > +		       to the register address.
> > +	start_offset: the start offset of register address that GCE can access.
> > +	size: the total size of register address that GCE can access.
> 
> Like the #event-cells, do you need this if it isn't variable?
> 

Yes, we need. Because the start_offset and size will be a fix number
when the chip was designed out.
Those two informations will help us to check if the same register
address was wrote by different user.
The checking mechanism is designing...

> >  
> >  Required properties for a client device:
> >  - mboxes: Client use mailbox to communicate with GCE, it should have this
> >    property and list of phandle, mailbox specifiers.
> > -- mediatek,gce-subsys: u32, specify the sub-system id which is corresponding
> > +Optional propertier for a client device:
> > +- mediatek,gce-client-reg: u32, specify the sub-system id which is corresponding
> >    to the register address.
> 
> This isn't a u32, but a phandle + 3 cells (or a list of those). How many 
> entries can there be?

Ok, I will fix it.
> 
> >  
> >  Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h'
> > @@ -40,6 +48,7 @@ Example:
> >  		clocks = <&infracfg CLK_INFRA_GCE>;
> >  		clock-names = "gce";
> >  		#mbox-cells = <3>;
> > +		#subsys-cells = <3>;
> >  	};
> >  
> >  Example for a client device:
> > @@ -48,9 +57,9 @@ Example for a client device:
> >  		compatible = "mediatek,mt8173-mmsys";
> >  		mboxes = <&gce 0 CMDQ_THR_PRIO_LOWEST 1>,
> >  			 <&gce 1 CMDQ_THR_PRIO_LOWEST 1>;
> > -		mediatek,gce-subsys = <SUBSYS_1400XXXX>;
> >  		mutex-event-eof = <CMDQ_EVENT_MUTEX0_STREAM_EOF
> >  				CMDQ_EVENT_MUTEX1_STREAM_EOF>;
> > -
> > +		mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>,
> > +					  <&gce SUBSYS_1401XXXX 0x2000 0x100>;
> >  		...
> >  	};
> > -- 
> > 2.18.0
> > 

-- 
Bibby
