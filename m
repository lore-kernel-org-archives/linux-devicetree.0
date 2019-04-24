From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 03/12] dt-binding: gce: add binding for gce event
 property
Date: Wed, 24 Apr 2019 14:56:21 -0500
Message-ID: <20190424195621.GC7270@bogus>
References: <20190415125833.38704-1-bibby.hsieh@mediatek.com>
 <20190415125833.38704-4-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190415125833.38704-4-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, CK HU <ck.hu@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com, kendrick.hsu@mediatek.com, Frederic Chen <Frederic.Chen@med>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 15, 2019 at 08:58:24PM +0800, Bibby Hsieh wrote:
> Client hardware would send event to GCE hardware,
> so #event-cells, mediatek,gce-event-names, mediatek,gce-events.
> present the event.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mtk-gce.txt     | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> index 1f7f8f2a3f49..2f175d6b296d 100644
> --- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> +++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> @@ -21,12 +21,21 @@ Required properties:
>  	priority: Priority of GCE thread.
>  	atomic_exec: GCE processing continuous packets of commands in atomic
>  		way.
> +- #event-cells: Should be 1.
> +	<&phandle event_number>
> +	phandle: Label name of a gce node.
> +	event_number: the event number defined in 'dt-bindings/gce/mt8173-gce.h'
> +		      or 'dt-binding/gce/mt8183-gce.h'.

I thought you were going to remove this.

>  
>  Required properties for a client device:
>  - mboxes: Client use mailbox to communicate with GCE, it should have this
>    property and list of phandle, mailbox specifiers.
>  - mediatek,gce-subsys: u32, specify the sub-system id which is corresponding
>    to the register address.
> +Optional propertier for a client device:
> +- mediatek,gce-event-names: the event name can be defined by user.
> +- mediatek,gce-events: u32, the event number defined in
> +  'dt-bindings/gce/mt8173-gce.h' or 'dt-binding/gce/mt8183-gce.h'.

>From the example, looks like a phandle plus 1 cell.

>  
>  Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h'
>  or 'dt-binding/gce/mt8183-gce.h'. Such as sub-system ids, thread priority, event ids.
> @@ -40,6 +49,7 @@ Example:
>  		clocks = <&infracfg CLK_INFRA_GCE>;
>  		clock-names = "gce";
>  		#mbox-cells = <3>;
> +		#event-cells = <1>;
>  	};
>  
>  Example for a client device:
> @@ -49,8 +59,9 @@ Example for a client device:
>  		mboxes = <&gce 0 CMDQ_THR_PRIO_LOWEST 1>,
>  			 <&gce 1 CMDQ_THR_PRIO_LOWEST 1>;
>  		mediatek,gce-subsys = <SUBSYS_1400XXXX>;
> -		mutex-event-eof = <CMDQ_EVENT_MUTEX0_STREAM_EOF
> -				CMDQ_EVENT_MUTEX1_STREAM_EOF>;
> -
> +		mediatek,gce-event-names = "rdma0_sof",
> +					   "rsz0_sof";
> +		mediatek,gce-events = <&gce CMDQ_EVENT_MDP_RDMA0_SOF>,
> +				      <&gce CMDQ_EVENT_MDP_RSZ0_SOF>;
>  		...
>  	};
> -- 
> 2.18.0
> 
