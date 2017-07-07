From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH 2/3] media: ti-vpe: cal: use
 of_graph_get_remote_endpoint()
Date: Fri, 7 Jul 2017 07:50:08 -0500
Message-ID: <20170707125007.GC28931@ti.com>
References: <87mv8tez69.wl%kuninori.morimoto.gx@renesas.com>
 <87k23xez30.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87k23xez30.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Acked-by: Benoit Parrot <bparrot@ti.com>

Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote on Wed [2017-Jun-28 00:33:00 +0000]:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Now, we can use of_graph_get_remote_endpoint(). Let's use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> based on 4c9c3d595f1bad021cc126d20879df4016801736
> ("of_graph: add of_graph_get_remote_endpoint()")
> 
>  drivers/media/platform/ti-vpe/cal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 177faa3..0c7ddf8 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -1702,7 +1702,7 @@ static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
>  	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
>  	asd->match.fwnode.fwnode = of_fwnode_handle(sensor_node);
>  
> -	remote_ep = of_parse_phandle(ep_node, "remote-endpoint", 0);
> +	remote_ep = of_graph_get_remote_endpoint(ep_node);
>  	if (!remote_ep) {
>  		ctx_dbg(3, ctx, "can't get remote-endpoint\n");
>  		goto cleanup_exit;
> -- 
> 1.9.1
> 
