From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v5 03/12] dt-binding: gce: add binding for gce subsys
 property
Date: Wed, 8 May 2019 11:43:55 +0800
Message-ID: <1557287035.3936.2.camel@mtksdaap41>
References: <20190507081355.52630-1-bibby.hsieh@mediatek.com>
         <20190507081355.52630-4-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507081355.52630-4-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com, kendrick.hsu@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi, Bibby:

On Tue, 2019-05-07 at 16:13 +0800, Bibby Hsieh wrote:
> tcmdq driver provide a function that get the relationship
> of sub system number from device node for client.
> add specification for #subsys-cells, mediatek,gce-subsys.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mtk-gce.txt       | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> index 1f7f8f2a3f49..8fd9479bc9f6 100644
> --- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> +++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> @@ -21,11 +21,19 @@ Required properties:
>  	priority: Priority of GCE thread.
>  	atomic_exec: GCE processing continuous packets of commands in atomic
>  		way.
> +- #subsys-cells: Should be 3.
> +	<&phandle subsys_number start_offset size>
> +	phandle: Label name of a gce node.
> +	subsys_number: specify the sub-system id which is corresponding
> +		       to the register address.
> +	start_offset: the start offset of register address that GCE can access.
> +	size: the total size of register address that GCE can access.
>  
>  Required properties for a client device:
>  - mboxes: Client use mailbox to communicate with GCE, it should have this
>    property and list of phandle, mailbox specifiers.
> -- mediatek,gce-subsys: u32, specify the sub-system id which is corresponding
> +Optional propertier for a client device:

properties

Regards,
CK

> +- mediatek,gce-client-reg: u32, specify the sub-system id which is corresponding
>    to the register address.
>  
>  Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h'
> @@ -40,6 +48,7 @@ Example:
>  		clocks = <&infracfg CLK_INFRA_GCE>;
>  		clock-names = "gce";
>  		#mbox-cells = <3>;
> +		#subsys-cells = <3>;
>  	};
>  
>  Example for a client device:
> @@ -48,9 +57,9 @@ Example for a client device:
>  		compatible = "mediatek,mt8173-mmsys";
>  		mboxes = <&gce 0 CMDQ_THR_PRIO_LOWEST 1>,
>  			 <&gce 1 CMDQ_THR_PRIO_LOWEST 1>;
> -		mediatek,gce-subsys = <SUBSYS_1400XXXX>;
>  		mutex-event-eof = <CMDQ_EVENT_MUTEX0_STREAM_EOF
>  				CMDQ_EVENT_MUTEX1_STREAM_EOF>;
> -
> +		mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>,
> +					  <&gce SUBSYS_1401XXXX 0x2000 0x100>;
>  		...
>  	};
