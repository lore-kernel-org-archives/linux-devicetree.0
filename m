From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2 02/10] dt-binding: gce: add binding for gce event
 property
Date: Fri, 8 Mar 2019 16:47:38 +0800
Message-ID: <1552034858.2863.25.camel@mtksdaap41>
References: <1551865835-50974-1-git-send-email-bibby.hsieh@mediatek.com>
 <1551865835-50974-3-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1551865835-50974-3-git-send-email-bibby.hsieh@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, srv_heupstream@mediatek.com, kendrick.hsu@mediatek.com, Daoyuan Huang <daoyuan.huang@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Frederic Chen <Frederic.Chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, ginny.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi, Bibby:

On Wed, 2019-03-06 at 17:50 +0800, Bibby Hsieh wrote:
> cmdq driver provide a function that get event number
> from device node for client.

I think device tree is based on the view of hardware design, so you need
not to mention how the driver design. 

Client hardware would send event to GCE hardware, so this property
present this event.


> add specification for #event-cells,
> mediatek,gce-event-names, mediatek,gce-events.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> index 9c0d982..812698f 100644
> --- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> +++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> @@ -21,12 +21,20 @@ Required properties:
>  	priority: Priority of GCE thread.
>  	atomic_exec: GCE processing continuous packets of commands in atomic
>  		way.
> +- #event-cells: Should be 1.
> +	<&phandle event_number>
> +	phandle: Label name of a gce node.
> +	event_number: the event number defined in 'dt-bindings/gce/mt8173-gce.h'
> +		      or 'dt-binding/gce/mt8183-gce.h'.
>  
>  Required properties for a client device:
>  - mboxes: Client use mailbox to communicate with GCE, it should have this
>    property and list of phandle, mailbox specifiers.
>  - mediatek,gce-subsys: u32, specify the sub-system id which is corresponding
>    to the register address.
> +- mediatek,gce-event-names: the event name can be defined by user.
> +- mediatek,gce-events: u32, the event number defined in
> +  'dt-bindings/gce/mt8173-gce.h' or 'dt-binding/gce/mt8183-gce.h'.

I think both gce-subsys and gce-event are optional and depend on the
hardware design.

Regards,
CK

>  
>  Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h'
>  or 'dt-binding/gce/mt8183-gce.h'. Such as sub-system ids, thread priority, event ids.
> @@ -41,6 +49,7 @@ Example:
>  		clock-names = "gce";
>  		thread-num = CMDQ_THR_MAX_COUNT;
>  		#mbox-cells = <3>;
> +		#event-cells = <1>;
>  	};
>  
>  Example for a client device:
> @@ -50,8 +59,9 @@ Example for a client device:
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
